import 'package:loyalty_card/core/models/onboarding.dart';
import 'package:loyalty_card/data/data_images.dart';

class OnboardingItems {
  final List<Onboarding> items = [
    Onboarding(
      image: DataImages.onboarding1,
      title: 'Fidélisation du client ',
      subtitle:
          "Profitez d'une relation de confiance durable et soyez récompensé pour votre fidélité !",
    ),
    Onboarding(
      image: DataImages.onboarding2,
      title: 'Gain de points',
      subtitle:
          "Accumulez des points à chaque achat et transformez-les en récompenses exclusives !",
    ),
    Onboarding(
      image: DataImages.onboarding3,
      title: 'Offres actuelles',
      subtitle:
          'Découvrez nos offres actuelles pour profiter des meilleures promotions et avantages.',
    ),
    Onboarding(
        image: DataImages.onboarding4,
        title: 'Bienvenue chez SODICAM',
        subtitle:
            "Nous optimisons votre expérience, boostons l’engagement et assurons une fidélité durable.")
  ];
}
