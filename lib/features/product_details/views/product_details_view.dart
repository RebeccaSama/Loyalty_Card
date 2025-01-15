import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/features/home/widgets/collection_products_list_horizontal.dart';
import 'package:loyalty_card/features/product_details/widgets/product_details_main_info.dart';
import 'package:loyalty_card/features/product_details/widgets/slider_media_gallery.dart';
import 'package:simple_animations/animation_builder/custom_animation_builder.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  ScrollController scrollController = ScrollController();
  bool scrollGesture = false;
  bool isExpanded = true;
  var control = Control.play;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(children: [
            NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.metrics.axis == Axis.vertical) {
                  setState(() {
                    scrollGesture = true;
                  });
                } else if (scrollNotification is ScrollEndNotification &&
                    scrollNotification.metrics.axis == Axis.vertical) {
                  setState(() {
                    scrollGesture = false;
                  });
                }

                return false;
              },
              child: CustomScrollView(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    backgroundColor: const Color(0xFF04544D),
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
                          color: Colors.white,
                        ),
                        material: (_, __) => MaterialIconButtonData(
                            splashRadius: 20,
                            constraints: const BoxConstraints()),
                        cupertino: (_, __) =>
                            CupertinoIconButtonData(minSize: 0),
                      ),
                    ),
                    title: Visibility(
                      visible: !isExpanded,
                      child: const Text(
                        "Sony WH-1000XM4 Wireless Industry Leading Noise Canceling Overhead Headphones with Mic for Phone-Call and Alexa Voice Control, Silver",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    actions: [
                      Visibility(
                          visible: !isExpanded,
                          child: CustomAnimationBuilder<double>(
                            control: control,
                            duration: const Duration(milliseconds: 200),
                            tween: Tween<double>(begin: 0, end: 1),
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: value,
                                child: child,
                              );
                            },
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              InkWell(
                                  child: Row(
                                children: [
                                  PlatformIconButton(
                                    onPressed: () {},
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(
                                      Icons.add_shopping_cart,
                                      size: 24,
                                      color: AppTheme.kPrimaryColor,
                                    ),
                                    material: (_, __) => MaterialIconButtonData(
                                        splashRadius: 20,
                                        constraints: const BoxConstraints()),
                                    cupertino: (_, __) =>
                                        CupertinoIconButtonData(minSize: 0),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: PlatformIconButton(
                                      onPressed: () {},
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(
                                        Icons.share,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                      material: (_, __) =>
                                          MaterialIconButtonData(
                                              splashRadius: 20,
                                              constraints:
                                                  const BoxConstraints()),
                                      cupertino: (_, __) =>
                                          CupertinoIconButtonData(minSize: 0),
                                    ),
                                  ),
                                ],
                              ))
                            ]),
                          )),
                      PlatformIconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.more_vert,
                          size: 24,
                          color: Colors.white,
                        ),
                        material: (_, __) => MaterialIconButtonData(
                            splashRadius: 20,
                            constraints: const BoxConstraints()),
                        cupertino: (_, __) =>
                            CupertinoIconButtonData(minSize: 0),
                      ),
                    ],
                    pinned: true,
                    expandedHeight: 260.0,
                    flexibleSpace: const FlexibleSpaceBar(
                        background: SliderMediaGallery()),
                    stretch: true,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      const SizedBox(
                        height: 40,
                      ),
                      const ProductDetailsMainInfo(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  color: AppTheme.kPrimaryColor,
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.star,
                                color: AppTheme.kWhiteColor,
                                size: 10,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Expanded(
                              child: Text(
                                "Les clients ayant acheté cet article ont également acheté ceux-ci",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppTheme.kPrimaryColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                          ],
                        ),
                      ),
                      const CollectionProductsHorizontal(),
                    ]),
                  )
                ],
              ),
            ),
            _buildFab()
          ]),
        ));
  }

  Widget _buildFab() {
    const double defaultTopMargin = 260.0 - 32.0;
    const double scaleStart = 96.0;

    double top = defaultTopMargin;
    double scale = 1.0;

    if (scrollController.hasClients) {
      double offset = scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        control = Control.playReverseFromEnd;
        isExpanded = true;
      } else if (offset < 204) {
        scale = 1 - ((offset - scaleStart) / (204 - scaleStart));
        control = Control.playReverseFromEnd;
        isExpanded = true;

        if (!scrollGesture) {
          scrollController.animateTo(
            234,
            duration: const Duration(milliseconds: 400),
            curve: Curves.decelerate,
          );
        }
      } else {
        scale = 0.0;
        control = Control.play;
        isExpanded = false;
      }
    }

    return Positioned(
      top: top,
      right: 0,
      child: SafeArea(
        child: Transform(
            transform: Matrix4.identity()..scale(scale),
            alignment: Alignment.centerRight,
            child: Row(
              children: [
                SizedBox(
                  width: 36,
                  height: 36,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    elevation: 3,
                    heroTag: "tag2",
                    child: const Icon(
                      Icons.share,
                      color: AppTheme.kPrimaryColor,
                      size: 18,
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: SizedBox(
                    width: 36,
                    height: 36,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      elevation: 3,
                      child: const Icon(
                        Icons.favorite_border,
                        size: 18,
                        color: AppTheme.kPrimaryColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SizedBox(
                    width: 56,
                    height: 56,
                    child: GestureDetector(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: AppTheme.kPrimaryColor,
                        child: Icon(
                          Icons.add_shopping_cart,
                          color: AppTheme.kWhiteColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
