import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loyalty_card/core/common/row_title.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/data/data_images.dart';
import 'package:loyalty_card/features/home/widgets/collection_products_list_horizontal.dart';
import 'package:loyalty_card/features/home/widgets/home_header_main.dart';
import 'package:loyalty_card/features/login/login_page.dart';
import 'package:loyalty_card/features/my_currency/my_currency.dart';
import 'package:loyalty_card/features/notification/notification_page.dart';
import 'package:loyalty_card/features/points_page/points_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int notificationCount =
      3; // Initialiser notificationCount à 3 (ou tout autre nombre)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.kWhiteColor,
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
                DataImages.logoH,
                height: 70,
                width: 76,
                fit: BoxFit.contain,
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationPage()));
                  },
                  child: badges.Badge(
                    badgeContent: Text(
                      '$notificationCount',
                      style: const TextStyle(
                          color: AppTheme.kWhiteColor, fontSize: 9),
                    ),
                    badgeStyle: const badges.BadgeStyle(badgeColor: Colors.red),
                    position: badges.BadgePosition.topEnd(top: -5, end: -5),
                    child: const Icon(Icons.notifications_outlined,
                        size: 25, color: AppTheme.kWhiteColor),
                  ),
                ),
                const SizedBox(
                    width: 2), // Espacement pour ne pas avoir l'icône collée
                PopupMenuButton(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(30)),
                  color: Colors.white,
                  splashRadius: 24,
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyCurrency()));
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Iconsax.money_recive_outline,
                                size: 24,
                                color: AppTheme.kPrimaryColor,
                              ),
                              Gap(8),
                              Text(
                                "Ma Monnaie",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                      PopupMenuItem(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PointsPage()));
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined,
                                size: 24,
                                color: AppTheme.kPrimaryColor,
                              ),
                              Gap(8),
                              Text(
                                "Mes points",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                      PopupMenuItem(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Iconsax.logout_outline,
                                size: 24,
                                color: Colors.red,
                              ),
                              Gap(8),
                              Text(
                                "Deconnexion",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )),
                      const PopupMenuItem(
                          child: Row(
                        children: [
                          Icon(
                            Icons.help,
                            size: 24,
                            color: AppTheme.kPercentageRed,
                          ),
                          Gap(8),
                          Text(
                            "Help",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
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
              child: RowTitle(title: "Localisation"),
            ),
            const Gap(16),
            /*Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: itemsnouns.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return LocalisationsItem(localisations: itemsnouns[index]);
                },
                separatorBuilder: (_, __) {
                        return const SizedBox(
                          height: 12,
                        );
                      },
              ),
            ),*/
            Container(
              padding: const EdgeInsets.all(16),
              color: AppTheme.kPrimary12 ,
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 25,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppTheme.kPrimary50),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text("Bonaberi",
                                style: GoogleFonts.dosis(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: AppTheme.kPrimaryColor,
                                )),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          width: 80,
                          height: 25,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppTheme.kPrimary50),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text("Logpom",
                                style: GoogleFonts.dosis(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: AppTheme.kPrimaryColor,
                                )),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          width: 100,
                          height: 25,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppTheme.kPrimary50),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text("Bonamoussadi",
                                style: GoogleFonts.dosis(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: AppTheme.kPrimaryColor,
                                )),
                          ),
                        )
                      ],
                    ),
                    const Gap(8),
                    Row(
                  children: [
                    Container(
                      width: 120,
                      height: 25,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.kPrimary50),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text("Douala Grand Mall",
                            style: GoogleFonts.dosis(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: AppTheme.kPrimaryColor,
                            )),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 100,
                      height: 25,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.kPrimary50),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text("Ancien DALIP",
                            style: GoogleFonts.dosis(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: AppTheme.kPrimaryColor,
                            )),
                      ),
                    ),
                    
                  ],
                ),
                            
                  ],
                ),
              ),
            ),
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
