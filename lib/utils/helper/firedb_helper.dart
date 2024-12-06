import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_auth/screen/home/model/home_model.dart';
import 'package:fire_auth/utils/helper/fireauth_helper.dart';

class FirebaseDBHelper {
  static FirebaseDBHelper helper = FirebaseDBHelper._();

  FirebaseDBHelper._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? uId;

  void getUserId() {
    uId = FireAuthHelper.helper.user!.uid;
  }

  void getUser(HomeModel m1) async {
    getUserId();
    await firestore.collection('user').doc(uId).set(m1.modelToMap());
  }

  Future<HomeModel> currentUser() async {
    getUserId();
    DocumentSnapshot snapshot =
        await firestore.collection('user').doc(uId).get();
    Map? m1 = snapshot.data() as Map?;
    HomeModel model =
        HomeModel.mapToModel(m1 ?? {'userEmail': '', 'userName': ''});
    return model;
  }

  Future<void> addNotes(
      {required String id,
      required String notes,
      required String date,
      required String time}) async {
    await firestore.collection('user').doc(uId).collection('notes').add(
      {
        'id': FireAuthHelper.helper.user!.uid,
        'notes': notes,
        'date': date,
        'time': time
      },
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> writeNotes() {
    return firestore
        .collection('user')
        .doc(uId)
        .collection('notes')
        .orderBy('date')
        .snapshots();
  }


}
