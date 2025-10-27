import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c16/model/User.dart';

class FirestoreManager{

  static CollectionReference<User> getUserCollection(){
    var collection = FirebaseFirestore.instance.collection("User").withConverter(
      fromFirestore: (snapshot, options) {
        var data = snapshot.data();
        var user = User.fromFireStore(data);
        return user;
      },
      toFirestore: (user, options) {
        return user.toFireStore();
      },
    );
    return collection;
  }
  static Future<void> addUser(User user){
    var collection = getUserCollection();
    var doc = collection.doc(user.id);
    return doc.set(user);
  }

  static Future<User?> getUser(String userId)async{
    var collection = getUserCollection();
    var doc = collection.doc(userId);
    var snapshot = await doc.get();
    return snapshot.data();
  }
}