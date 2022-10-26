import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/services/discussion_service/discussion_data.dart';
import 'package:ifri/services/discussion_service/discussion_service_impl.dart';
import 'package:ifri/style/custom_style.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key, this.isReply = false, this.ref}) : super(key: key);
  final bool isReply;
  final DocumentReference? ref;

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  late DiscussionService discussionService;
  late FirebaseAuthService authService;

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController stepsController = TextEditingController();

  PlatformFile? file;
  bool isBugReport = false;

  void setBugReport(bool? val) {
    setState(() {
      isBugReport = val ?? false;
    });
  }

  Future<void> makePost() async {
    final now = DateTime.now();

    final postData = PostData(
      authorEmail: authService.user!.email!,
      postUID: "none",
      authorName: (await authService.userName)!,
      authorUID: authService.user!.uid.toString(),
      postTitle: titleController.text.trim(),
      postDescription: descController.text.trim(),
      authoredDate: now,
      lastEdited: now,
      upvotes: 0,
      upvotersUID: [],
      isReply: widget.isReply,
      isByAdmin: authService.isUserAdmin!,
    );

    if (!isBugReport) {
      DocumentReference<Map<String, dynamic>>? reference;
      if (widget.isReply) {
        reference = await discussionService.makeReply(widget.ref!, postData);
      } else {
        reference = await discussionService
            .makePost(postData)
            .onError((error, stackTrace) {
          discussionService.logger.e("Error making post ", error, stackTrace);
          Fluttertoast.showToast(
            msg: "Error posting the question ! ",
            toastLength: Toast.LENGTH_LONG,
          );
          return null;
        });
      }
      if (reference != null) {
        reference.set({"postUID": reference.id}, SetOptions(merge: true));
        await Fluttertoast.showToast(
          msg: widget.isReply ? "Reply Posted" : "Question Posted ",
          toastLength: Toast.LENGTH_LONG,
        );
        Navigator.pop(context);
      }
    }
  }

  Future<void> makeBugReport() async {
    String? location = file == null ? null : "bugs/${file?.name}";
    if (file != null) {
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child("bugs/${file!.name}");
      try {
        await imageRef.putData(file!.bytes!);
      } on FirebaseException catch (e) {
        discussionService.logger.e("Error Uploading Image", e, e.stackTrace);
        location = null;
        Fluttertoast.showToast(msg: "Error Uploading Image");
      }
    }

    final bug = BugReportData(
      bugReportUID: "none",
      title: titleController.text,
      description: descController.text,
      stepsToFind: stepsController.text,
      screenshotURL: location,
    );

    DocumentReference<Map<String, dynamic>>? reference;
    reference =
        await discussionService.makeBugReport(bug).onError((error, stackTrace) {
      discussionService.logger.e("Error making post ", error, stackTrace);
      Fluttertoast.showToast(
        msg: "Error posting the question ! ",
        toastLength: Toast.LENGTH_LONG,
      );
    });
    if (reference != null) {
      reference.set({"bugReportID": reference.id}, SetOptions(merge: true));
      await Fluttertoast.showToast(
        msg: "Bug Posted",
        toastLength: Toast.LENGTH_LONG,
      );
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
    discussionService = context.read<DiscussionService>();
    authService = context.read<FirebaseAuthService>();
  }

  @override
  Widget build(BuildContext context) {
    final hintText =
        "Write your ${isBugReport ? "Bug" : widget.isReply ? "reply" : "question"} title here!";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text(widget.isReply ? "New Reply" : "New Post"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBugReport) {
            makeBugReport();
          } else {
            makePost();
          }
        },
        child: const Icon(FlutterRemix.send_plane_2_fill),
      ),
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!widget.isReply)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: CheckboxListTile(
                      value: isBugReport,
                      onChanged: setBugReport,
                      title: const Text(
                        "Is this a bug report?",
                        style: CustomStyle.questionTitle,
                      ),
                      tileColor: Colors.black,
                      checkColor: Colors.black,
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                if (!widget.isReply)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: ListTile(
                      title: Text(
                        "Note : Bug reports directly are sent to the admins anonymously. Click on the above button to send one",
                        style: CustomStyle.form.copyWith(fontSize: 10),
                      ),
                      tileColor: Colors.grey.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    "Basic Details (required)",
                    style: CustomStyle.screenTitle,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  child: Column(
                    children: [
                      TextField(
                        autocorrect: true,
                        controller: titleController,
                        minLines: 1,
                        maxLines: 2,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: hintText,
                          hintStyle: CustomStyle.questionBoldTitle
                              .copyWith(color: Colors.grey.shade500),
                        ),
                        style: CustomStyle.questionBoldTitle,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(color: Colors.white),
                      TextField(
                        autocorrect: true,
                        controller: descController,
                        maxLength: 1000,
                        minLines: 2,
                        maxLines: 15,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Description",
                          hintStyle: CustomStyle.form
                              .copyWith(color: Colors.grey.shade600),
                          counterStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: CustomStyle.form,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                if (isBugReport)
                  Container(
                    color: Colors.black,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      autocorrect: true,
                      controller: stepsController,
                      maxLength: 1000,
                      minLines: 2,
                      maxLines: 15,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Steps to reproduce",
                        hintStyle: CustomStyle.form
                            .copyWith(color: Colors.grey.shade600),
                        counterStyle: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: CustomStyle.form,
                    ),
                  ),
                if (isBugReport)
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () async {
                        file = await selectFile();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.all(15),
                        child: const Text(
                          "Add image attachment",
                          style: CustomStyle.form,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<PlatformFile?> selectFile() async {
    if (await Permission.storage.request().isGranted) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        dialogTitle: "Pick Image file",
        withData: true,
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        return file;
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
}
