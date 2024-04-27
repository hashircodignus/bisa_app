class SavedCardModel {
  final String address;
  final String cardId;
  final List<dynamic> email;
  final String imageUrl;
  final String name;
  final List<dynamic> phone;
  final String profession;
  final String savedBy;
  final List<dynamic> social;
  final String subscriptionAmount;
  final String subscriptionPlan;
  final String uid;
  final String website;
  final List<dynamic> socialMediaIcons;

  SavedCardModel({
    required this.address,
    required this.cardId,
    required this.email,
    required this.imageUrl,
    required this.name,
    required this.phone,
    required this.profession,
    required this.savedBy,
    required this.social,
    required this.subscriptionAmount,
    required this.subscriptionPlan,
    required this.uid,
    required this.socialMediaIcons,
    required this.website,
  });

  factory SavedCardModel.fromJson(Map<String, dynamic> json) {
    return SavedCardModel(
      address: json['address'] ?? '',
      cardId: json['cardId'] ?? '',
      email: List<dynamic>.from(json['email'] ?? []),
      imageUrl: json['imageUrl'] ?? '',
      name: json['name'] ?? '',
      phone: List<dynamic>.from(json['phone'] ?? []),
      profession: json['profession'] ?? '',
      savedBy: json['savedBy'] ?? '',
      social: List<dynamic>.from(json['social'] ?? []),
      subscriptionAmount: json['subscriptionAmount'] ?? '',
      subscriptionPlan: json['subscriptionPlan'] ?? '',
      uid: json['uid'] ?? '',
      website: json['website'] ?? '',
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
      'savedBy': savedBy,
      'social': social,
      'socialMediaIcons': socialMediaIcons,
      'subscriptionAmount': subscriptionAmount,
      'subscriptionPlan': subscriptionPlan,
      'uid': uid,
      'website': website,
    };
  }
}
