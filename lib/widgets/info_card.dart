import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class InfoCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final Color color;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovering = true),
      onExit: (_) => setState(() => hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: hovering
              ? Colors.white.withValues(alpha: .08)
              : AppColors.card,
          border: Border.all(
            color: Colors.white.withValues(alpha: .05),
          ),
          boxShadow: [
            BoxShadow(
              color: widget.color.withValues(alpha: .08),
              blurRadius: hovering ? 25 : 10,
              spreadRadius: hovering ? 2 : 0,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color.withValues(alpha: .15),
              ),
              child: Icon(
                widget.icon,
                color: widget.color,
                size: hovering ? 36 : 32,
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: Text(
                      widget.value,
                      key: ValueKey(widget.value),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 1500),
                      tween: Tween(begin: 0, end: .88),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, child) {
                        return LinearProgressIndicator(
                          value: value,
                          minHeight: 7,
                          backgroundColor: Colors.white10,
                          valueColor: AlwaysStoppedAnimation(
                            widget.color,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: widget.color,
                          shape: BoxShape.circle,
                        ),
                      ),

                      const SizedBox(width: 8),

                      const Text(
                        "Active",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),

                      const Spacer(),

                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                        color: Colors.white.withValues(alpha: .5),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}