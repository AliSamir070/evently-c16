import 'package:easy_localization/easy_localization.dart';
import 'package:evently_c16/core/resources/AssetsManager.dart';
import 'package:evently_c16/core/resources/DialogUtils.dart';
import 'package:evently_c16/core/reusable_components/CustomButton.dart';
import 'package:evently_c16/core/reusable_components/CustomField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/AppConstants.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  late TextEditingController emailController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("forgetPass".tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image.asset(AssetsManager.forgetPass),
              SizedBox(height: 24,),
              CustomField(
                hint: "email".tr(),
                prefix: AssetsManager.email,
                controller: emailController,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email shouldn't be empty";
                  }
                  var regex = RegExp(emailRegex);
                  if (!regex.hasMatch(value)) {
                    return "Email isn't valid";
                  }
                  return null;
                },
              ),

              SizedBox(height: 24,),
              CustomButton(title: "resetPass".tr(), onPress: () async {
                if (formKey.currentState!.validate()) {
                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: emailController.text);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      DialogUtils.showMessageDialog(
                          context: context,
                          message: "This email is wrong, user not found",
                          positiveActionTitle: "Ok",
                          positiveActionPress: (){
                            Navigator.pop(context);
                          });
                    }
                  }
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
