import 'package:flutter/material.dart';
import 'package:taskatti/core/constants/Appimages.dart';
import 'package:taskatti/core/features/home/page/home.dart';
import 'package:taskatti/core/features/upload/upload_screen.dart';
import 'package:taskatti/core/services/data_helper.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:taskatti/core/utils/styles.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bool isupload = DataHelper.getdata('isupload') ?? false;
    Future.delayed(Duration(seconds: 3), () {
      if(isupload){
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
      }else{
              Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UploadScreen()),
      );
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(Appimages.logojson, width: 250),
            Text('Taskati', style: TextStyles.titleStyle(fontSize: 24)),
            Gap(15),
            Text(
              "It's Time to Get Organized",
              style: TextStyles.bodyStyle(color: Appcolors.grayColor),
            ),
          ],
        ),
      ),
    );
  }
}
