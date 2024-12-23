import 'package:flutter/material.dart';
import 'package:loyalty_card/core/common/app_typography.dart';
import 'package:loyalty_card/core/common/collection_product_cross_one.dart';
import 'package:loyalty_card/core/theme/themes.dart';

class HistoriqueView extends StatefulWidget {
  const HistoriqueView({super.key});

  @override
  State<HistoriqueView> createState() => _HistoriqueViewState();
}

class _HistoriqueViewState extends State<HistoriqueView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Historique",
            style: AppTypography.kBold24
                .copyWith(fontSize: 24, color: Colors.black)),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: TabBar(
                dividerColor: Colors.transparent,
                mouseCursor: MouseCursor.defer,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 1,
                    color: AppTheme.kPrimary50,
                  ),
                ),
                labelColor: AppTheme.kPrimaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(
                    text: 'Déjà achetés',
                  ),
                  Tab(
                    text: 'A gagner',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TabBarView(
                  children: [
                    ListView.separated(
                      itemBuilder: (context, index) {
                        return const CollectionProductCrossOne(
                          title: "Electroménager",
                          image:
                              "assets/images/marmite.png", // Replace with actual path
                          price: "100 000",
                        );
                      },
                      separatorBuilder: (context, _) =>
                          const SizedBox(height: 8),
                      itemCount: 5,
                    ),
                    ListView.separated(
                      itemBuilder: (context, index) {
                        return const CollectionProductCrossOne(
                          title: "Electroménager",
                          image:
                              "assets/images/marmite.png", // Replace with actual path
                          price: "100 000",
                        );
                      },
                      separatorBuilder: (context, _) =>
                          const SizedBox(height: 8),
                      itemCount: 5,
                    )
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
