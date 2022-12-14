import 'package:flutter/material.dart';
import 'package:trippo/core/config/app_text_styles.dart';
import 'package:trippo/core/constants/icons/trippo_icons.dart';
import 'package:trippo/core/widgets/main_rating_bar.dart';

import 'cache_image.dart';

class PlaceTile extends StatelessWidget {
  const PlaceTile({
    Key? key,
    required this.size,
    required this.imageUrl,
  }) : super(key: key);

  final Size size;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * .6,
      child: Column(
        children: [
          Stack(
            children: [
              CacheImage(
                imageUrl: imageUrl,
                width: size.width * .65,
                height: size.width * .4,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 1.5,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(size.width * .025),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    Container(
                      width: size.width * .1,
                      height: size.width * .1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(.6),
                      ),
                      child: Icon(
                        TrippoIcons.favorite,
                        color: Theme.of(context).errorColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: size.width * .025),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Crown plaza antalya, an IHD hotel room',
                style: AppTextStyles.styleWeight400(
                  fontSize: size.width * .0375,
                ),
              ),
              SizedBox(height: size.width * .01),
              Row(
                children: [
                  const MainRatingBar(),
                  SizedBox(width: size.width * .02),
                  Text(
                    '56,645',
                    style: AppTextStyles.styleWeight600(
                      color: Colors.grey,
                      fontSize: size.width * .03,
                    ),
                  )
                ],
              ),
              SizedBox(height: size.width * .01),
              Text(
                'Syria, Aleppo',
                style: AppTextStyles.styleWeight500(
                  fontSize: size.width * .04,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
