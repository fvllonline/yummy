import 'package:flutter/material.dart';
import 'components/category_card.dart';
import 'components/post_card.dart';
import 'components/restaurant_card.dart';
import 'components/theme_button.dart';
import 'components/color_button.dart';
import 'constants.dart';
import 'models/models.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.changeTheme,
    required this.changeColor,
    required this.colorSelected,
  });

  final void Function(bool) changeTheme;
  final void Function(int) changeColor;
  final ColorSelection colorSelected;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
      ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostCard(post: posts[index]);
        },
      ),
      ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return RestaurantCard(restaurant: restaurants[index]);
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yummy'),
        actions: [
          ThemeButton(changeThemeMode: widget.changeTheme),
          ColorButton(
            changeColor: widget.changeColor,
            colorSelected: widget.colorSelected,
          ),
        ],
      ),
      body: IndexedStack(
        index: tab,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (index) {
          setState(() {
            tab = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.category_outlined),
            label: 'Category',
          ),
          NavigationDestination(
            icon: Icon(Icons.post_add_outlined),
            label: 'Post',
          ),
          NavigationDestination(
            icon: Icon(Icons.restaurant_outlined),
            label: 'Restaurant',
          ),
        ],
      ),
    );
  }
}
