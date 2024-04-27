class CardModel {
  final String address;
  final String cardId;
  final List<dynamic> email;
  final String imageUrl;
  final String name;
  final List<dynamic> phone;
  final String profession;
  final List<dynamic> social;
  final List<dynamic> socialMediaIcons;
  final String subscriptionAmount;
  final String subscriptionPlan;
  final String uid;
  final String website;

  CardModel({
    required this.socialMediaIcons,
    required this.address,
    required this.cardId,
    required this.email,
    required this.imageUrl,
    required this.name,
    required this.phone,
    required this.profession,
    required this.social,
    required this.subscriptionAmount,
    required this.subscriptionPlan,
    required this.uid,
    required this.website,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      address: json['address'] ?? "",
      cardId: json['cardId'] ?? "",
      email: List<String>.from(json['email'] ?? []),
      imageUrl: json['imageUrl'] ?? "",
      name: json['name'] ?? "",
      phone: List<String>.from(json['phone'] ?? []),
      profession: json['profession'] ?? "",
      social: List<String>.from(json['social'] ?? []),
      subscriptionAmount: json['subscriptionAmount'] ?? "",
      subscriptionPlan: json['subscriptionPlan'] ?? "",
      uid: json['uid'] ?? "",
      website: json['website'] ?? "",
      socialMediaIcons:List<String>.from(json['socialMediaICons']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'cardId': cardId,
      'email': email,
      'imageUrl': imageUrl,
      'name': name,
      'phone': phone,
      'profession': profession,
      'social': social,
      'socialMediaIcons': socialMediaIcons,
      'subscriptionAmount': subscriptionAmount,
      'subscriptionPlan': subscriptionPlan,
      'uid': uid,
      'website': website,
    };
  }
}
