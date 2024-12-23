import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/data/data_images.dart';

class CollectionProductsHorizontal extends ConsumerWidget {
  const CollectionProductsHorizontal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 7, left: 8, right: 8),
        child: IntrinsicHeight(
          child: Row(
            children: List.generate(
                11,
                (index) => Padding(
                    padding: EdgeInsets.only(right: index == 10 ? 0 : 8),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          width: 150,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withValues(alpha: 0.06)),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.white
                                  : Colors.black,
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 120,
                                decoration: BoxDecoration(
                                    color: const Color(0x1304544D),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Image.asset(DataImages.product),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 4),
                                child: Text(
                                  NumberFormat.currency(
                                          locale: "fr_FR",
                                          decimalDigits: 0,
                                          symbol: "FCFA")
                                      .format(966000),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.kPrimaryColor,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    NumberFormat.currency(
                                            locale: "fr_FR",
                                            decimalDigits: 0,
                                            symbol: "FCFA")
                                        .format(1123000),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic,
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w300,
                                      color: AppTheme.kPrimaryColor,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 6),
                                    decoration: const BoxDecoration(
                                        color: AppTheme.kRedColor,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(22),
                                            bottomLeft: Radius.circular(22))),
                                    child: const Text(
                                      "- 32%",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppTheme.kWhiteColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 57,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star_half,
                                            color: Color(0xffFFC51C),
                                            size: 18,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            child: Text(
                                              "4.5",
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 12,
                                            color: Colors.black54,
                                          )
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    VerticalDivider(
                                      thickness: 1,
                                      indent: 3,
                                      endIndent: 3,
                                      color: Colors.black.withOpacity(0.06),
                                    ),
                                    const Spacer(),
                                    const SizedBox(
                                      width: 57,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.black54,
                                            size: 18,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 4.0),
                                            child: Text(
                                              "1234",
                                              style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                    ))),
          ),
        ),
      ),
    );
  }
}
