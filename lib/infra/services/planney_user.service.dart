import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:planney/stores/planney_user.store.dart';

class PlanneyUserService {
  Future<DocumentSnapshot?> get() async {
    final db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final documentSnapshot = await db.collection('users').doc(user.uid).get();

      return documentSnapshot;
    } else {
      return null;
    }
  }

  Future<bool> update(Map<String, dynamic> map) async {
    final planneyUserStore = GetIt.instance.get<PlanneyUserStore>();

    final db = FirebaseFirestore.instance;

    await db.collection('users').doc(planneyUserStore.uid).update(map);

    return true;
  }
}
