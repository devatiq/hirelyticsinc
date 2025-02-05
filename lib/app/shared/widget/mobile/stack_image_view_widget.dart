import 'package:flutter/widgets.dart';
import 'package:hirelyticsinc/core/config/theme/app_colors.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';

class StackImageViewWidget extends StatelessWidget {
  final String bigImage;
  final String smallImage;
  final double? smallImageAlignmentTop;
  final double? smallImageAlignmentBottom;
  final double? smallImageAlignmentRight;
  final double? smallImageAlignmentLeft;

  const StackImageViewWidget(
      {super.key,
      required this.bigImage,
      required this.smallImage,
      this.smallImageAlignmentTop,
      this.smallImageAlignmentBottom,
      this.smallImageAlignmentRight,
      this.smallImageAlignmentLeft});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final maxHeight = constraints.maxHeight;

          final bigImageHeight = maxHeight * 0.6;
          final smallImageHeight = maxHeight * 0.45;
          final smallImageWidth = maxWidth * 0.7;

          return Stack(
            children: [
              Positioned(
                top: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimens.borderRadius16),
                  child: Transform.flip(
                    flipX: true,
                    child: Image.asset(
                      bigImage,
                      height: bigImageHeight,
                      width: maxWidth,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: smallImageAlignmentLeft,
                top: smallImageAlignmentTop,
                right: smallImageAlignmentRight,
                bottom: smallImageAlignmentBottom,
                child: Container(
                  height: smallImageHeight,
                  width: smallImageWidth,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: Dimens.itemSize10,
                        color: AppColors.colorWhite,
                        strokeAlign: BorderSide.strokeAlignOutside),
                    borderRadius: BorderRadius.circular(Dimens.borderRadius16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimens.borderRadius16),
                    child: Image.asset(
                      smallImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
