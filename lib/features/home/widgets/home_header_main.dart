import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:loyalty_card/core/models/flash-sale/flash_sale.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/data/data_images.dart';
import 'package:loyalty_card/features/home/controller/flash_sale_controller.dart';
import 'package:loyalty_card/features/home/widgets/dot_indicator.dart';
import 'package:loyalty_card/features/home/widgets/home_header_skeleton.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeHeaderMain extends ConsumerStatefulWidget {
  const HomeHeaderMain({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeHeaderMain> createState() => _HomeHeaderMainState();
}

class _HomeHeaderMainState extends ConsumerState<HomeHeaderMain> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final flashSalesAsync = ref.watch(flashSalesProvider);

    return Column(
      children: <Widget>[
        const Gap(70),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Welcome!",
                style: TextStyle(
                    color: AppTheme.kWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Gap(16),
            flashSalesAsync.when(
              loading: () => const HomeHeaderSkeleton(),
              error: (error, stack) => Center(
                child: Text('Erreur: $error'),
              ),
              data: (flashSales) {
                if (flashSales.isEmpty) {
                  return const Center(
                    child: Text('Aucun flash sale disponible'),
                  );
                }

                return GestureDetector(
                  onTap: () {},
                  child: CarouselSlider.builder(
                    itemCount: flashSales.length,
                    options: CarouselOptions(
                      height: 170,
                      autoPlay: true,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index),
                    ),
                    itemBuilder: (context, index, realIndex) {
                      return HomeHeaderImage(flashSale: flashSales[index]);
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Center(
                child: flashSalesAsync.when(
                  loading: () => const SizedBox(),
                  error: (_, __) => const SizedBox(),
                  data: (flashSales) => DotIndicator(
                    selectedIndex: activeIndex,
                    length: flashSales.length,
                    dotSelectedColor: AppTheme.kRedColor,
                    dotUnselectedColor: const Color(0xffEEEEEE),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class HomeHeaderImage extends StatefulWidget {
  final FlashSale flashSale;
  const HomeHeaderImage({Key? key, required this.flashSale}) : super(key: key);

  @override
  State<HomeHeaderImage> createState() => _HomeHeaderImageState();
}

class _HomeHeaderImageState extends State<HomeHeaderImage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          height: 260,
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://vist-card-backend.onrender.com/api/files/${widget.flashSale.product.imageUrl}",
                  width: 150,
                  height: 120,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 150,
                    height: 120,
                    color: const Color(0x1304544D),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 150,
                    height: 120,
                    color: const Color(0x1304544D),
                    child: const Center(
                      child: Icon(
                        Iconsax.image_outline,
                        color: Colors.grey,
                        size: 75,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(DataImages.vector),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 4),
                    child: Text(
                      NumberFormat.currency(
                              locale: "fr_FR", decimalDigits: 0, symbol: "FCFA")
                          .format(widget.flashSale.product.price),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff04544D),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        NumberFormat.currency(
                                locale: "fr_FR",
                                decimalDigits: 0,
                                symbol: "FCFA")
                            .format(widget.flashSale.product.oldPrice),
                        style: const TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff04544D),
                        ),
                      ),
                      const Gap(6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 6),
                        decoration: BoxDecoration(
                            color: AppTheme.kRedColor,
                            borderRadius: BorderRadius.circular(22)),
                        child: Text(
                          "- ${widget.flashSale.discountPercentage}%",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
