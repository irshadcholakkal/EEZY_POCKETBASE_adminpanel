// import 'package:eezy_admin/model/user/get_user_data_model_class.dart';
// import 'package:eezy_admin/model/getx_controller.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
//   final Control controller = Get.put(Control());

// // Function to store Google signed user name and email in Firestore
// Future<void> storeUserData() async {
//   // Check if the user is signed in
//   User? user = FirebaseAuth.instance.currentUser;
//   if (user != null) {
//     // Get user data
//     String displayName = user.displayName ?? "";
//     String email = user.email ?? "";
//     String photoURL = user.photoURL ?? "";

//     // Get a reference to the Firestore database
//     FirebaseFirestore firestore = FirebaseFirestore.instance;

//     // Create a document reference in the 'users' collection with the user's UID
//     DocumentReference userRef = firestore.collection('Admin-User').doc("Admin_Panel").collection("user").doc(user.displayName).collection("Detials").doc(user.uid);

//     // Set the user data in the document
//     try {
//       await userRef.set({
//         'displayName': displayName,
//         'email': email,
//         'photoURL': photoURL,
//       });

//       print('User data stored successfully in Firestore!');
//     } catch (error) {
//       print('Error storing user data: $error');
//     }
//   } else {
//     print('User is not signed in.');
//   }
// }

//  Future<void> getUserData() async {
//     // Check if the user is signed in
//     User? user = FirebaseAuth.instance.currentUser;

//     if (user != null) {
//       try {
//         // Get a reference to the Firestore database
//         FirebaseFirestore firestore = FirebaseFirestore.instance;

//         // Get the user document from the 'User' collection (make sure it matches your collection name)
//         DocumentSnapshot userSnapshot =
//             await firestore.collection('Admin-User').doc("Admin_Panel").collection("user").doc(user.displayName).collection("Detials").doc(user.uid).get();

//         // Check if the document exists
//         if (userSnapshot.exists) {
//           // Extract data from the document
//           Map<String, dynamic> userDataMap =
//               userSnapshot.data() as Map<String, dynamic>;

//           // Create a User object
//           UserData fetchedUser = UserData(
//             displayName: userDataMap['displayName'],
//             email: userDataMap['email'],
//             photoURL: userDataMap['photoURL'],
//           );

//           controller.userData.value = fetchedUser;
//         } else {
//           print('User document does not exist in Firestore.');
//         }
//       } catch (error) {
//         print('Error retrieving user data: $error');
//       }
//     } else {
//       print('User is not signed in.');
//     }
//   }

import 'package:eezy_admin/model/getx_controller.dart';
import 'package:eezy_admin/model/services/api_services.dart';
import 'package:eezy_admin/model/user/get_user_data_model_class.dart';
import 'package:get/get.dart';


Future getAllUsers() async {
  final Control controller = Get.put(Control());

  try {
    final records = await pb.collection('users').getFullList();
 controller.usersData.value = records
          .map<UsersData>((record) => UsersData.fromJson(record.toJson()))
          .toList();    print(records);
  } catch (e) {
    print('Error fetching data: $e');
  }
}
