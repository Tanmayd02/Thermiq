import 'package:flutter/material.dart';

import '../models/device_status.dart';

class DeviceService {
  DeviceStatus getStatus(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DeviceStatus(
      heatScore: 91,
      heatState: "Running Cool",
      battery: null,
      performance: "Excellent",
      memory: "Web Runtime",
      platform: Theme.of(context).platform.name,
      screen:
          "${size.width.toInt()} x ${size.height.toInt()}",
      updated: DateTime.now(),
    );
  }
}