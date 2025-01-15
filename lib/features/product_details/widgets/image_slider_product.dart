import 'package:flutter/material.dart';
import 'package:loyalty_card/data/config.dart';

class ImageSliderProduct extends StatefulWidget {
  final int index;
  const ImageSliderProduct({Key? key, required this.index}) : super(key: key);

  @override
  State<ImageSliderProduct> createState() => _ImageSliderProductState();
}

class _ImageSliderProductState extends State<ImageSliderProduct>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagesStories
                      .where((element) => element.item3 == Media.image)
                      .toList()[widget.index]
                      .item1),
                  fit: BoxFit.cover)),
        ),
        // CachedNetworkImage(
        //   imageUrl: imagesStories
        //       .where((element) => element.item3 == Media.image)
        //       .toList()[widget.index]
        //       .item1,
        //   fadeInDuration: const Duration(milliseconds: 0),
        //   fadeOutDuration: const Duration(seconds: 0),
        //   width: double.infinity,
        //   imageBuilder: (context, imageProvider) {
        //     return Container(
        //       decoration: BoxDecoration(
        //           image:
        //               DecorationImage(image: imageProvider, fit: BoxFit.cover)),
        //     );
        //   },
        //   placeholder: (context, url) {
        //     return BlurHash(
        //       hash: imagesStories[widget.index].item2,
        //       imageFit: BoxFit.cover,
        //     );
        //   },
        //   errorWidget: (context, url, error) => BlurHash(
        //     hash: imagesStories[widget.index].item2,
        //     imageFit: BoxFit.cover,
        //   ),
        // ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromRGBO(10, 10, 10, 0.32).withValues(alpha: 0.4),
                const Color.fromRGBO(135, 135, 135, 0).withValues(alpha: 0.4),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
