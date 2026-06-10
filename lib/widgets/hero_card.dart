import 'package:flutter/material.dart';

import '../models/device_status.dart';

class HeroCard extends StatelessWidget {
  final DeviceStatus status;

  const HeroCard({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1800),
      curve: Curves.easeOutCubic,
      tween: Tween(
        begin: 0,
        end: status.heatScore.toDouble(),
      ),
      builder: (context, value, child) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 28,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffFF5F00),
                Color(0xffFF7B00),
                Color(0xffFFB347),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withValues(alpha: .20),
                blurRadius: 40,
                spreadRadius: 4,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Column(
            children: [
              TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 1000),
                tween: Tween(begin: .75, end: 1),
                curve: Curves.elasticOut,
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: .15),
                      ),
                      child: const Icon(
                        Icons.local_fire_department,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              Text(
                value.toInt().toString(),
                style: const TextStyle(
                  fontSize: 78,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  height: .9,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "THERMIQ HEALTH INDEX",
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  letterSpacing: 4,
                ),
              ),

              const SizedBox(height: 22),

              Text(
                status.heatState,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 18),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white.withValues(alpha: .15),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: .18),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.greenAccent,
                      size: 10,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "LIVE",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 18),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _Metric(
                    icon: Icons.speed,
                    label: "Score",
                    value: "${status.heatScore}",
                  ),
                  _Metric(
                    icon: Icons.monitor,
                    label: "Platform",
                    value: status.platform,
                  ),
                  _Metric(
                    icon: Icons.access_time,
                    label: "Updated",
                    value:
                        "${status.updated.hour}:${status.updated.minute.toString().padLeft(2, '0')}",
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Metric extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _Metric({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white70,
          size: 20,
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}