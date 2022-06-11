import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MainRatingBar extends StatelessWidget {
<<<<<<< Updated upstream
  const MainRatingBar({
    Key? key,
    this.circleSize,
  }) : super(key: key);
  final double? circleSize;
=======
  const MainRatingBar({Key? key, this.filterRating = 0, this.isFiter = false})
      : super(key: key);
  final double filterRating;
  final bool isFiter;
>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RatingBar(
<<<<<<< Updated upstream
      itemSize:circleSize?? size.width * .035,
=======
      initialRating: isFiter?filterRating:0,
      itemSize: size.width * .035,
>>>>>>> Stashed changes
      itemPadding: EdgeInsetsDirectional.only(
        end: size.width * .005,
      ),
      unratedColor: Theme.of(context).scaffoldBackgroundColor,
      allowHalfRating: true,
      ignoreGestures: isFiter?true: false,
      ratingWidget: RatingWidget(
        full: Container(
          width: circleSize ?? size.width * .035,
          height: circleSize ?? size.width * .035,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        half: Container(
          width: circleSize ?? size.width * .035,
          height: circleSize ?? size.width * .035,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        empty: Container(
          width: circleSize ?? size.width * .035,
          height: circleSize ?? size.width * .035,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      onRatingUpdate: (rate) {},
    );
  }
}
