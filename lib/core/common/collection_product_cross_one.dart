import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loyalty_card/core/models/products/product.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class CollectionProductCrossOne extends ConsumerWidget {
  final Product product;
  const CollectionProductCrossOne({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      elevation: 4,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
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
                    // image: product.imageUrl.isEmpty
                    //     ? DecorationImage(
                    //         image: AssetImage(product.imageUrl),
                    //         fit: BoxFit.cover,
                    //       )
                    //     : const DecorationImage(
                    //         image: AssetImage('assets/images/empty_image.png'),
                    //         fit: BoxFit.cover,
                    // ),
                  ),
                  child: const Center(
                    child: Icon(
                      Iconsax.image_outline,
                      color: Colors.grey,
                      size: 75,
                    ),
                  )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
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
                      "${product.price} FCFA",
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
                        Text(
                          "${product.oldPrice}FCFA",
                          style: const TextStyle(
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
                          child: Text(
                            "-${product.discount.percentage}%",
                            style: const TextStyle(
                              color: AppTheme.kWhiteColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        RatingBar(
                          initialRating: product.price.toDouble(),
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
                        Text(
                          product.rating.toString(),
                          style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.54),
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            "${product.stock} unités",
                            style: const TextStyle(
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
