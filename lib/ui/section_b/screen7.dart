import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/constants.dart';
import 'package:ifri/constants/section_b.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_option.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/style/custom_toast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ifri/ui/section_b/screen8.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen7 extends StatefulWidget {
  const Screen7({Key? key}) : super(key: key);

  @override
  State<Screen7> createState() => _Screen7State();
}

class _Screen7State extends State<Screen7> {
  DatabaseReference? ref;
  String screenName = "screen_7";
  String _self = "", _market = "", _image = "", userId = "";

  int _count = 0;
  bool isLoading = true;
  TextEditingController response1Controller = TextEditingController();
  TextEditingController response2Controller = TextEditingController();
  SharedPreferences? _sharedPreferences;
  @override
  void initState() {
    super.initState();
    initializeData(context);
  }

  void setSelf(String value) async {
    _self = value;
  }

  void setMarket(String value) async {
    _market = value;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: ColoredBox(
          color: const Color(0xFF12160F),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => {navigateToPreviousScreen(context)},
                      child: Image.asset(
                        'assets/icons/ic_back.png',
                        fit: BoxFit.cover,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: const Text(
                        SectionB.SECTION_B_SECTION_4,
                        style: CustomStyle.screenTitle,
                      ),
                    ),
                    InkWell(
                      onTap: () => {},
                      child: Image.asset(
                        'assets/icons/ic_close.png',
                        fit: BoxFit.cover,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const SizedBox(
                          height: 20,
                          width: 300,
                          child: Divider(color: Color(0xffD1D0BD))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(SectionB.SECTION_B_QUESTION_9,
                              style: CustomStyle.questionTitle),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Local Name", style: CustomStyle.form),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                              controller: response1Controller,
                              style: CustomStyle.form,
                              textAlign: TextAlign.start,
                              decoration: CustomStyle.answerInputDecoration),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("Bot. Name", style: CustomStyle.form),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                              controller: response2Controller,
                              style: CustomStyle.form,
                              textAlign: TextAlign.start,
                              decoration: CustomStyle.answerInputDecoration),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    child: Text("Self-Consumption",
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtonP(setSelf),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 125,
                                    child: Text("Market Sale",
                                        style: CustomStyle.answer),
                                  ),
                                  CustomOption.yesNoButtonP(setMarket),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () => _pickImage(context),
                            splashColor: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(2),
                            child: CustomButton.uploadPictureButton),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () => addData(context),
                            splashColor: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(2),
                            child: CustomButton.addMoreButton),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _count > 0
                        ? Text("$_count records submitted successfully",
                            style: CustomStyle.optionYesNo)
                        : Container(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () => syncData(context),
                            splashColor: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(2),
                            child: CustomButton.nextButton),
                      ],
                    ),
                    const SizedBox(
                      height: 200,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen8();
        },
      ),
    );
  }

  navigateToPreviousScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  void initializeData(BuildContext context) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    userId = _sharedPreferences!.getString(Constants.USER_ID)!;
    ref = FirebaseDatabase.instance.ref('forms/$userId/1/section_b');
    await ref!.child(screenName).child("question_9").update({
      "question": SectionB.SECTION_B_QUESTION_9,
    });

    ref!
        .child(screenName)
        .child("question_9")
        .child("response")
        .get()
        .then((snapshot) {
      print(snapshot.value.toString());
      Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
      print("count : ${values.length}");
      setState(() {
        _count = values.length;
      });
    });
  }

  void addData(BuildContext context) async {
    if (validate()) {
      await ref!
          .child(screenName)
          .child("question_9")
          .child("response")
          .push()
          .set({
        "local_name": response1Controller.text,
        "bot_name": response2Controller.text,
        "self_consumption": _self,
        "market": _market,
        "image": _image
      }).whenComplete(() => {onSuccessfulAdd(context)});
    }
  }

  void onSuccessfulAdd(BuildContext context) {
    CustomToast.showToast("Record Submitted Successfully");

    Navigator.popAndPushNamed(context, "/section_b_screen_7");
  }

  void syncData(BuildContext context) async {
    if (response1Controller.text.isEmpty && response2Controller.text.isEmpty) {
      navigateToNextScreen(context);
    } else {
      await ref!
          .child(screenName)
          .child("question_9")
          .child("response")
          .push()
          .update({
        "local_name": response1Controller.text,
        "bot_name": response2Controller.text,
        "self_consumption": _self,
        "market": _market,
        "image": _image
      }).whenComplete(() => navigateToNextScreen(context));
    }
  }

  bool validate() {
    if (response1Controller.text.isEmpty) {
      CustomToast.showToast(
        "Please enter the local name",
      );
      return false;
    } else if (response2Controller.text.isEmpty) {
      CustomToast.showToast(
        "Please enter the botanical name",
      );
      return false;
    } else {
      return true;
    }
  }

  void _pickImage(BuildContext context) async {
    checkStoragePermission();
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(
        source: ImageSource.gallery, maxWidth: 1000, imageQuality: 75);
    final pickedImageFile = File(pickedImage!.path);
    print("Path : " + pickedImage.path);

    final metadata = SettableMetadata(contentType: "image/jpeg");

    final storageRef = FirebaseStorage.instance
        .ref()
        .child("form")
        .child(userId)
        .child("section_b")
        .child("question_9")
        .child("${DateTime.now().millisecondsSinceEpoch}.jpg");

    final uploadTask = storageRef.putFile(pickedImageFile, metadata);

    uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      switch (taskSnapshot.state) {
        case TaskState.running:
          final progress =
              100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
          CustomToast.showToast("Upload is $progress% complete.");
          break;
        case TaskState.paused:
          CustomToast.showToast("Upload is paused.");
          break;
        case TaskState.canceled:
          CustomToast.showToast("Upload was canceled");
          break;
        case TaskState.error:
          CustomToast.showToast("Upload Error");
          break;
        case TaskState.success:
          CustomToast.showToast("Upload Successful");

          break;
      }
    });
    _image = await storageRef.getDownloadURL();
  }

  Future<void> checkStoragePermission() async {
    var result = await Permission.storage.request();
    if (result != PermissionStatus.granted) {
      CustomToast.showToast(
          "Please provide storage permission to upload picture");
    }
  }
}
