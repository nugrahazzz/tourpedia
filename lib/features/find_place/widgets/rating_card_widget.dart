import 'package:flutter/material.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:tourpedia/core/app/extensions.dart';
import 'package:tourpedia/core/utils/resources/color_manager.dart';
import 'package:tourpedia/core/utils/resources/font_manager.dart';
import 'package:tourpedia/features/find_place/model/review.dart';

class RatingCardWidget extends StatelessWidget {
  final Review review;

  const RatingCardWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2.0.wp),
          Row(
            children: [
              CircleAvatar(
                child: Text(
                  review.name[0],
                  style: TextStyles.poppinsBold.copyWith(color: ColorManager.bgDark),
                ),
              ),
              SizedBox(width: 3.0.wp),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.name,
                    style: TextStyles.poppinsBold.copyWith(
                        color: ColorManager.bgDark.withOpacity(0.8),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    review.date,
                    style: TextStyles.poppinsRegular.copyWith(
                        color: ColorManager.bgDark.withOpacity(0.75),
                        fontSize: 3.0.wp),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 3.0.wp),
          Text(
            review.review,
            textAlign: TextAlign.justify,
            style: TextStyles.poppinsRegular.copyWith(fontSize: 4.0.wp),
          ),
          SizedBox(height: 2.0.wp),
          EmojiFeedback(
            customLabels: const ["Terible", "Bad", "Good", "Nice", "Love it"],
            onChanged: (index) {},
            initialRating: review.rating.toInt(),
            inactiveElementScale: .5,
            inactiveElementBlendColor: ColorManager.white.withOpacity(0.85),
            showLabel: true,
            labelTextStyle: const TextStyle(fontWeight: FontWeight.bold),
            elementSize: 10.0.wp,
          ),
          SizedBox(height: 2.0.wp),

        ],
      ),
    );
  }
}
