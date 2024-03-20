import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_imp_clean_architecture_bloc/core/resources/consts.dart';
import 'package:news_app_imp_clean_architecture_bloc/core/utils/extensions.dart';

class NewsArtileTiles extends StatelessWidget {
  const NewsArtileTiles(
      {super.key,
      required this.image,
      required this.title,
      required this.date});
  final String? image;
  final String? title;
  final String? date;
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 150.h,
          width: 110.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              imageUrl: image ?? defaultImg,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => Image.network(
                defaultImg,
                fit: BoxFit.cover,
              ),
              fit: BoxFit.fitHeight,
              // height: 100,
              // width: 100,
            ),
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        Container(
          width: 220.w,
          height: 150.h,
          // padding: EdgeInsets.symmetric(ho,vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[100],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                child: Text(
                  title ?? "title",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              )),
              // author
              divider,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.date_range),
                    12.pw,
                    Text(
                      date ?? "no datetime",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
