enum NotificationType {
  none,
  openApp;

  factory NotificationType.fromValue(String value) {
    return switch (value) {
      'open_app' => NotificationType.openApp,
      _ => NotificationType.none,
    };
  }
}
