import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/pages/quiz/controllers/controllers.dart';
import 'package:shamo/pages/quiz/firebase/firebase_configs.dart';

// ignore: must_be_immutable
class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({ Key? key }) : super(key: key);
  PapersDataUploader controller = Get.put(PapersDataUploader());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Obx(() => Text(controller.loadingStatus.value == LoadingStatus.completed ?  "Uploading Complete" : "Uploading...."))
      ),
    );
  }
}