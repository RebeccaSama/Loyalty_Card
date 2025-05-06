import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loyalty_card/core/common/app_typography.dart';
import 'package:loyalty_card/core/models/user.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/core/utils/color_contacts.dart';
import 'package:loyalty_card/features/profile/widgets/primary_container.dart';
import 'package:tuple/tuple.dart';

class ProfilHeader extends StatelessWidget {
  final User user;
  const ProfilHeader({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    String inscriptionDepuis(DateTime createdAt) {
      final now = DateTime.now();
      final difference = now.difference(createdAt);

      if (difference.inDays < 1) {
        return "Inscris aujourd'hui";
      } else if (difference.inDays < 30) {
        return "Inscris depuis ${difference.inDays} jour${difference.inDays > 1 ? 's' : ''}";
      } else if (difference.inDays < 365) {
        final months = (difference.inDays / 30).floor();
        return "Inscris depuis $months mois";
      } else {
        final years = (difference.inDays / 365).floor();
        return "Inscris depuis $years an${years > 1 ? 's' : ''}";
      }
    }

    List<Tuple2> items = [
      Tuple2(Icons.phone, "+237 ${user.phoneNumber}"),
      Tuple2(Icons.email_outlined, user.email)
    ];
    return Stack(
      children: [
        PrimaryContainer(
          color: AppTheme.kGriserColor.withValues(alpha: 0.1),
          child: Column(
            children: [
              ListTile(
                onTap: () {},
                leading: AdvancedAvatar(
                  name: user.fullName,
                  statusAlignment: Alignment.bottomRight,
                  size: 56,
                  style: AppTypography.kBold16.copyWith(color: Colors.white),
                  decoration: BoxDecoration(
                    color: colorAvatar(user.fullName),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.fullName,
                      style: AppTypography.kBold16,
                    ),
                    Text(
                      inscriptionDepuis(user.createdAt),
                      style: AppTypography.kExtraLight14,
                    )
                  ],
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 300,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: null,
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: AppTheme.kPrimary12),
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              items[index].item1,
                              size: 16,
                              color: AppTheme.kPrimaryColor,
                            ),
                          ),
                          const Gap(8),
                          Text(
                            items[index].item2,
                            style: AppTypography.kExtraLight16,
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, _) => const Divider(),
                  itemCount: items.length)
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 44,
              width: 44,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.kPrimaryColor,
              ),
              child: const Icon(
                Iconsax.edit_2_outline,
                size: 22,
                color: AppTheme.kWhiteColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
