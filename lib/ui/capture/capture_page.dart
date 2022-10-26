import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifri/constants/section_a.dart';
import 'package:ifri/style/custom_button.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/ui/section_b/screen1.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:http_parser/http_parser.dart';

class CapturePage extends StatefulWidget {
  const CapturePage({Key? key, required this.formName}) : super(key: key);
  final String formName;
  @override
  State<CapturePage> createState() => _CapturePageState();
}

const space = SizedBox(
  height: 40,
);

class _CapturePageState extends State<CapturePage> {
  bool isUploading = false;
  double uploadProgress = 0;

  DatabaseReference? ref;
  TextEditingController question1Controller = TextEditingController();
  String screenName = "capture";
  String? userId;

  late FirebaseAuthService authService;
  late Dio dio;
  @override
  void initState() {
    super.initState();
    authService = context.read<FirebaseAuthService>();
    dio = context.read<Dio>();
    initialize();
  }

  void initialize() async {
    // User should be logged in
    userId = authService.user!.uid;
    ref = FirebaseDatabase.instance
        .ref('forms/${userId!}/${widget.formName}/section_b');
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12160F),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isUploading
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: LinearProgressIndicator(
                          color: Colors.greenAccent,
                          backgroundColor: Colors.black,
                          minHeight: 1,
                          value: uploadProgress,
                        ),
                      )
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          FlutterRemix.home_3_line,
                          size: 40,
                          color: Colors.orangeAccent,
                        )),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: const Text(
                        "Site Details : A",
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
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(SectionA.SECTION_A_QUESTION_1,
                          style: CustomStyle.questionTitle),
                      space,
                      TextField(
                          controller: question1Controller,
                          style: CustomStyle.answer,
                          textAlign: TextAlign.start,
                          decoration: CustomStyle.answerInputDecoration),
                      space,
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          SectionA.SECTION_A_QUESTION_1_DETAIL,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: "HelveticaNeue",
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                      space,
                      space,
                      InkWell(
                        onTap: () {
                          final res = postGeoJSONRequest(
                            userId!,
                            question1Controller.text.trim(),
                          );
                        },
                        child:
                            CustomButton.custom(SectionA.SECTION_A_QUESTION_2),
                      ),
                      space,
                      space,
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          SectionA.SECTION_A_QUESTION_2_DETAIL,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: "HelveticaNeue",
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                      space,
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        syncData(context);
                      },
                      splashColor: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(2),
                      child: CustomButton.nextButton,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSendProgress(int count, int total) {
    final progress = count.toDouble() / total.toDouble();
    setState(() {
      isUploading = progress == 1 ? false : true;
      uploadProgress = progress;
    });
    if (progress == 1) {
      Fluttertoast.showToast(
        msg: "Upload File Complete",
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  Future<PlatformFile?> selectFile() async {
    if (await Permission.storage.request().isGranted) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
        dialogTitle: "Pick GeoJSON file",
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        if (file.extension == "geojson") {
          return file;
        } else {
          Fluttertoast.showToast(msg: "Please select .geojson file");
        }
      } else {
        // User canceled the picker
        return null;
      }
    }
    if (await Permission.storage.isPermanentlyDenied) {
      // The user opted to never again see the permission request dialog for this
      // app. The only way to change the permission's status now is to let the
      // user manually enable it in the system settings.
      openAppSettings();
    }
    return null;
  }

  Future<bool> postGeoJSONRequest(String uid, String fileName) async {
    final file = await selectFile();
    if (file == null) {
      return false;
    }
    final formData = FormData.fromMap({
      'name': fileName,
      'file': await MultipartFile.fromFile(
        file.path!,
        contentType: MediaType("application", "geo+json"),
      ),
    });
    try {
      dio.post("/task/$uid", data: formData, onSendProgress: onSendProgress);
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: "Error processing the file : ${e.message}",
        toastLength: Toast.LENGTH_LONG,
      );
    }
    return true;
  }

  void setData() async {
    final response1 = await ref!
        .child(screenName)
        .child("question_1")
        .child("response")
        .get();
    question1Controller.text =
        null == response1.value ? "" : response1.value.toString();
  }

  void syncData(BuildContext context) async {
    await ref!.update({
      screenName: {
        "question_1": {
          "question": SectionA.SECTION_A_QUESTION_1,
          "response": question1Controller.text.replaceAll(" ", "_")
        },
      }
    }).whenComplete(() => navigateToNextScreen(context));
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Screen1(formName: widget.formName);
        },
      ),
    );
  }
}
