import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loyalty_card/features/my_currency/my_currency.dart';
import 'package:loyalty_card/features/notification/notification_page.dart';
import 'package:loyalty_card/features/points_page/points_page.dart';
import 'package:loyalty_card/features/profile/widgets/profil_header.dart';
import 'package:loyalty_card/features/profile/widgets/profil_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loyalty_card/features/login/controller/login_controller.dart';
import 'package:loyalty_card/core/models/user.dart';

import 'widgets/profit_item.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  User? user;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final userMap = await ref.read(loginControllerProvider.notifier).getUser();
    if (userMap != null) {
      setState(() {
        user = User.fromLocalJson(userMap);
      });
      print(User.fromLocalJson(userMap));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: user == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                    ProfilHeader(
                      user: user!,
                    ),
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
                                builder: (context) =>
                                    const NotificationPage()));
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
                      iconData: Iconsax.money_recive_outline,
                      title: 'Ma Monnaie',
                      color: Colors.blue,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyCurrency(
                                    // user: widget.user,
                                    )));
                      },
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
                                builder: (context) => const PointsPage()));
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
                      title: 'Déconnexion',
                      color: Colors.red,
                      onTap: () async {
                        await ref
                            .read(loginControllerProvider.notifier)
                            .logout(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
