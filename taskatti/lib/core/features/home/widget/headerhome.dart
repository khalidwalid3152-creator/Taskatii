import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskatti/core/constants/Appimages.dart';
import 'package:taskatti/core/services/data_helper.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/styles.dart';

class headerhome extends StatelessWidget {
  const headerhome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello,${DataHelper.getdata(DataHelper.kname)}',style: TextStyles.titleStyle(color: Appcolors.primaryColor),),
            Text('Have a Nice Day'),
          ],
        ),
        CircleAvatar(
          radius: 25,
          backgroundImage: DataHelper.getdata(DataHelper.kimage) != null?
            FileImage(File( DataHelper.getdata(DataHelper.kimage))):
            AssetImage(Appimages.emptyUser)
          
        ),
      ],
    );
  }
}