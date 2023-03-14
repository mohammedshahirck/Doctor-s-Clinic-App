import 'package:doctor_clinic/controller/user_provider/user_provider.dart';
import 'package:doctor_clinic/helpers/colors/colors.dart';
import 'package:doctor_clinic/view/user_details_get/widget/textfield.dart';
import 'package:doctor_clinic/view/widgets/background_gradiant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfromationScreen extends StatelessWidget {
  const UserInfromationScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: false);
    final isLoading = provider.isLoading;

    return Scaffold(
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : BackgroundGradiant(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 5.0),
                  child: Center(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => provider.selectImage(context),
                          child: provider.image == null
                              ? const CircleAvatar(
                                  backgroundColor: Colors.greenAccent,
                                  radius: 50,
                                  child: Icon(
                                    Icons.account_circle,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundImage: FileImage(provider.image!),
                                  radius: 50,
                                ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          margin: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              // name field
                              textFeld(
                                hintText: "John Smith",
                                icon: Icons.account_circle,
                                inputType: TextInputType.name,
                                maxLines: 1,
                                controller: provider.nameController,
                              ),

                              // email
                              textFeld(
                                hintText: "abc@example.com",
                                icon: Icons.email,
                                inputType: TextInputType.emailAddress,
                                maxLines: 1,
                                controller: provider.emailController,
                              ),

                              // bio
                              textFeld(
                                hintText: "Enter your bio here...",
                                icon: Icons.edit,
                                inputType: TextInputType.name,
                                maxLines: 2,
                                controller: provider.bioController,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              return provider.storeData(context);
                            },
                            child: Text(
                              "Continue",
                              style: Tstyles.heading,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
