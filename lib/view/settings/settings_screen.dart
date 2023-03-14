import 'package:doctor_clinic/controller/auth/register/register_provider.dart';
import 'package:doctor_clinic/controller/user_provider/user_provider.dart';
import 'package:doctor_clinic/helpers/colors/colors.dart';
import 'package:doctor_clinic/helpers/size/size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context, listen: false);
    final provider = Provider.of<RegisterProvider>(context, listen: false);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .32,
            color: const Color(0xff418F9B),
            child: Column(
              children: [
                user.userModel?.profilePic != null
                    ? CircleAvatar(
                        backgroundImage:
                            NetworkImage("${user.userModel?.profilePic}"),
                        radius: 60,
                      )
                    : const CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 60,
                      ),
                Ksize.ksize20,
                Text(
                  "${user.userModel?.name ?? "Name"}",
                  style: Tstyles.wsubheading,
                ),
                Ksize.ksize5,
                Text(
                  "${user.userModel?.email ?? "Email"}",
                  style: Tstyles.wsubheading,
                ),
                Ksize.ksize5,
                Text(
                  "${user.userModel?.phoneNumber ?? "Phone No"}",
                  style: Tstyles.wsubheading,
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(40),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                provider.signOut(context);
              },
              child: const Text("Sign Out"),
            ),
          ),
        ],
      ),
    )));
  }
}
