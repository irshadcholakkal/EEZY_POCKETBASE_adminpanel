import 'package:eezy_admin/model/image-picker.dart';
import 'package:eezy_admin/model/services/api_services.dart';
import 'package:eezy_admin/model/user/user_data.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pocketbase/pocketbase.dart';

import 'categories/categories_service.dart';
import 'product/product_data.dart';

  var authData;

class Authentication {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // Future<UserCredential?> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount!.authentication;
  //     final OAuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );
  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   } catch (e) {
  //     print("Google Sign-In Error: $e");
  //     return null;
  //   }
  // }
  // Future<void> signOut() async {
  //   await _auth.signOut();
  //   await GoogleSignIn().signOut();
  // }






Future adminLogin({email,password})async{
  final authDatas = await pb.admins.authWithPassword(email, password).then((value) => fetchAllData());
  
authData = pb.authStore;
print("au${pb.authStore.isValid}");
print(pb.authStore.token);
print(pb.authStore.model);
print(pb.httpClientFactory);
print(pb.health.client);




}

}
Future fetchAllData() async {
    try {
      await getProductData();
      await getAllBrands();
      await getAllCategories();
      await getAllSizes();
      await getAllUsers();
      print("Fetched");
    } catch (error) {
      print("An error occurred while fetching data: $error");
    }
  }
  
  