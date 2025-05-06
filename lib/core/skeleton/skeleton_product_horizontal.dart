import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonProductHorizontal extends StatelessWidget {
  const SkeletonProductHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: 150,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
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
                    height: 20,
                    width: 40,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    width: 57,
                    height: 18,
                    color: Colors.grey,
                  ),
                  const Spacer(),
                  Container(
                    width: 1,
                    height: 18,
                    color: Colors.grey,
                  ),
                  const Spacer(),
                  Container(
                    width: 57,
                    height: 18,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
