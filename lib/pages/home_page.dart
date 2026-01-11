import 'package:flutter/material.dart';
import 'package:mynew_project/components/my_current_location.dart';
import 'package:mynew_project/components/my_description_box.dart';
import 'package:mynew_project/components/my_drawer.dart';
import 'package:mynew_project/components/my_food_tile.dart';
import 'package:mynew_project/components/my_sliver_app_bar.dart';
import 'package:mynew_project/components/my_tab_bar.dart';
import 'package:mynew_project/models/food.dart';
import 'package:mynew_project/models/restaurant.dart';
import 'package:mynew_project/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FoodPage(food: food)),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      drawer: const MyDrawer(),
      backgroundColor: colorScheme.surface,
      body: Consumer<Restaurant>(
        builder: (context, restaurant, child) => NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MySliverAppBar(
              // Title remove kar ke empty widget de diya
              title: const SizedBox.shrink(),
              bottom: MyTabBar(tabController: _tabController),
              child: Container(
                // Spacing adjust ki taake content center-aligned lage
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 75),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    MyDescriptionBox(),
                    SizedBox(height: 16),
                    MyCurrentLocation(),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
        ),
      ),
    );
  }
}