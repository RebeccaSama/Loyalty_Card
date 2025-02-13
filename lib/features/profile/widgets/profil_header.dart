import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loyalty_card/core/common/app_typography.dart';
import 'package:loyalty_card/core/theme/themes.dart';
import 'package:loyalty_card/data/data_images.dart';
import 'package:loyalty_card/features/profile/widgets/primary_container.dart';
import 'package:tuple/tuple.dart';

class ProfilHeader extends StatelessWidget {
  const ProfilHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Tuple2> items = [
      const Tuple2(Icons.phone, "+237 674053983"),
      const Tuple2(Icons.email_outlined, "samarebecca@gmail.com")
    ];
    return Stack(
      children: [
        PrimaryContainer(
          color: AppTheme.kGriserColor.withValues(alpha: 0.1),
          child: Column(
            children: [
              ListTile(
                onTap: () {},
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(DataImages.product),
                        fit: BoxFit.cover,
                      )),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rebecca SAMA",
                      style: AppTypography.kBold16,
                    ),
                    Text(
                      "Inscris depuis 02 mois",
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
