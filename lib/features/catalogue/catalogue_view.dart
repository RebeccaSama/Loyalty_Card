import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/core/common/collection_product_cross_one.dart';
import 'package:loyalty_card/core/common/text_field_app_bar.dart';
import 'package:loyalty_card/core/skeleton/collection_product.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/features/home/controller/product_controller.dart';
import 'package:loyalty_card/core/models/products/product.dart';

class CatalogueView extends ConsumerStatefulWidget {
  const CatalogueView({super.key});

  @override
  ConsumerState<CatalogueView> createState() => _CatalogueViewState();
}

class _CatalogueViewState extends ConsumerState<CatalogueView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:
              const Icon(Icons.arrow_back_ios_sharp, color: Color(0x88000A2B)),
          padding: EdgeInsets.zero,
        ),
        title: TextFieldAppBar(
          clearInput: () {},
          onTapInput: () {},
          action: const Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                Icons.filter_list,
                color: Colors.black54,
              ),
              Positioned(
                top: 2,
                right: 0,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: AppTheme.kPrimaryColor,
                ),
              )
            ],
          ),
        ),
        titleSpacing: 0,
        centerTitle: true,
        actions: const [SizedBox()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<Product>>(
          future: ref.read(productControllerProvider).getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return const CollectionProductCrossOneSkeleton();
                },
                separatorBuilder: (context, _) => const SizedBox(height: 8),
                itemCount: 5,
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text('Erreur: ${snapshot.error}'));
            }
            final products = snapshot.data ?? [];
            return ListView.separated(
              itemBuilder: (context, index) {
                final product = products[index];
                return CollectionProductCrossOne(
                  product: product,
                );
              },
              separatorBuilder: (context, _) => const SizedBox(height: 8),
              itemCount: products.length,
            );
          },
        ),
      ),
    );
  }
}
