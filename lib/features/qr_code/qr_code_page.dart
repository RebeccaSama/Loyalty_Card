import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewState extends StatefulWidget {
  const QRViewState({super.key});

  @override
  State<QRViewState> createState() => _QRViewState();
}

class _QRViewState extends State<QRViewState> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;

  QRViewController? controller;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    await Permission.camera.request();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      if (Platform.isAndroid) {
        controller!.pauseCamera();
      } else if (Platform.isIOS) {
        controller!.resumeCamera();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.red,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: 300,
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: AppTheme.kWhiteColor,
                    )),
                Text(
                  "Scan",
                  style: GoogleFonts.dosis(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.kWhiteColor,
                  ),
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.more_vert,
                      color: AppTheme.kWhiteColor,
                    ),
                    SizedBox(width: 10),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 214,
                  height: 42,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppTheme.kboutonscan30),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Entrer le code manuellement",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.dosis(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.kWhiteColor,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                    top: 30,
                    bottom: 0,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: AppTheme.kboutonscan30,
                      size: 30,
                    )),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppTheme.kboutonscan30),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: AppTheme.kWhiteColor,
                    size: 24,
                  ),
                )),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
