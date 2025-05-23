import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/core/models/point-of-sale/point_of_sale.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/features/home/controller/point_of_sale_controller.dart';
import 'package:loyalty_card/features/home/widgets/point_of_sale_skeleton.dart';

class PointOfSaleWidget extends ConsumerWidget {
  const PointOfSaleWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<PointOfSale>>(
      future: ref.read(pointOfSaleControllerProvider).getAllPointOfSale(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PointOfSaleSkeleton();
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('Erreur: ${snapshot.error}'),
          );
        }

        final pointsOfSale = snapshot.data ?? [];

        return pointsOfSale.isEmpty
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Aucun point de vente disponible',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: pointsOfSale.map((pos) {
                    return Chip(
                      label: Text(
                        pos.city,
                      ),
                      backgroundColor:
                          AppTheme.kPrimaryColor.withValues(alpha: 0.1),
                      labelStyle: const TextStyle(
                        color: AppTheme.kPrimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  }).toList(),
                ),
              );
      },
    );
  }
}
