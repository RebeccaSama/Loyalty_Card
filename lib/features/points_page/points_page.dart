import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:gap/gap.dart';
import 'package:loyalty_card/core/common/app_typography.dart';
import 'package:loyalty_card/core/common/collection_product_cross_one.dart';
import 'package:loyalty_card/core/common/row_title.dart';
import 'package:loyalty_card/features/points_page/widgets/circular_gauge.dart';
import 'package:loyalty_card/features/points_page/widgets/my_point.dart';

class PointsPage extends StatefulWidget {
  const PointsPage({super.key});

  @override
  State<PointsPage> createState() => _PointsPageState();
}

class _PointsPageState extends State<PointsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Align(
          alignment: Alignment.center,
          child: PlatformIconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              size: 24,
              color: Colors.black,
            ),
            material: (_, __) => MaterialIconButtonData(
                splashRadius: 20, constraints: const BoxConstraints()),
            cupertino: (_, __) => CupertinoIconButtonData(minSize: 0),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Mes points",
            style: AppTypography.kBold24
                .copyWith(fontSize: 24, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Gap(22),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyPoint(
                      nuber: "Nombre de points",
                      title: '900 pts',
                    ),
                    MyPoint(
                      nuber: "Pourcentage",
                      title: '8,1%',
                    ),
                  ],
                ),
              ),
              const Gap(22),
              const CircularGauge(),
              const Gap(22),
              const RowTitle(title: "Articles en reduction"),
              const Gap(22),
              SizedBox(
                height: 900,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return const CollectionProductCrossOne(
                      title: "Electroménager",
                      image: "assets/images/marmite.png",
                      price: "100 000",
                    );
                  },
                  separatorBuilder: (context, _) => const SizedBox(height: 8),
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
