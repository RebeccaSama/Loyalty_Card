import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:loyalty_card/core/common/app_typography.dart';

class MyAssetsPage extends StatefulWidget {
  const MyAssetsPage({super.key});

  @override
  State<MyAssetsPage> createState() => _MyAssetsPageState();
}

class _MyAssetsPageState extends State<MyAssetsPage> {
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
        title: Text("Mes avoirs",
            style: AppTypography.kBold24
                .copyWith(fontSize: 24, color: Colors.black)),
      ),
    );
  }
}
