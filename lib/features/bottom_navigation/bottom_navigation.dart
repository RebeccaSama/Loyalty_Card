import 'package:flutter/material.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/features/catalogue/catalogue_view.dart';
import 'package:loyalty_card/features/historique/historique_view.dart';
import 'package:loyalty_card/features/home/home_page.dart';
import 'package:loyalty_card/features/qr_code/qr_code_page.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0; // Tracks the selected tab index
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home_rounded),
            selectedColor: AppTheme.kPrimaryColor,
            title: const Text(
              "Accueil",
              style: TextStyle(
                fontFamily: "Dosis",
                fontSize: 12,
                letterSpacing: 0.1,
                color: AppTheme.kPrimaryColor,
              ),
            ),
          ),
          BottomBarItem(
            icon: const Icon(Icons.grid_view_outlined),
            selectedIcon: const Icon(Icons.grid_view),
            selectedColor: AppTheme.kPrimaryColor,
            title: const Text(
              'Catalogue',
              style: TextStyle(
                fontFamily: "Dosis",
                fontSize: 12,
                letterSpacing: 0.1,
                color: AppTheme.kPrimaryColor,
              ),
            ),
          ),
          BottomBarItem(
            icon: const Icon(Icons.credit_card_outlined),
            selectedIcon: const Icon(Icons.credit_card),
            selectedColor: AppTheme.kPrimaryColor,
            title: const Text(
              "Détail",
              style: TextStyle(
                fontFamily: "Dosis",
                fontSize: 12,
                letterSpacing: 0.1,
                color: AppTheme.kPrimaryColor,
              ),
            ),
          ),
          BottomBarItem(
            icon: const Icon(Icons.person_outline),
            selectedIcon: const Icon(Icons.person),
            selectedColor: AppTheme.kPrimaryColor,
            title: const Text(
              'Profile',
              style: TextStyle(
                fontFamily: "Dosis",
                fontSize: 12,
                letterSpacing: 0.1,
                color: AppTheme.kPrimaryColor,
              ),
            ),
          ),
        ],
        hasNotch: true, // Enables the notch for the FAB
        fabLocation: StylishBarFabLocation.center, // FAB at the center
        currentIndex: selectedIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
            borderSide: const BorderSide(color: AppTheme.kPrimaryColor)),
        backgroundColor: AppTheme.kPrimaryColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const QRViewState()));
        },
        child: const Icon(Icons.qr_code, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          children: const [
            HomePage(), // Replace with your respective pages
            CatalogueView(),
            HistoriqueView(),
            HomePage(),
          ],
        ),
      ),
    );
  }
}
