class Rider {
  final int id;
  final String image;
  final int price;

  factory Rider.defaultSkin() =>
      const Rider(id: -1, image: "assets/png/rider1.png", price: 0);

  const Rider({
    required this.id,
    required this.image,
    required this.price,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Rider &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          image == other.image &&
          price == other.price;

  @override
  int get hashCode => id.hashCode ^ image.hashCode ^ price.hashCode;
}
