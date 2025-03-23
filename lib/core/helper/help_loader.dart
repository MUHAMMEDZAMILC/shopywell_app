// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../view/components/apptext.dart';
import '../utils/theme/colors.dart';
import '../utils/theme/dimensions.dart';
import 'help_screensize.dart';

bool isLoading = false;

const bgColorLoader = Color(0x0c8e8e8e);

Dialog _alert = Dialog(
  backgroundColor: bgColorLoader,
  insetPadding: const EdgeInsets.all(0),
  child: Center(
    child: Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorResources.WHITE,
      ),
      child: const Center(
        child: CircularProgressIndicator(color: ColorResources.PRIMARYCOLOR),
      ),
    ),
  ),
);

loader({required BuildContext context}) {
  if (isLoading) {
    return;
  }

  isLoading = true;

  try {
    hideKeyboard;
  } catch (_) {
    debugPrint("ERRROR ON SNACKBAR");
  }

  try {
    showDialog(
      barrierDismissible: false,
      context: context,
      useSafeArea: false,
      builder: (BuildContext context) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(statusBarColor: bgColorLoader),
          child: _alert,
        );
      },
    );
  } catch (e) {
    debugPrint("ERRROR ON POPUP:$e");
  }
}

hideLoader(BuildContext context) {
  if (isLoading) {
    isLoading = false;
    Navigator.pop(context);
  }
}

class MyAppLoader extends StatelessWidget {
  const MyAppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SizedBox(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil.screenHeight! * 0.9,
      child: Center(
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorResources.WHITE,
            boxShadow: [
              BoxShadow(
                color: ColorResources.BLACK.withOpacity(0.4),
                blurStyle: BlurStyle.outer,
                blurRadius: 5,
              ),
            ],
          ),
          child: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

class PageEntryLoader extends StatelessWidget {
  const PageEntryLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil.screenHeight,
      color: ColorResources.SCAFFOLDBG,
      child: Center(
        child: CircularProgressIndicator(
          color: ColorResources.PRIMARYCOLOR,
          strokeCap: StrokeCap.round,
          strokeWidth: 5,
        ),
      ),
    );
  }
}

void get hideKeyboard => FocusManager.instance.primaryFocus?.unfocus();

// class CustomCircleLoader extends StatelessWidget {
//    CustomCircleLoader({super.key,this.height,this.width});
//   double? width,height;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height??40,
//       child:  Center(
//         child: LoadingAnimationWidget.waveDots(
//         color: primarycolor,
//         size: 50,
//       ),
//       ),
//     );
//   }
// }

class CustomError extends StatelessWidget {
  CustomError({super.key, this.height, this.width, this.errortext});
  double? width, height;
  String? errortext;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/errorbag.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            gap,
            AppText(
              text: errortext ?? '',
              color: ColorResources.APPBARBG,
              weight: FontWeight.w500,
              letterspace: 0.6,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomNotFound extends StatelessWidget {
  CustomNotFound({super.key, this.height, this.width, this.errortext});
  double? width, height;
  String? errortext;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/emptybag.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            gap,
            AppText(
              text: errortext ?? '',
              color: ColorResources.APPBARBG,
              weight: FontWeight.w500,
              letterspace: 0.6,
            ),
          ],
        ),
      ),
    );
  }
}
