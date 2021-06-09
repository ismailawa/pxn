class OnboardingModel {
  final String imageUrl;
  final String title;
  final String subtitle;

  OnboardingModel({this.imageUrl, this.title, this.subtitle});
}

List<OnboardingModel> pages = [
  OnboardingModel(
    imageUrl: 'assets/images/utilities.svg',
    title: 'Utilities',
    subtitle:
        'Something About the product image display here.Something About the product image display here.Something About the product image display here.',
  ),
  OnboardingModel(
    imageUrl: 'assets/images/transfer.svg',
    title: 'Transfer',
    subtitle:
        'Something About the product image display here.Something About the product image display here.Something About the product image display here.',
  ),
  OnboardingModel(
    imageUrl: 'assets/images/carby.svg',
    title: 'Carby',
    subtitle:
        'Something About the product image display here.Something About the product image display here.Something About the product image display here.',
  ),
  OnboardingModel(
    imageUrl: 'assets/images/ecommerce.svg',
    title: 'ECommerce',
    subtitle:
        'Something About the product image display here.Something About the product image display here.Something About the product image display here.',
  ),
  OnboardingModel(
    imageUrl: 'assets/images/ecurrency.svg',
    title: 'ECurrency',
    subtitle:
        'Something About the product image display here.Something About the product image display here.Something About the product image display here.',
  ),
];
