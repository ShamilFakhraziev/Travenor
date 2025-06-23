class Destination {
  final int id;
  final List<String> imageUrls;
  final String title;
  final String country;
  final String district;
  final double rating;
  final int price;
  final String about;

  Destination({
    required this.id,
    required this.imageUrls,
    required this.title,
    required this.country,
    required this.district,
    required this.rating,
    required this.price,
    required this.about,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrls': imageUrls,
      'title': title,
      'country': country,
      'district': district,
      'rating': rating,
      'price': price,
      'about': about,
    };
  }

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      id: json['id'] as int,
      imageUrls: (json['imageUrls'] as List).map((e) => e as String).toList(),
      title: json['title'] as String,
      country: json['country'] as String,
      district: json['district'] as String,
      rating: (json['rating'] as num).toDouble(),
      price: json['price'] as int,
      about: json['about'] as String,
    );
  }
}
