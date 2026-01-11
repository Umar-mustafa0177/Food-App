import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyButton extends StatefulWidget {
  final VoidCallback? onTap;
  final String text;
  final bool isLoading;
  final bool isDestructive;
  final double? width;
  final EdgeInsets? margin;

  const MyButton({
    super.key,
    required this.text,
    this.onTap,
    this.isLoading = false,
    this.isDestructive = false,
    this.width,
    this.margin,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120), // Thoda fast response for modern feel
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails _) {
    if (widget.onTap != null && !widget.isLoading) {
      _controller.forward();
      HapticFeedback.mediumImpact(); // Medium impact feel better on buttons
    }
  }

  void _handleTapUp(TapUpDetails _) => _controller.reverse();
  void _handleTapCancel() => _controller.reverse();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isEnabled = widget.onTap != null && !widget.isLoading;

    // Modern Color Palette Logic
    final baseColor = widget.isDestructive
        ? theme.colorScheme.error
        : theme.colorScheme.primary;

    final backgroundColor = isEnabled
        ? baseColor
        : baseColor.withOpacity(0.4);

    final textColor = widget.isDestructive
        ? theme.colorScheme.onError
        : theme.colorScheme.onPrimary;

    return Padding(
      padding: widget.margin ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: GestureDetector(
        onTap: isEnabled ? widget.onTap : null,
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Container(
                width: widget.width ?? double.infinity,
                height: 54, // Optimal modern height
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(18), // Slightly more rounded
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1), // Subtle inner glow
                    width: 1,
                  ),
                  boxShadow: isEnabled
                      ? [
                    BoxShadow(
                      color: baseColor.withOpacity(0.25),
                      blurRadius: 15,
                      offset: const Offset(0, 6),
                    ),
                  ]
                      : null,
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: widget.isLoading
                        ? SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(
                        color: textColor,
                        strokeWidth: 2.5,
                      ),
                    )
                        : Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700, // Thoda bold for hierarchy
                        color: textColor,
                        letterSpacing: 0.2, // Clean spacing
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}