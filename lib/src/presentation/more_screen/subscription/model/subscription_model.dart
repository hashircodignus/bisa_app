class SubscriptionPlan {
    String? name;
   double? amount;
   int? duration;
   bool? isTrial;

  SubscriptionPlan({
     this.name,
     this.amount,
     this.duration,
     this.isTrial,
});

    factory SubscriptionPlan.fromMap(Map<String, dynamic> map) {
      return SubscriptionPlan(
        name: map['name'] ?? '',
        amount: double.parse(map['amount'] ?? '0'),
        duration: map['duration'] ?? 0,
        isTrial: map['isTrial'] ?? false,
      );
    }

}