import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/features/home/widgets/dot_indicator.dart';
import 'package:loyalty_card/features/product_details/widgets/image_slider_product.dart';

class SliderMediaGallery extends ConsumerStatefulWidget {
  const SliderMediaGallery({Key? key}) : super(key: key);

  @override
  ConsumerState<SliderMediaGallery> createState() => SliderMediaGalleryState();
}

class SliderMediaGalleryState extends ConsumerState<SliderMediaGallery> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Hero(
            tag: "Emmanuel",
            placeholderBuilder: (context, heroSize, child) => child,
            flightShuttleBuilder:
                (context, anim, direction, fromContext, toContext) {
              var toHero = toContext.widget as Hero;
              if (direction == HeroFlightDirection.pop) {
                return FadeTransition(
                  opacity: const AlwaysStoppedAnimation(0),
                  child: toHero.child,
                );
              } else {
                return toHero.child;
              }
            },
            child: CarouselSlider.builder(
              itemCount: 5,
              options: CarouselOptions(
                height: double.infinity,
                autoPlay: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) => setState(() {
                  activeIndex = index;
                }),
              ),
              itemBuilder: (context, index, _) {
                return ImageSliderProduct(index: index);
              },
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.zoom_in,
            size: 50,
            color: Colors.white.withValues(alpha: 0.36),
          ),
        ),
        Positioned(
          left: 16,
          bottom: 8,
          child: DotIndicator(
            selectedIndex: activeIndex,
            length: 5,
            dotSelectedColor: AppTheme.kPrimaryColor,
            dotUnselectedColor: const Color(0xffEEEEEE),
          ),
        )
      ],
    );
  }
}
