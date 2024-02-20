class Background {
  final int id;
  final String image;
  final String smallImage;
  final int price;

  factory Background.defaultBG() {
    return const Background(
      id: -1,
      image: 'assets/png/bg/bg1.png',
      smallImage: '',
      price: 0,
    );
  }

  const Background({
    required this.id,
    required this.image,
    required this.smallImage,
    required this.price,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Background &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          image == other.image &&
          smallImage == other.smallImage &&
          price == other.price;

  @override
  int get hashCode =>
      id.hashCode ^ image.hashCode ^ smallImage.hashCode ^ price.hashCode;
}
