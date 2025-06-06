import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loyalty_card/core/models/scan.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/features/points_page/points_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class QrCodePage extends StatefulWidget {
  const QrCodePage({super.key});

  @override
  State<QrCodePage> createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _qrController;
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _isScanning = true;
  Scan? _scanResult;
  String? _errorMessage;
  bool _hasCameraPermission = false;

  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
    _setupScanAnimation();
  }

  Future<void> _checkCameraPermission() async {
    final status = await Permission.camera.status;
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      setState(() => _hasCameraPermission = result.isGranted);
    } else {
      setState(() => _hasCameraPermission = true);
    }
  }

  void _setupScanAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _qrController?.pauseCamera();
    }
    _qrController?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const scanAreaSize = 300.0;
    final scanAreaTop = size.height / 2 - scanAreaSize / 2;
    final scanAreaBottom = size.height / 2 + scanAreaSize / 2;

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          if (_hasCameraPermission)
            QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.white,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 8,
                cutOutSize: scanAreaSize,
              ),
            ),
          _buildScanLine(scanAreaTop, scanAreaBottom, scanAreaSize),
          _buildStatusText(),
          _buildAppBar(),
          _buildManualInputButton(),
          _buildEditButton(),
        ],
      ),
    );
  }

  Widget _buildScanLine(double top, double bottom, double width) {
    return Positioned(
      left: MediaQuery.of(context).size.width / 2 - width / 2,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          final position = top + (bottom - top) * _animation.value;
          return Opacity(
            opacity: _isScanning ? 1.0 : 0.0,
            child: Transform.translate(
              offset: Offset(0, position - top - 150),
              child: Container(
                width: width,
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withValues(alpha: 0.01),
                      Colors.white,
                      Colors.white.withValues(alpha: 0.01)
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusText() {
    return Positioned(
      top: MediaQuery.of(context).size.height / 2 + 180,
      child: AnimatedOpacity(
        opacity: _isScanning ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: Text(
          _errorMessage ?? "Alignez le QR code dans le cadre",
          style: GoogleFonts.dosis(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: _errorMessage != null ? Colors.red : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Positioned(
      top: 50,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          Text(
            "Scanner",
            style: GoogleFonts.dosis(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildManualInputButton() {
    return Positioned(
      bottom: 100,
      child: GestureDetector(
        onTap: _showManualInputDialog,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: AppTheme.kboutonscan30,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Text(
                "Saisir le code manuellement",
                style: GoogleFonts.dosis(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.keyboard, color: Colors.white, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditButton() {
    return Positioned(
      bottom: 30,
      child: FloatingActionButton(
        backgroundColor: AppTheme.kboutonscan30,
        onPressed: () {
          if (_scanResult != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PointsPage(scan: _scanResult),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Aucun scan valide à éditer")),
            );
          }
        },
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    _qrController = controller;
    controller.scannedDataStream.listen((scanData) async {
      print(scanData.code);
      if (_isScanning && scanData.code != null) {
        try {
          setState(() {
            _isScanning = false;
            _animationController.stop();
          });

          final scanResult = Scan.fromJson(json.decode(scanData.code!));
          setState(() => _scanResult = scanResult);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PointsPage(scan: scanResult),
            ),
          );
        } catch (e) {
          setState(() => _errorMessage = "QR code non valide");
          await Future.delayed(const Duration(seconds: 2));
          _resetScanner();
        }
      }
    });
  }

  void _showManualInputDialog() {
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        child: Container(
          color: Colors.white,
          height: 32,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Saisie manuelle", style: GoogleFonts.dosis()),
                const SizedBox(height: 16),
                TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: "Coller le code QR ici",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                TextButton(
                  child: Text("ANNULER", style: GoogleFonts.dosis()),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                ElevatedButton(
                  child: Text("VALIDER", style: GoogleFonts.dosis()),
                  onPressed: () {
                    try {
                      final scan =
                          Scan.fromJson(json.decode(textController.text));
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PointsPage(scan: scan),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Format de code invalide")),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _resetScanner() {
    setState(() {
      _isScanning = true;
      _errorMessage = null;
      _animationController.repeat(reverse: true);
    });
    _qrController?.resumeCamera();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _qrController?.dispose();
    super.dispose();
  }
}
