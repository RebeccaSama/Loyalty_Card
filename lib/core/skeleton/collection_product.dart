import 'package:flutter/material.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:shimmer/shimmer.dart';

class CollectionProductCrossOneSkeleton extends StatelessWidget {
  const CollectionProductCrossOneSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: AppTheme.kPrimary12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Row(
            children: [
              Container(
                width: 105,
                height: 105,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 14,
                        width: 100,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 12,
                            width: 60,
                            color: Colors.grey,
                          ),
                          Container(
                            width: 40,
                            height: 20,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          ...List.generate(
                            5,
                            (index) => Container(
                              margin: const EdgeInsets.only(right: 2),
                              width: 16,
                              height: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 10,
                            width: 50,
                            color: Colors.grey,
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
      ),
    );
  }
}
