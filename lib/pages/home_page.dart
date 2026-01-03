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

  // Filter foods by category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // Return list of ListViews for TabBarView
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          //get individual food
          final food = categoryMenu[index];
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> FoodPage(food: food),
            ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: Consumer<Restaurant>(
        builder: (context, restaurant, child) => NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MySliverAppBar(
              title: MyTabBar(tabController: _tabController),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Colors.grey, // or Theme.of(context).colorScheme.secondary,
                  ),
                  MyCurrentLocation(),
                  MyDescriptionBox(),
                ],
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
