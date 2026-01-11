import 'package:flutter/material.dart';
import 'package:mynew_project/models/food.dart';

// 1. "implements PreferredSizeWidget" add karein
class MyTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;

  const MyTabBar({
    super.key,
    required this.tabController,
  });

  // 2. Yeh getter add karein jo height define karega (humne height 60 rakhi thi)
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 60, // Preferred size ke barabar height
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outlineVariant.withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        dividerColor: Colors.transparent,

        indicator: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        indicatorSize: TabBarIndicatorSize.tab,

        labelColor: Colors.white,
        unselectedLabelColor: colorScheme.onSurfaceVariant,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.2,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),

        tabs: FoodCategory.values.map((category) {
          final name = category.toString().split('.').last;
          return Tab(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(_formatCategoryName(name)),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _formatCategoryName(String raw) {
    if (raw.isEmpty) return "";
    return raw[0].toUpperCase() + raw.substring(1).toLowerCase();
  }
}