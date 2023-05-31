// import 'dart:io';

// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   final ref = FirebaseDatabase.instance.ref('User');
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: ChangeNotifierProvider(
//           create: (_) => ProfileController(),
//           child:
//               Consumer<ProfileController>(builder: (context, provider, child) {
//             return SafeArea(
//               child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: StreamBuilder(
//                     stream: ref
//                         .child(SessionController().userId.toString())
//                         .onValue,
//                     builder: (context, AsyncSnapshot snapshot) {
//                       if (!snapshot.hasData) {
//                         return const Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       } else if (snapshot.hasData) {
//                         Map<dynamic, dynamic> map =
//                             snapshot.data.snapshot.value;
//                         return Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Stack(alignment: Alignment.bottomCenter, children: [
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 10),
//                                 child: Center(
//                                   child: Container(
//                                     height: 180,
//                                     width: 180,
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         border: Border.all(
//                                             color: AppColors.primaryTextColor)),
//                                     child: ClipRRect(
//                                         borderRadius:
//                                             BorderRadius.circular(100),
//                                         child: provider.image == null
//                                             ? map['profile'].toString() == ""
//                                                 ? const Icon(
//                                                     Icons.person_outline,
//                                                     size: 35,
//                                                   )
//                                                 : Image(
//                                                     fit: BoxFit.cover,
//                                                     image: NetworkImage(
//                                                         map['profile']
//                                                             .toString()),
//                                                     loadingBuilder: (context,
//                                                         child,
//                                                         loadingProgress) {
//                                                       if (loadingProgress ==
//                                                           null) return child;
//                                                       return const Center(
//                                                         child:
//                                                             CircularProgressIndicator(),
//                                                       );
//                                                     },
//                                                     errorBuilder: (context,
//                                                         error, stackTrace) {
//                                                       return Container(
//                                                         child: const Icon(
//                                                           Icons.error_outline,
//                                                           color: AppColors
//                                                               .alertColor,
//                                                         ),
//                                                       );
//                                                     },
//                                                   )
//                                             : Image.file(
//                                                 File(provider.image!.path)
//                                                     .absolute)),
//                                   ),
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   provider.pickImage(context);
//                                 },
//                                 child: const CircleAvatar(
//                                   radius: 14,
//                                   backgroundColor: AppColors.primaryIconColor,
//                                   child: Icon(Icons.add_a_photo_outlined),
//                                 ),
//                               ),
//                             ]),
//                             const SizedBox(
//                               height: 40,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 provider.showUserNameDialogAlert(
//                                     context, map['username']);
//                               },
//                               child: ReusableRow(
//                                   title: 'UserName',
//                                   value: map['username'],
//                                   iconData: Icons.person_outline),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 provider.showPhoneDialogAlert(
//                                     context, map['phone']);
//                               },
//                               child: ReusableRow(
//                                   title: 'Mobile',
//                                   value: map['phone'] == ''
//                                       ? 'xxx-xxx-xxx'
//                                       : map['phone'],
//                                   iconData: Icons.phone_outlined),
//                             ),
//                             ReusableRow(
//                                 title: 'Email',
//                                 value: map['email'],
//                                 iconData: Icons.email_outlined),
//                             const SizedBox(
//                               height: 40,
//                             ),
//                             // RoundButton(
//                             //     title: 'Logout',
//                             //     onPress: () {
//                             //       // Navigator.pushNamed(
//                             //       //     context, RouteName.loginScreen);
//                             //     })
//                           ],
//                         );
//                       } else {
//                         return Center(
//                           child: Text(
//                             'Something went wrong',
//                             style: Theme.of(context).textTheme.subtitle1,
//                           ),
//                         );
//                       }
//                     },
//                   )),
//             );
//           })),
//     );
//   }
// }

// class ReusableRow extends StatelessWidget {
//   final String title, value;
//   final IconData iconData;
//   const ReusableRow(
//       {super.key,
//       required this.title,
//       required this.value,
//       required this.iconData});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           title: Text(
//             title,
//             style: Theme.of(context).textTheme.subtitle2,
//           ),
//           leading: Icon(
//             iconData,
//             color: AppColors.primaryIconColor,
//           ),
//           trailing: Text(
//             value,
//             style: Theme.of(context).textTheme.subtitle2,
//           ),
//         ),
//         Divider(
//           color: AppColors.dividedColor.withOpacity(0.4),
//         )
//       ],
//     );
//   }
// }
