import 'package:loyalty_card/core/models/onboarding.dart';
import 'package:loyalty_card/data/data_images.dart';

class OnboardingItems {
  final List<Onboarding> items = [
    Onboarding(
      image: DataImages.onboarding1,
      title: 'Fidelisation du client ',
      subtitle:
          'A pour but de maintenir une relation durable avec vos clients en instaurant un climat de confiance.',
    ),
    Onboarding(
      image: DataImages.onboarding2,
      title: 'Gain de points',
      subtitle:
          "Plus vous achetez d'articles, plus vous gagnez de points, lesquels vous permettront d'obtenir une récompense.",
    ),
    Onboarding(
      image: DataImages.onboarding3,
      title: 'Offres actuelles',
      subtitle:
          'Découvrez nos offres actuelles pour profiter des meilleures promotions et avantages.',
    ),
    Onboarding(
        image: DataImages.onboarding4,
        title: 'Bienvenue chez ARNO',
        subtitle:
            "Notre objectif est de renforcer la relation client, stimuler l'engagement, améliorer l'expérience client et accroître la fidélité à long terme.  ")
  ];
}
