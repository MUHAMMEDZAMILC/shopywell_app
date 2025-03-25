// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopywell_app/core/globalvariables.dart';
import 'package:shopywell_app/core/helper/help_toast.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';
import 'package:shopywell_app/core/utils/theme/dimensions.dart';
import 'package:shopywell_app/view/components/appbutton.dart';
import 'package:shopywell_app/view/components/apptext.dart';
import 'package:shopywell_app/view/presentation/product/model/product_model.dart';

import '../../../../core/helper/help_screensize.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil.screenHeight,
      child: Padding(
        padding: const EdgeInsets.all(paddingLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ApBtn(
              onPressed: () async {
                Products body = Products();
                body.id = '0016';
                body.title = "MBJ Women's Solid Short Sleeve Boat Neck V";
                body.description =
                    "95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem";
                body.price = 209;
                body.category = "women's clothing";
                body.image =
                    "https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_.jpg";
                body.rating = Rating(rate: 4.7, count: 130);
                await FirebaseFirestore.instance
                    .collection(productcollection)
                    .doc(body.id)
                    .set(body.toJson())
                    .then((value) {
                      snackBar(
                        context,
                        message: 'Success',
                        type: MessageType.success,
                      );
                    })
                    .onError((error, stackTrace) {
                      snackBar(
                        context,
                        message: 'Failed',
                        type: MessageType.error,
                      );
                    });
              },
              isValid: true,
              child: AppText(text: 'Add Product', color: ColorResources.WHITE),
            ),
          ],
        ),
      ),
    );
  }
}
