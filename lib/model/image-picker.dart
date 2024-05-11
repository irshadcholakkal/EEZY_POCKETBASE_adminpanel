// import 'dart:html';
// import 'dart:io' if (dart.library.html) 'dart:typed_data';

// import 'package:eezy_admin/model/getx_controller.dart';
// import 'package:eezy_admin/model/image_store.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:universal_html/html.dart' as html;
// import 'package:universal_io/io.dart';
//   final Control controller = Get.put(Control());

// Future<void> pickImage() async {
//   if (kIsWeb) {
//     html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
//     uploadInput.click();

//     uploadInput.onChange.listen((e) {
//       final files = uploadInput.files;
//       if (files != null && files.isNotEmpty) {
//         final file = files.first;
//         final reader = html.FileReader();

//         reader.onLoadEnd.listen((e) {
//           // Do something with the fileBytes (image data)
//           final Uint8List fileBytes = reader.result as Uint8List;

//           if (fileBytes.isNotEmpty) {
//             // Convert Uint8List to File
//             final File imageFile = File.fromRawPath(fileBytes);
//             uploadImageToFirebase(imageFile);

//             // Set the selected image file in the controller
//             // controller.imageFile?.value = imageFile;

//             // Now you can use the File object to upload to Firebase
//             // await uploadImageToFirebase(imageFile);

//             // ... rest of your code
//           } else {
//             print("Error: Selected file has no bytes.");
//           }

//           print("Image pickeddd: ${file.name}");
//         });

//         reader.readAsArrayBuffer(file);
//       }
//     });
//   } else {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       allowMultiple: true,
//       type: FileType.custom,
//       allowedExtensions: ['jpg', 'jpeg', 'png'],
//     );

//     if (result != null) {
//       Uint8List fileBytes = result.files.single.bytes!;

//       // Do something with the fileBytes (image data)

//       if (fileBytes.isNotEmpty) {
//         // Convert Uint8List to File
//         File imageFile = File.fromRawPath(fileBytes);

//         // Set the selected image file in the controller
//         // controller.imageFile?.value = imageFile;

//         // Now you can use the File object to upload to Firebase
//         // await uploadImageToFirebase(imageFile);

//         // ... rest of your code
//       } else {
//         print("Error: Selected file has no bytes.");
//       }

//       print("Image picked: ${result.files.single.name}");
//     } else {
//       // User canceled the picker
//       print("File picking canceled");
//     }
//   }
// }
import 'dart:typed_data';

import 'package:eezy_admin/model/getx_controller.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

final controller = Get.put(Control());

fetchImage(int imageIndex) async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );

    if (result != null) {
      List<PlatformFile> files = result.files;

      for (var platformFile in files) {
        List<int> bytes = platformFile.bytes!;

        String base64Image = base64Encode(bytes);
        Uint8List? decodedBytes = base64.decode(base64Image);

         if (imageIndex == 1) {
        controller.imageBytes1.value = decodedBytes;
      } else if (imageIndex == 2) {
        controller.imageBytes2.value = decodedBytes;
      } else if (imageIndex == 3) {
        controller.imageBytes3.value = decodedBytes;
      } else if (imageIndex == 4) {
        controller.imageBytes4.value = decodedBytes;
      }
   
      }
    } else {
      print('No files picked.');
    }
  } catch (error) {
    print('Error picking files: $error');
  }

  Future<void> uploadFile(File file) async {
    try {
      List<int> bytes = await file.readAsBytes();

      String base64File = base64Encode(bytes);

      print(base64File);
    } catch (error) {
      print('Error uploading file: $error');
    }
  }


}



fetchCategoryImage() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );

    if (result != null) {
      List<PlatformFile> files = result.files;

      for (var platformFile in files) {
        List<int> bytes = platformFile.bytes!;

        String base64Image = base64Encode(bytes);
        Uint8List? decodedBytes = base64.decode(base64Image);

         controller.categoryimage.value=decodedBytes;
      }
    } else {
      print('No files picked.');
    }
  } catch (error) {
    print('Error picking files: $error');
  }

  Future<void> uploadFile(File file) async {
    try {
      List<int> bytes = await file.readAsBytes();

      String base64File = base64Encode(bytes);

      print(base64File);
    } catch (error) {
      print('Error uploading file: $error');
    }
  }
}


fetchBrandImage() async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );

    if (result != null) {
      List<PlatformFile> files = result.files;

      for (var platformFile in files) {
        List<int> bytes = platformFile.bytes!;

        String base64Image = base64Encode(bytes);
        Uint8List? decodedBytes = base64.decode(base64Image);

         controller.imageBytesBrand.value=decodedBytes;
      }
    } else {
      print('No files picked.');
    }
  } catch (error) {
    print('Error picking files: $error');
  }

  Future<void> uploadFile(File file) async {
    try {
      List<int> bytes = await file.readAsBytes();

      String base64File = base64Encode(bytes);

      print(base64File);
    } catch (error) {
      print('Error uploading file: $error');
    }
  }
}

fetchImageUpdate(int imageIndex) async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );

    if (result != null) {
      List<PlatformFile> files = result.files;

      for (var platformFile in files) {
        List<int> bytes = platformFile.bytes!;

        String base64Image = base64Encode(bytes);
        Uint8List? decodedBytes = base64.decode(base64Image);

         if (imageIndex == 0) {
        controller.imageBytes1Update.value = decodedBytes;
      } else if (imageIndex == 1) {
        controller.imageBytes2Update.value = decodedBytes;
      } else if (imageIndex == 2) {
        controller.imageBytes3Update.value = decodedBytes;
      } else if (imageIndex == 3) {
        controller.imageBytes4Update.value = decodedBytes;
      }
   
      }
    } else {
      print('No files picked.');
    }
  } catch (error) {
    print('Error picking files: $error');
  }

  Future<void> uploadFile(File file) async {
    try {
      List<int> bytes = await file.readAsBytes();

      String base64File = base64Encode(bytes);

      print(base64File);
    } catch (error) {
      print('Error uploading file: $error');
    }
  }


}