import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class CollectionProductCrossOne extends ConsumerWidget {
  final String image, title, price;

  const CollectionProductCrossOne({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      elevation: 4,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: AppTheme.kPrimary12),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 105,
                height: 105,
                decoration: BoxDecoration(
                  color: const Color(0x1304544D),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        height: 1.5,
                        fontSize: 13,
                        color: Color(0xFF000B2B),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "$price FCFA",
                      style: const TextStyle(
                        color: AppTheme.kPrimaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "1 123 000 FCFA",
                          style: TextStyle(
                            color: AppTheme.kPrimaryColor,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 20,
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 6),
                          decoration: const BoxDecoration(
                            color: AppTheme.kRedColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22),
                              bottomLeft: Radius.circular(22),
                            ),
                          ),
                          child: const Text(
                            "-32%",
                            style: TextStyle(
                              color: AppTheme.kWhiteColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8), // Add spacing
                    Row(
                      children: [
                        RatingBar(
                          initialRating: 3.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          glow: false,
                          itemSize: 18,
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
                        const SizedBox(width: 5.5),
                        const Text(
                          "3.5",
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.54),
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Text(
                            "1000 unités",
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.54),
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
