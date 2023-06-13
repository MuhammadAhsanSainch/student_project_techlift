import 'dart:io';

import 'package:combined_app/model/components/app_colors.dart';
import 'package:combined_app/model/components/components.dart';
import 'package:combined_app/model/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  File? _image;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  String name = 'name',
      mobile = '03xxxxxxxxx',
      email = 'someone@example.com',
      imagePath = '';

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("name", name);
    prefs.setString("email", email);
    prefs.setString("mobile", mobile);
    prefs.setString("image", imagePath);
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'name';
      email = prefs.getString('email') ?? 'email';
      mobile = prefs.getString('mobile') ?? 'mobile';
      imagePath = prefs.getString("image") ?? '';
      // _image = File(imagePath);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Stack(alignment: Alignment.bottomCenter, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.buttonColor)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: _image == null
                        ? const Icon(
                            Icons.person_outline,
                            size: 70,
                          )
                        : Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  pickImage(context);
                },
                child: const CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.buttonTextColor,
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    color: AppColors.buttonColor,
                  ),
                )),
          ]),
          const SizedBox(
            height: 40,
          ),
          ReusableRow(
              title: 'UserName',
              value: name,
              iconData: Icons.person_outline,
              onTap: () async {
                showEditDialog(context, "name", name);
              }),
          ReusableRow(
              title: 'Mobile',
              value: mobile,
              iconData: Icons.phone_outlined,
              onTap: () {
                showEditDialog(context, "mobile", mobile);
              }),
          ReusableRow(
              title: 'Email',
              value: email,
              iconData: Icons.email_outlined,
              onTap: () {
                showEditDialog(context, "email", email);
              }),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.save,
              color: AppColors.buttonColor,
            ),
            onPressed: () {
              saveData();
              AppUtils.showflushBar('Data Save Successfully', context);
            },
            label: const Text('Save'),
          )
        ],
      ),
    );
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

  Future pickGalleryImage(BuildContext context) async {
    final pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 100);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imagePath = _image!.path.toString();
      } else {
        AppUtils.showflushBar("No image selected!", context);
      }
    });
  }

  Future pickCameraImage(BuildContext context) async {
    final pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 100);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imagePath = _image!.path.toString();
      } else {
        AppUtils.showflushBar("No image selected!", context);
      }
    });
  }

  void showEditDialog(BuildContext context, String label, String str) async {
    switch (label) {
      case "name":
        nameController.text = str;
        showDialog(
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
                        textInputType: TextInputType.name,
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
                      child: const Text(
                        'Cancel',
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          name = nameController.text;
                        });
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Ok',
                      ))
                ],
              );
            });
        return;
      case "email":
        emailController.text = str;
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Center(child: Text('Update email')),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      MyTextFormField(
                        controller: emailController,
                        label: "Email",
                        hintText: "Enter your email",
                        textInputType: TextInputType.emailAddress,
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
                      child: const Text(
                        'Cancel',
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          email = emailController.text;
                        });
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Ok',
                      ))
                ],
              );
            });
        return;
      case "mobile":
        mobileController.text = str;
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Center(child: Text('Update mobile')),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      MyTextFormField(
                        controller: mobileController,
                        label: "Mobile",
                        hintText: "Enter your mobile",
                        textInputType: TextInputType.name,
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
                      child: const Text(
                        'Cancel',
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          mobile = mobileController.text;
                        });
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Ok',
                      ))
                ],
              );
            });
        return;
    }
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  final IconData iconData;
  final VoidCallback onTap;
  const ReusableRow(
      {super.key,
      required this.title,
      required this.value,
      required this.iconData,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          leading: Icon(
            iconData,
            color: AppColors.buttonColor,
          ),
          trailing: SizedBox(
            width: 228,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                IconButton(
                    onPressed: onTap,
                    icon: const Icon(
                      Icons.edit,
                      color: AppColors.buttonColor,
                    ))
              ],
            ),
          ),
        ),
        Divider(
          color: AppColors.buttonColor.withOpacity(0.4),
        )
      ],
    );
  }
}
