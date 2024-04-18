import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_mobile/data/models/brand.dart';
import 'package:ecommerce_mobile/data/models/product.dart';
import 'package:ecommerce_mobile/data/models/product_type.dart';
import 'package:ecommerce_mobile/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

var db = FirebaseFirestore.instance;

class FirebaseService {
  Future<dynamic> signInWithEmailPassword(String email, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      // await credential.user!.getIdToken();
      return credential;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUpWithEmailPassword(
      String name, String email, String password) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // await credential.user!.getIdToken();
      await credential.user?.updateDisplayName(name);
      await credential.user
          ?.updatePhotoURL("https://example.com/jane-q-user/profile.jpg");
      return credential;
    } catch (e) {
      rethrow;
    }
  }

  User? loadProfile() {
    try {
      return auth.currentUser;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      print('here $email');

      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      rethrow;
    }
  }

  //product_type
  Future<ProductTypeModel?> getProductType() async {
    try {
      final querySnapshot = await db.collection("product_type").get();
      for (var docSnapshot in querySnapshot.docs) {
        // print('${docSnapshot.id} => ${docSnapshot.data()}');
        final data = docSnapshot.data();
        return ProductTypeModel.fromJson(data);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  //brand
  Future<BrandModel?> getBrand() async {
    try {
      final querySnapshot = await db.collection("brand").get();
      for (var docSnapshot in querySnapshot.docs) {
        // print('${docSnapshot.id} => ${docSnapshot.data()}');
        final data = docSnapshot.data();
        return BrandModel.fromJson(data);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  //product
  Future<(List<ProductModel>, DocumentSnapshot?)> getProducts({
    int limit = 5,
    DocumentSnapshot<Object?>? startAfterDoc,
  }) async {
    try {
      // late QuerySnapshot<Map<String, dynamic>> querySnapshot;
      // if (page == 1) {
      //   querySnapshot = await db.collection("products").limit(pageSize).get();
      // } else {}

      // List<ProductModel>? products = [];
      // for (var docSnapshot in querySnapshot.docs) {
      //   // print('${docSnapshot.id} => ${docSnapshot.data()}');
      //   final data = docSnapshot.data();
      //   products.add(ProductModel.fromJson(data));
      // }

      // 1) Query for documents with a limit.
      final query = db.collection('products').limit(limit);

      // 2) If paginating, then use the passed
      //    in document as the query cursor.
      final querySnapshot = startAfterDoc != null
          ? await query.startAfterDocument(startAfterDoc).get()
          : await query.get();

      // 3) If the number of fetched documents is equal to our limit,
      //    then we define the last document as the query cursor.
      final finalDoc =
          querySnapshot.docs.length == limit ? querySnapshot.docs.last : null;

      // 4) Return the fetched documents and query cursor.
      return (
        querySnapshot.docs.map((p) => ProductModel.fromJson(p.data())).toList(),
        finalDoc,
      );
    } catch (e) {
      rethrow;
    }
  }

  //order
  //bag
  //favorite
  //shipping address
  //paymethod
}
