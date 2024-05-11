// // import 'package:firebase_storage/firebase_storage.dart';

// // Future uploadImage(imageFile) async {
// //   var imageName = DateTime.now().millisecondsSinceEpoch.toString();
// //   var storageRef =
// //       FirebaseStorage.instance.ref().child('driver_images/$imageName.jpg');
// //   var uploadTask = storageRef.putFile(imageFile);
// //   var downloadUrl = await (await uploadTask).ref.getDownloadURL();
// //   print("=========================================${downloadUrl}");
// // }



// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart' as Path;


// Future<void> uploadFile(File imageFile) async {
//   String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//   Reference storageReference = FirebaseStorage.instance.ref().child('chats/$fileName');
//   UploadTask uploadTask = storageReference.putFile(imageFile);

//   await uploadTask.whenComplete(() => print('File Uploaded'));

//   // Get the download URL
//   String downloadURL = await storageReference.getDownloadURL();

//   print('Download URL: $downloadURL');
// }


// Future<String> uploadImageToFirebase(File image) async {
//     try {
//       FileImage fileName = FileImage(image);
//       Reference storageReference =
//           FirebaseStorage.instance.ref().child('images/$fileName');

//       // Upload the file to Firebase Storage
//       await storageReference.putFile(image);

//       // Get the download URL of the uploaded file
//       String downloadURL = await storageReference.getDownloadURL();

//       print('Image uploaded to Firebase Storage. Download URL: $downloadURL');
//      // printimage = downloadURL;

//       // Return the download URL
//       return downloadURL;
//     } catch (error) {
//       print('Error uploading image to Firebase Storage: $error');
//       return"";}}