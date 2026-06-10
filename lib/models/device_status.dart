class DeviceStatus {
  final int heatScore;

  final String heatState;

  final int? battery;

  final String performance;

  final String memory;

  final String platform;

  final String screen;

  final DateTime updated;

  const DeviceStatus({
    required this.heatScore,
    required this.heatState,
    required this.battery,
    required this.performance,
    required this.memory,
    required this.platform,
    required this.screen,
    required this.updated,
  });

  DeviceStatus copyWith({
    int? heatScore,
    String? heatState,
    int? battery,
    String? performance,
    String? memory,
    String? platform,
    String? screen,
    DateTime? updated,
  }) {
    return DeviceStatus(
      heatScore: heatScore ?? this.heatScore,
      heatState: heatState ?? this.heatState,
      battery: battery ?? this.battery,
      performance: performance ?? this.performance,
      memory: memory ?? this.memory,
      platform: platform ?? this.platform,
      screen: screen ?? this.screen,
      updated: updated ?? this.updated,
    );
  }

  factory DeviceStatus.demo() {
    return DeviceStatus(
      heatScore: 91,
      heatState: "Running Cool",
      battery: null,
      performance: "Excellent",
      memory: "Web Runtime",
      platform: "Flutter Web",
      screen: "Responsive",
      updated: DateTime.now(),
    );
  }
}