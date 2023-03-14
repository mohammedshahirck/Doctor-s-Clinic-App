import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_clinic/controller/auth/otp/otp_provider.dart';
import 'package:doctor_clinic/model/user_model.dart';

import 'package:doctor_clinic/utils/utils.dart';
import 'package:doctor_clinic/view/widgets/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  bool isLoading = false;
  File? image;
  UserModel? _userModel;
  UserModel? get userModel => _userModel;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String? _uid;
  String get uid => _uid!;
  bool isSignedIn = false;

  void selectImage(BuildContext context) async {
    image = await pickImage(context);
    notifyListeners();
  }

  Future<String> storeFileToStorage(String ref, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  void saveUserDataToFirebase({
    required BuildContext context,
    required UserModel userModel,
    required File profilePic,
    required Function onSuccess,
  }) async {
    isLoading = true;
    notifyListeners();
    try {
      await storeFileToStorage("profilePic/$_uid", profilePic).then((value) {
        userModel.profilePic = value;
        userModel.createdAt = DateTime.now().millisecondsSinceEpoch.toString();
        userModel.phoneNumber = firebaseAuth.currentUser!.phoneNumber!;
        userModel.uid = firebaseAuth.currentUser!.phoneNumber!;
      });
      _userModel = userModel;

      // uploading to database
      await firebaseFirestore
          .collection("users")
          .doc(_uid)
          .set(userModel.toMap())
          .then((value) {
        onSuccess();
        isLoading = false;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      isLoading = false;
      notifyListeners();
    }
  }

  // void storeData(BuildContext context) async {
  //   final navContext = Navigator.of(context);
  //   isLoading = true;

  //   UserModel? usermodel = UserModel(
  //       name: nameController.text.trim(),
  //       email: emailController.text.trim(),
  //       bio: bioController.text.trim(),
  //       profilePic: "",
  //       createdAt: "",
  //       phoneNumber: "",
  //       uid: uid);
  //   await UserService().storeData(usermodel, uid, context);
  //   isLoading = false;
  //   notifyListeners();
  //   if (image != null) {
  //     saveUserDataToFirebase(
  //         context: context,
  //         userModel: userModel,
  //         profilePic: image!,
  //         onSuccess: () {
  //           storeUserDetails().then(
  //             (value) => provider.setSignIn().then(
  //                   (value) => navContext.pushAndRemoveUntil(
  //                       MaterialPageRoute(
  //                         builder: (ctx) => const BottomNav(),
  //                       ),
  //                       (route) => false),
  //                 ),
  //           );
  //         });
  //   } else {
  //     return showSnackBar(context, "Please upload your profile photo");
  //   }
  // }

  void storeData(BuildContext context) async {
    UserModel userModel = UserModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      bio: bioController.text.trim(),
      profilePic: "",
      createdAt: "",
      phoneNumber: "",
      uid: "",
    );
    if (image != null) {
      saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        profilePic: image!,
        onSuccess: () {
          saveUserDataToSP().then(
            (value) => OtpProvider().setSignIn().then(
                  (value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BottomNav(),
                      ),
                      (route) => false),
                ),
          );
        },
      );
    } else {
      showSnackBar(context, "Please upload your profile photo");
    }
  }

  Future getDatafromFirestore() async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      _userModel = UserModel(
        name: snapshot['name'],
        email: snapshot['email'],
        createdAt: snapshot['createdAt'],
        bio: snapshot['bio'],
        uid: snapshot['uid'],
        profilePic: snapshot['profilePic'],
        phoneNumber: snapshot['phoneNumber'],
      );
      _uid = userModel!.uid;
    });
  }

  Future saveUserDataToSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString("user_model", jsonEncode(userModel!.toMap()));
  }

  Future getDataFromFS() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String data = s.getString("user_model") ?? '';
    _userModel = UserModel.fromMap(jsonDecode(data));
    _uid = _userModel!.uid;
    notifyListeners();
  }

  Future userSignOut() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await firebaseAuth.signOut();
    isSignedIn = false;
    notifyListeners();
    s.clear();
  }
}
