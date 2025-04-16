import 'package:flutter/material.dart';
import 'package:loyalty_card/core/common/collection_product_cross_one.dart';
import 'package:loyalty_card/core/common/text_field_app_bar.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/data/data_images.dart';

class CatalogueView extends StatefulWidget {
  const CatalogueView({super.key});

  @override
  State<CatalogueView> createState() => _CatalogueViewState();
}

class _CatalogueViewState extends State<CatalogueView> {
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
        child: ListView.separated(
          itemBuilder: (context, index) {
            return CollectionProductCrossOne(
              title: "Viandes",
              image: DataImages.food, // Replace with actual path
              price: "2 500",
            );
          },
          separatorBuilder: (context, _) => const SizedBox(height: 8),
          itemCount: 20,
        ),
      ),
    );
  }
}
