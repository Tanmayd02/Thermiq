import 'package:flutter/material.dart';

import '../models/device_status.dart';
import '../services/device_service.dart';
import '../utils/app_colors.dart';
import '../widgets/hero_card.dart';
import '../widgets/info_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DeviceStatus status = DeviceService().getStatus(context);

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "🔥 ThermIQ",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            letterSpacing: -.5,
          ),
        ),
      ),

      body: Stack(
        children: [
          Positioned(
            top: -120,
            right: -100,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange.withValues(alpha: .08),
              ),
            ),
          ),

          Positioned(
            bottom: -120,
            left: -120,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepOrange.withValues(alpha: .05),
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 1100,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    10,
                    20,
                    40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 700),
                        tween: Tween(begin: 0, end: 1),
                        builder: (context, opacity, child) {
                          return Opacity(
                            opacity: opacity,
                            child: Transform.translate(
                              offset: Offset(
                                0,
                                (1 - opacity) * 30,
                              ),
                              child: child,
                            ),
                          );
                        },
                        child: HeroCard(
                          status: status,
                        ),
                      ),

                      TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 900),
                        tween: Tween(begin: 0, end: 1),
                        builder: (context, opacity, child) {
                          return Opacity(
                            opacity: opacity,
                            child: Transform.translate(
                              offset: Offset(
                                0,
                                (1 - opacity) * 20,
                              ),
                              child: child,
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            InfoCard(
                              icon: Icons.speed,
                              title: "Performance",
                              value: status.performance,
                              color: AppColors.blue,
                            ),

                            InfoCard(
                              icon: Icons.memory,
                              title: "Memory",
                              value: status.memory,
                              color: AppColors.purple,
                            ),

                            InfoCard(
                              icon: Icons.devices,
                              title: "Platform",
                              value: status.platform,
                              color: AppColors.green,
                            ),

                            InfoCard(
                              icon: Icons.monitor,
                              title: "Screen",
                              value: status.screen,
                              color: AppColors.orange,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),
                      Container(
  padding: const EdgeInsets.symmetric(
    horizontal: 28,
    vertical: 28,
  ),
  decoration: BoxDecoration(
    color: Colors.white.withValues(alpha: .04),
    borderRadius: BorderRadius.circular(28),
    border: Border.all(
      color: Colors.white.withValues(alpha: .06),
    ),
  ),
  child: Column(
    children: [
      const Icon(
        Icons.local_fire_department,
        color: Colors.orange,
        size: 30,
      ),

      const SizedBox(height: 14),

      const Text(
        "ThermIQ",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          letterSpacing: -.5,
        ),
      ),

      const SizedBox(height: 8),

      const Text(
        "First Flutter project • Built and shipped in 2 hours",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15,
          height: 1.5,
        ),
      ),

      const SizedBox(height: 20),

      Divider(
        color: Colors.white.withValues(alpha: .08),
      ),

      const SizedBox(height: 20),

      const Text(
        "🚀 Started at 3:00 AM • Deployed by 5:30 AM",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),

      const SizedBox(height: 8),

      const Text(
        "10 June 2026",
        style: TextStyle(
          color: Colors.orangeAccent,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 18),

      const Text(
        "Installed Flutter for the first time.\nDesigned, built and shipped ThermIQ in one sitting.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          height: 1.6,
        ),
      ),

      const SizedBox(height: 22),

      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.orange.withValues(alpha: .10),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: Colors.orange.withValues(alpha: .25),
          ),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          
          // children: [
          //   Icon(
          //     Icons.favorite,
          //     size: 16,
          //     color: Colors.redAccent,
          //   ),
          //   SizedBox(width: 8),
          //   Text(
          //     "Built with love by T",
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       color: Colors.white,
          //     ),
          //   ),
          //    SizedBox(width: 8),
          //   Icon(
          //     Icons.favorite,
          //     size: 16,
          //     color: Colors.redAccent,
          //   ),
          // ],
          children: [
      Icon(
        Icons.favorite_border_rounded,
        size: 18,
        color: Colors.orangeAccent,
      ),

      SizedBox(width: 10),

      Text(
        "Built with love by T",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      SizedBox(width: 10),
            Icon(
        Icons.favorite_border_rounded,
        size: 18,
        color: Colors.orangeAccent,
      ),

    ],
        ),
      ),

      const SizedBox(height: 20),

      Text(
        "ThermIQ v0.1.0",
        style: TextStyle(
          color: Colors.white.withValues(alpha: .50),
          fontSize: 12,
          letterSpacing: 1,
        ),
      ),
    ],
  ),
),
                      // Container(
                      //   padding: const EdgeInsets.all(24),
                      //   decoration: BoxDecoration(
                      //     color: Colors.white.withValues(alpha: .04),
                      //     borderRadius: BorderRadius.circular(28),
                      //     border: Border.all(
                      //       color: Colors.white.withValues(alpha: .05),
                      //     ),
                      //   ),
                      //   child: const Column(
                      //     children: [
                      //       Icon(
                      //         Icons.favorite,
                      //         color: Colors.redAccent,
                      //         size: 18,
                      //       ),

                      //       SizedBox(height: 12),

                      //       Text(
                      //         "ThermIQ",
                      //         style: TextStyle(
                      //           fontSize: 22,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),

                      //       SizedBox(height: 6),

                      //       Text(
                      //         "Real-time Device Health Dashboard",
                      //         textAlign: TextAlign.center,
                      //         style: TextStyle(
                      //           color: Colors.grey,
                      //           fontSize: 15,
                      //         ),
                      //       ),

                      //       SizedBox(height: 14),

                      //       Divider(
                      //         color: Colors.white10,
                      //       ),

                      //       SizedBox(height: 14),

                      //       Text(
                      //         "Built overnight with Flutter",
                      //         style: TextStyle(
                      //           color: Colors.grey,
                      //         ),
                      //       ),

                      //       SizedBox(height: 6),

                      //       Text(
                      //         "Version 0.1.0",
                      //         style: TextStyle(
                      //           color: Colors.grey,
                      //           fontSize: 13,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}