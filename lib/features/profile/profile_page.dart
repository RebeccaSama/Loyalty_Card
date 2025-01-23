import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loyalty_card/features/historique/historique_view.dart';
import 'package:loyalty_card/features/login/login_page.dart';
import 'package:loyalty_card/features/notification/notification_page.dart';
import 'package:loyalty_card/features/profile/widgets/profil_header.dart';
import 'package:loyalty_card/features/profile/widgets/profil_item.dart';

import 'widgets/profit_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 4),
              const ProfilItem(
                iconData: Iconsax.setting_3_outline,
                title: "Profil",
                subTitle: "Modifier et gérer les détails de votre compte",
              ),
              const SizedBox(height: 20),
            const ProfilHeader(),
              const SizedBox(height: 8),
              const ProfilItem(
                iconData: Iconsax.category_2_outline,
                title: "Configuration",
                subTitle:
                    "Modifier et gérer les détails de votre votre disponibilite",
              ),
              const SizedBox(height: 20),
              ProfitItem(
                iconData: Iconsax.notification_outline,
                title: 'Notifications',
                color: Colors.green,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationPage()));
                },
              ),
              const SizedBox(height: 16),
              ProfitItem(
                iconData: Iconsax.user_outline,
                title: 'Adresses',
                color: Colors.amber,
                onTap: () {},
              ),
              const SizedBox(height: 16),
              ProfitItem(
                iconData: Iconsax.shop_outline,
                title: 'Mes points',
                color: Colors.purple,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoriqueView()));
                },
              ),
              const SizedBox(height: 16),
              ProfitItem(
                iconData: Iconsax.setting_outline,
                title: 'A Propos',
                color: Colors.black,
                onTap: () {},
              ),
              const SizedBox(height: 16),
              ProfitItem(
                iconData: Iconsax.logout_outline,
                title: 'Déconexion',
                color: Colors.red,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
