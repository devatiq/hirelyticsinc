import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/app/presentation/blogs/provider/blogs_provider.dart';
import 'package:hirelyticsinc/app/presentation/blogs/widgets/mobile/mobile_blog_single_item.dart';
import 'package:hirelyticsinc/core/config/theme/app_colors.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';
import 'package:hirelyticsinc/core/utils/extension/color_extension.dart';
import 'package:hirelyticsinc/core/utils/helper/common_style.dart';
import 'package:hirelyticsinc/core/utils/style/text_styles.dart';

class MobileBlogsSection extends ConsumerWidget {
  const MobileBlogsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(blogProvider);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.horizontalSpace),
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Text(
            'Latest Blog Post',
            style: AppTextStyles.titleTextStyle(context,
                fontSize: Dimens.fontSize25),
          ),
          const Gap(16),
          provider.when(
            data: (blogs) => ListView.separated(
              itemCount: blogs.length,
              shrinkWrap: true,
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => Gap(Dimens.padding16),
              itemBuilder: (_, index) {
                return MobileBlogSingleItem(item: blogs[index]);
              },
            ),
            error: (error, stackTrace) => Html(data: error.toString()),
            loading: () => CircularProgressIndicator(),
          ),
          // Consumer(
          //   builder: (context, ref, child) {
          //     final blogs = ref.watch(blogPaginationProvider);
          //     final blogNotifier = ref.read(blogPaginationProvider.notifier);
          //     return ListView.builder(
          //         // extra item for the loading indicator
          //         itemCount: blogs.length + 1,
          //         shrinkWrap: true,
          //         primary: false,
          //         physics: NeverScrollableScrollPhysics(),
          //         itemBuilder: (context, index) {
          //           if (index < blogs.length) {
          //             return MobileBlogSingleItem(item: blogs[index]);
          //           } else if (blogNotifier.hasMore) {
          //             blogNotifier.fetchBlogs();
          //             return Center(child: CircularProgressIndicator());
          //           } else {
          //             return SizedBox.shrink();
          //           }
          //         });
          //   },
          // ),
        ],
      ),
    );
  }
}
