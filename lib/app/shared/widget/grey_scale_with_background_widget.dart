import 'package:flutter/widgets.dart';
import 'package:hirelyticsinc/core/config/theme/app_colors.dart';

class GreyScaleWithBackgroundWidget extends StatelessWidget {
  final Widget child;

  const GreyScaleWithBackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(
        [
          // Adjusting brightness (91%) and grayscale (saturate(0%))
          0.2126 * 0.91, 0.7152 * 0.91, 0.0722 * 0.91, 0, 0, // Red

          0.2126 * 0.91, 0.7152 * 0.91, 0.0722 * 0.91, 0, 0, // Green

          0.2126 * 0.91, 0.7152 * 0.91, 0.0722 * 0.91, 0, 0, // Blue

          0, 0, 0, 1, 10, // Alpha
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ColoredBox(
          color: AppColors.colorWhite,
          child: child,
        ),
      ),
    );
  }
}
