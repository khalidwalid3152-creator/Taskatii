import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:image_picker/image_picker.dart';
import 'package:taskatti/core/constants/Appimages.dart';
import 'package:taskatti/core/features/home/page/home.dart';
import 'package:taskatti/core/functions/showErrorDailog.dart';
import 'package:taskatti/core/services/data_helper.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/styles.dart';
import 'package:taskatti/core/widgets/custom_text_feild.dart';
import 'package:taskatti/core/widgets/main_button.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String path = '';
  var namecontroller = TextEditingController();
  bool istrue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (path.isNotEmpty && namecontroller.text.isNotEmpty) {
                DataHelper.putuserdata(namecontroller.text, path);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              } else if (path.isEmpty && namecontroller.text.isNotEmpty) {
                showErorrDailog(context, ' upload image');
              } else if (path.isNotEmpty && namecontroller.text.isEmpty) {
                showErorrDailog(context, 'enter your name');
              } else {
                showErorrDailog(context, 'enter your name \n upload image');
              }
            },
            child: Text(
              'Done',
              style: TextStyles.bodyStyle(
                color: istrue ? Appcolors.primaryColor : Appcolors.pinkColor,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Appcolors.primaryColor,
                  backgroundImage: path.isNotEmpty
                      ? FileImage(File(path))
                      : AssetImage(Appimages.emptyUser),
                ),
                Gap(20),
                mainButton(
                  text: 'Upload From Camera',
                  ontap: () async {
                    upload_image(iscamera: true);
                  },
                ),
                Gap(10),
                mainButton(
                  text: 'Upload From Gallery',
                  ontap: () async {
                    upload_image(iscamera: false);
                  },
                ),
                Gap(20),
                Divider(),
                Gap(20),
                CustomTextFeild(
                  maxlines: 1,
                  hint: 'Enter your name',
                  controller: namecontroller,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> upload_image({required bool iscamera}) async {
    XFile? file = await ImagePicker().pickImage(
      source: iscamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (file != null) {
      setState(() {
        path = file.path;
      });
    }
  }
}
