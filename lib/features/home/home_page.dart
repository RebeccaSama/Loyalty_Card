import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:loyalty_card/core/common/row_title.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/data/data_images.dart';
import 'package:loyalty_card/features/home/widgets/collection_products_list_horizontal.dart';
import 'package:loyalty_card/features/home/widgets/home_header_main.dart';
import 'package:loyalty_card/features/home/widgets/store_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              backgroundColor: AppTheme.kPrimaryColor,
              expandedHeight: 338,
              leading: Container(
                  width: 70,
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: const BoxDecoration(
                      color: AppTheme.kWhiteColor,
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(20))),
                  child: const Center(
                    child: Icon(
                      Icons.home,
                      color: AppTheme.kPrimaryColor,
                      size: 25,
                    ),
                  )),
              title: Image.asset(
                DataImages.logo,
                height: 60,
                width: 76,
                fit: BoxFit.contain,
              ),
              actions: [
                Image.asset('assets/images/Icons.png', height: 24, width: 24),
                PopupMenuButton(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(30)),
                  splashRadius: 24,
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                          child: Text(
                        "Mes point",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )),
                      const PopupMenuItem(
                          child: Text(
                        "Deconnexion",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )),
                      const PopupMenuItem(
                          child: Text(
                        "Help",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )),
                    ];
                  },
                  icon: const Icon(Icons.more_vert,
                      color: Colors.white, size: 24),
                ),
                const SizedBox(width: 5),
              ],
              pinned: true,
              flexibleSpace: SafeArea(
                child: Container(
                  decoration:
                      const BoxDecoration(color: AppTheme.kPrimaryColor),
                  child: const FlexibleSpaceBar(
                    background: HomeHeaderMain(),
                  ),
                ),
              )),
          SliverList(
              delegate: SliverChildListDelegate([
            const Gap(32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: RowTitle(title: "Boutiques"),
            ),
            const Gap(16),
            const StoreWidget(),
            const Gap(32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: RowTitle(title: "Articles"),
            ),
            const Gap(16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CollectionProductsHorizontal(),
            )
          ]))
        ],
      ),
    );
  }
}
