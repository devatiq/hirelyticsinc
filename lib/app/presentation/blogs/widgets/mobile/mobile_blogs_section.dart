import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hirelyticsinc/app/presentation/blogs/provider/blogs_provider.dart';
import 'package:hirelyticsinc/app/presentation/blogs/widgets/mobile/mobile_blog_single_item.dart';
import 'package:hirelyticsinc/core/utils/constants/dimens.dart';
import 'package:hirelyticsinc/core/utils/style/text_styles.dart';

import '../../../../../core/utils/constants/strings.dart';

class MobileBlogsSection extends StatelessWidget {
  const MobileBlogsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.horizontalSpace),
      child: Column(
        children: [
          Text(
            latestBlogPosts,
            style: AppTextStyles.titleTextStyle(context,
                fontSize: Dimens.fontSize25),
          ),
          const Gap(16),
          Consumer(
            builder: (context, ref, child) {
              final blogs = ref.watch(blogPaginationProvider);
              final blogNotifier = ref.read(blogPaginationProvider.notifier);

              if (blogs.isEmpty) {
                return Center(
                    child: Row(
                  children: [
                    const Expanded(child: Divider(endIndent: Dimens.padding16)),
                    Text(
                      noBlogsFound,
                      style: AppTextStyles.subtitleTextStyle(context,
                          fontSize: Dimens.fontSize16),
                    ),
                    const Expanded(child: Divider(indent: Dimens.padding16)),
                  ],
                ));
              }

              return ListView.separated(
                  // extra item for the loading indicator
                  itemCount: blogs.length + 1,
                  shrinkWrap: true,
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const Gap(Dimens.padding16),
                  itemBuilder: (context, index) {
                    if (index < blogs.length) {
                      return MobileBlogSingleItem(item: blogs[index]);
                    } else if (blogNotifier.hasMore) {
                      blogNotifier.fetchBlogs();
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const SizedBox.shrink();
                    }
                  });
            },
          ),
        ],
      ),
    );
  }
}
