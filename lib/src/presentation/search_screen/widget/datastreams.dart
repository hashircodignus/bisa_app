// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// Stream<QuerySnapshot> getCardsStream() {
//   return FirebaseFirestore.instance.collection('cards')
//     .where('uid', isNotEqualTo: FirebaseAuth.instance.currentUser?.uid)
//     .snapshots();
// }

// Stream<QuerySnapshot> getSavedCardsStream() {
//   return FirebaseFirestore.instance.collection('saved')
//     .where('savedBy', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
//     .snapshots();
// }
