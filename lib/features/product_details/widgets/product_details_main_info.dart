import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class ProductDetailsMainInfo extends StatelessWidget {
  const ProductDetailsMainInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Sony WH-1000XM4 Wireless Industry Leading Noise Canceling Overhead Headphones with Mic for Phone-Call and Alexa Voice Control, Silver",
            maxLines: 4,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, height: 1.5),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "349 000 FCFA",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "349 000 FCFA",
                style: TextStyle(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.lineThrough),
              ),
              Container(
                width: 50,
                height: 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppTheme.kRedColor,
                    borderRadius: BorderRadius.circular(12)),
                child: const Text(
                  "-32%",
                  style: TextStyle(
                      color: AppTheme.kWhiteColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Row(
            children: [
              RatingBar(
                initialRating: 3.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                glow: false,
                itemSize: 24,
                ignoreGestures: true,
                ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star,
                    color: Color(0xffEAB704),
                  ),
                  half: const Icon(
                    Icons.star_half,
                    color: Color(0xffEAB704),
                  ),
                  empty: const Icon(
                    Icons.star_border,
                    color: Color(0xffEAB704),
                  ),
                ),
                onRatingUpdate: (_) {},
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "3.5 (423 avis)",
                style: TextStyle(
                    color: AppTheme.kPrimaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              const Icon(
                Icons.remove_red_eye,
                color: Colors.black54,
              ),
              const SizedBox(
                width: 4,
              ),
              const Text(
                "1234 vues",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        )
      ],
    );
  }
}
