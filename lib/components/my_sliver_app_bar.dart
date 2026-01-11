import 'package:flutter/material.dart';
import 'package:mynew_project/pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  final PreferredSizeWidget? bottom;

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SliverAppBar(
      expandedHeight: 320.0,
      collapsedHeight: 120.0,
      floating: false,
      pinned: true,
      stretch: true,
      elevation: 0,
      backgroundColor: colorScheme.surface,
      surfaceTintColor: colorScheme.surface,

      bottom: bottom,

      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Material(
                color: colorScheme.primary.withOpacity(0.1),
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: colorScheme.primary,
                    size: 24,
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],

      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            // Subtle gradient for depth
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colorScheme.primary.withOpacity(0.05),
                colorScheme.surface,
              ],
            ),
          ),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(bottom: 60),
        expandedTitleScale: 1.0,
      ),
    );
  }
}