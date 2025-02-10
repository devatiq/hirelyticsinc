import '../../config/theme/app_colors.dart';

enum MessageType {
  normal,
  error,
  info,
  warning,
  success;
}

getMessageColor(MessageType type) {
  switch (type) {
    case MessageType.normal:
      return AppColors.colorAppBlueDark;

    case MessageType.error:
      return AppColors.colorAppRed;

    case MessageType.info:
      return AppColors.colorAppGrey;

    case MessageType.success:
      return AppColors.colorAppGreen;

    case MessageType.warning:
      return AppColors.colorAppYellow;
  }
}
