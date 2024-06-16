import 'dart:io';

import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfileViemModel extends GetxController {
  /// for picking the product's image
  var selectImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  Rx<bool> isUploaded = false.obs;

  void getImage(
    ImageSource imageSource,
  ) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectImagePath.value = pickedFile.path;
      selectedImageSize.value =
          "${(((File(selectImagePath.value)).lengthSync() / 1024 / 1024)).toStringAsFixed(2)} Mb";
      isUploaded.value = true;
    } else {
      isUploaded.value = false;

      Get.snackbar(
        'Error',
        'No Image Picked',
        colorText: AppColors.errorRed,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void deleteImage() {
    selectImagePath.value = '';
    isUploaded.value = false;
  }

  /// for picking the product's image
}
