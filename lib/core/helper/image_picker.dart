// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// Future<String?>? pickImage(
//     {required BuildContext context, required bool isCamera}) async {
//   String? path;

//   await ImageHandler.pickImageFromGallery(isCamera: isCamera)
//       .then((pickedFile) async {
//     if (pickedFile == null) {
//       snack(context, message: "Invalid file", bgcolor: ktoastbg,textcolor: kred);
//       return;
//     }

//     var file = File(pickedFile.path);

//     if (file.lengthSync() > 5000000) {
//       showcustomtoast(context, message: 'Image size exceeds maximum of 5MB', bgcolor: ktoastbg,textcolor: kred);
//       return;
//     }
//     loaderios(context: context);

//     await ImageHandler.cropSelectedImage(pickedFile.path).then((croppedFile) {
//       hideLoader(context);
//       if (croppedFile != null) {
//         path = croppedFile.path;
//         return path;
//       }
//     }).onError((error, stackTrace) {
//       snackBar(context, message: error.toString());
//       return null;
//     });
//   }).onError((error, stackTrace) {
//     snackBar(context, message: error.toString());
//   });
//   return path;
// }

// class ImageHandler {
//   /// Open image gallery and pick an image
//   static Future<XFile?> pickImageFromGallery({required bool isCamera}) async {
//     print("....................................${isCamera}");

//     return await ImagePicker().pickImage(
//         source: isCamera ? ImageSource.camera : ImageSource.gallery,
//         imageQuality: 70,
//         maxWidth: 640);
//   }

//   /// crop selected Image From Gallery and return a File
//   static Future<CroppedFile?> cropSelectedImage(String filePath) async {
//     return await ImageCropper().cropImage(
//       compressFormat: ImageCompressFormat.png,
//       sourcePath: filePath,
//       aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.5),
//       uiSettings: [
//         AndroidUiSettings(
//             toolbarTitle: '',
//             toolbarColor: Colors.black,
//             toolbarWidgetColor: Colors.white,
//             hideBottomControls: true),
//         IOSUiSettings(
//           title: '',
//           resetButtonHidden: true,
//           aspectRatioLockEnabled: true,
//         ),
//       ],
//     );
//   }
// }
