import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskatti/core/services/data_helper.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/styles.dart';
import 'package:taskatti/core/widgets/custom_text_feild.dart';
import 'package:taskatti/core/widgets/main_button.dart';

class ChangeImageandname extends StatefulWidget {
  const ChangeImageandname({super.key});
  @override
  State<ChangeImageandname> createState() => _ChangeImageandnameState();
}

class _ChangeImageandnameState extends State<ChangeImageandname> {
  String path = '';
  var cont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: DataHelper.getdata(DataHelper.kimage) != null
                      ? FileImage(File(DataHelper.getdata(DataHelper.kimage)))
                      : null,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 120, 0, 10),
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Appcolors.whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(20),
                          ),
                          content: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                mainButton(
                                  text: 'Upload From Camera',
                                  ontap: () async {
                                    upload_image(iscamera: true);
                                    setState(() async {
                                      await DataHelper.putdata(
                                        DataHelper.kimage,
                                        path,
                                      );
                                    });
                                  },
                                ),
                                Gap(10),
                                mainButton(
                                  text: 'Upload From Gallery',
                                  ontap: () async {
                                    upload_image(iscamera: false);
                                    setState(() async {
                                      await DataHelper.putdata(
                                        DataHelper.kimage,
                                        path,
                                      );
                                    });
                                  },
                                ),
                                Row(),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.camera_alt,
                      color: Appcolors.primaryColor,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Gap(40),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Container(
                width: double.infinity,
                height: 1.5,
                decoration: BoxDecoration(color: Appcolors.primaryColor),
              ),
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${DataHelper.getdata(DataHelper.kname)}',
                    style: TextStyles.titleStyle(
                      color: Appcolors.primaryColor,
                      fontSize: 30,
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Appcolors.primaryColor,
                        width: 2,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(days: 365),
                            backgroundColor: Appcolors.whiteColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(20),
                            ),
                            content: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  CustomTextFeild(
                                    controller: cont,
                                    hint:
                                        '${DataHelper.getdata(DataHelper.kname)}',
                                  ),
                                  Gap(20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: mainButton(
                                          ontap: () {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).hideCurrentSnackBar();
                                            setState(() async {
                                              await DataHelper.putdata(
                                                DataHelper.kname,
                                                cont.text.toString(),
                                              );
                                            });
                                          },
                                          text: 'update your name',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },

                      child: Icon(
                        Icons.edit_outlined,
                        color: Appcolors.primaryColor,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
