import '../../config/theme/app_colors.dart';

enum MessageType{
  normal, error, info, warning, success;
}

getMessageColor(MessageType type) {
  switch (type) {
    case MessageType.normal:
      return AppColors.colorAppBlueDark;
      break;
    case MessageType.error:
      return  AppColors.colorAppRed;
      break;
    case MessageType.info:
      return AppColors.colorAppGrey;
      break;
    case MessageType.success:
      return  AppColors.colorAppGreen;
      break;
    case MessageType.warning:
      return  AppColors.colorAppYellow;
      break;
  }
}