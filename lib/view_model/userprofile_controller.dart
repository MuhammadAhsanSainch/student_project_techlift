import 'dart:io';

import 'package:combined_app/model/components/app_colors.dart';
import 'package:combined_app/model/components/components.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends ChangeNotifier {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  final nameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final picker = ImagePicker();

  File? _image;
  File? get image => _image;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future pickGalleryImage(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future pickCameraImage(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
    }
  }

  void pickImage(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 120,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      pickCameraImage(context);
                      Navigator.pop(context);
                    },
                    leading: const Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.buttonColor,
                    ),
                    title: const Text('Camera'),
                  ),
                  ListTile(
                    onTap: () {
                      pickGalleryImage(context);
                      Navigator.pop(context);
                    },
                    leading: const Icon(
                      Icons.image,
                      color: AppColors.buttonColor,
                    ),
                    title: const Text('Gallery'),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> showUserNameDialogAlert(BuildContext context, String name) {
    nameController.text = name;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(child: Text('Update username')),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  MyTextFormField(
                    controller: nameController,
                    label: "Name",
                    hintText: "Enter your name",
                    textInputType: TextInputType.phone,
                    validator: (value) {
                      return "";
                    },
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColors.buttonColor),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Ok',
                    style: Theme.of(context).textTheme.titleSmall!,
                  ))
            ],
          );
        });
  }

  Future<void> showPhoneDialogAlert(BuildContext context, String phoneNumber) {
    phoneController.text = phoneNumber;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(child: Text('Update phone number')),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  MyTextFormField(
                    controller: phoneController,
                    label: "Phone",
                    hintText: "Enter your phone",
                    textInputType: TextInputType.phone,
                    validator: (value) {
                      return "";
                    },
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: Theme.of(context).textTheme.titleSmall,
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.buttonColor,
                          )))
            ],
          );
        });
  }
}
