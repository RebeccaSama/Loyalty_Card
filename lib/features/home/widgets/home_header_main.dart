import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/data/data_images.dart';
import 'package:loyalty_card/features/home/widgets/dot_indicator.dart';

class HomeHeaderMain extends ConsumerStatefulWidget {
  const HomeHeaderMain({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeHeaderMain> createState() => _HomeHeaderMainState();
}

class _HomeHeaderMainState extends ConsumerState<HomeHeaderMain> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Gap(70),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 32),
              child: Text(
                "Hello,",
                style: TextStyle(
                    color: AppTheme.kWhiteColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const Gap(16),
            GestureDetector(
              onTap: () {},
              child: CarouselSlider.builder(
                itemCount: 5,
                options: CarouselOptions(
                  height: 170,
                  autoPlay: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),
                itemBuilder: (context, index, realIndex) {
                  return HomeHeaderImage(index: index);
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Center(
                child: Container(
                  child: buildIndicator(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  buildIndicator() => DotIndicator(
        selectedIndex: activeIndex,
        length: 5,
        dotSelectedColor: AppTheme.kRedColor,
        dotUnselectedColor: const Color(0xffEEEEEE),
      );
}

class HomeHeaderImage extends StatefulWidget {
  final int index;
  const HomeHeaderImage({Key? key, required this.index}) : super(key: key);

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
              Image.asset(DataImages.marmite),
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
                          .format(4899),
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
                            .format(7900),
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
                        child: const Text(
                          "- 32%",
                          style: TextStyle(
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
