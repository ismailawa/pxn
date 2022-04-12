class OnboardingModel {
  final String imageUrl;
  final String title;
  final String subtitle;

  OnboardingModel({this.imageUrl, this.title, this.subtitle});
}

List<OnboardingModel> pages = [
  OnboardingModel(
    imageUrl: 'assets/images/ecommerce.png',
    title: 'Buy cheaper',
    subtitle:
        'Choose from a variety of our Nasco products for lesser the price. We provide high-quality products to you at cheaper rates. No hidden charges!',
  ),
  OnboardingModel(
    imageUrl: 'assets/images/ecommerce1.png',
    title: 'Easy checkout',
    subtitle:
        'From selecting your preferred product to completing your purchase – we have simplified every step for a seamless and stress-free shopping experience.',
  ),
  OnboardingModel(
    imageUrl: 'assets/images/ecommerce.png',
    title: '24/7 Customer support',
    subtitle:
        'Have a problem while shopping? No worries! We’re here for you every step of the way. Just contact the care line. Voila! Problem solved!',
  ),
  OnboardingModel(
    imageUrl: 'assets/images/ecommerce.png',
    title: 'Fast shipping and delivery',
    subtitle:
        'That feeling you get when you realise your goods will be delivered as promised and in a shorter time!',
  ),
  OnboardingModel(
    imageUrl: 'assets/images/ecommerce.png',
    title: 'Flexible payment options to choose from',
    subtitle:
        'One of the numerous benefits of shopping with Nasco-direct, we offer flexible payment options. Cash on delivery, transfers, or payment with your card – your call',
  ),
];
