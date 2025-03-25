import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopywell_app/core/helper/help_loader.dart';
import 'package:shopywell_app/core/helper/help_screensize.dart';
import 'package:shopywell_app/core/helper/help_toast.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';
import 'package:shopywell_app/core/utils/theme/dimensions.dart';
import 'package:shopywell_app/view/components/appbar.dart';
import 'package:shopywell_app/view/components/appbutton.dart';
import 'package:shopywell_app/view/components/apptext.dart';
import 'package:shopywell_app/view/components/apptextfeild.dart';
import 'package:shopywell_app/view/presentation/profile/viewmodel/bloc/profile_bloc.dart';
import 'package:shopywell_app/view/presentation/signin/viewmodel/bloc/login_bloc.dart';
import 'package:shopywell_app/view/presentation/signup/model/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  TextEditingController emailCtrl = TextEditingController(),
      nameCtrl = TextEditingController(),
      passwordCtrl = TextEditingController(),
      pincodeCtrl = TextEditingController(),
      addressCtrl = TextEditingController(),
      cityCtrl = TextEditingController(),
      stateCtrl = TextEditingController(),
      countryCtrl = TextEditingController(),
      accnoCtrl = TextEditingController(),
      holdernameCtrl = TextEditingController(),
      ifscCtrl = TextEditingController();
  @override
  void initState() {
    getdata();
    super.initState();
  }

  getdata() async {
    context.read<ProfileBloc>().add(ProfileInitEvent(context));
    context
        .read<ProfileBloc>()
        .stream
        .firstWhere((element) => (element.status == ProfileStatus.loaded))
        .then((value) {
          UserData? data = value.userdata;
          nameCtrl.text = data?.name ?? '';
          emailCtrl.text = data?.email ?? '';
          passwordCtrl.text = data?.password ?? '';
          pincodeCtrl.text = data?.pincode ?? '';
          addressCtrl.text = data?.address ?? '';
          cityCtrl.text = data?.city ?? '';
          stateCtrl.text = data?.state ?? '';
          countryCtrl.text = data?.country ?? '';
          accnoCtrl.text = data?.accountno ?? '';
          holdernameCtrl.text = data?.holdername ?? '';
          ifscCtrl.text = data?.ifsccode ?? '';
        });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApBarMn(titlename: 'Profile', titleonly: true, isback: true),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.status == ProfileStatus.loading) {
            return PageEntryLoader();
          }
          if (state.status == ProfileStatus.error) {
            return SizedBox(
              width: ScreenUtil.screenWidth,
              height: ScreenUtil.screenHeight,
              child: Center(child: CustomError()),
            );
          }
          return SizedBox(
            width: ScreenUtil.screenWidth,
            height: ScreenUtil.screenHeight,
            child: Padding(
              padding: const EdgeInsets.all(paddingLarge),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              'https://s3-alpha-sig.figma.com/img/e2db/1865/e7299c33d1d7de36aa46e37cda72d981?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=rbMKB70uUH-mVtYcuQxGR54-JopT8xK1hdmVprz7JnecURaeyla5IXfEXBLWUNa5eFlrfE7Pu4ztzgZST7MF2P5babXJ~maHh4YEETvaTnHivOfCkBr5jwZIN73LKbjIYvInZKga15x3LEL1RcJjaX5qbuu9rHGgMsSzKb4lRXmRgAQUDs5IcMfWbCK06PLysWLYaRAB1lHfGVUGCCkWMjfLuhUJq2cHwcaDKYRY7-ITqVNGAvklsZwjwXaUQbFbeGcgvYOcRbAeHZREandqCgdVsyA-TJhcGcuMPacXYlqcBWDo59CY0xNJ5VS8P~aQu2Yt8NfR7fVBtXIPlODKHA__',
                            ),
                          ),
                          Positioned(
                            bottom: -2,
                            right: -2,
                            child: CircleAvatar(
                              backgroundColor: ColorResources.WHITE,
                              radius: 16,
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: ColorResources.CONTAINERBLUE,
                                child: Icon(
                                  Icons.edit,
                                  color: ColorResources.WHITE,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    gapLarge,
                    AppText(
                      text: 'Personal Details',
                      size: 18,
                      weight: FontWeight.w600,
                    ),
                    gapLarge,
                    AppText(
                      text: 'Email Address',
                      size: 12,
                      weight: FontWeight.w400,
                    ),
                    gap,
                    AppTextFeild(controller: emailCtrl, hinttext: 'Email',type: TextInputType.emailAddress,readonly: true,),
                    gapLarge,
                    AppText(text: 'Name', size: 12, weight: FontWeight.w400),
                    gap,
                    AppTextFeild(controller: nameCtrl, hinttext: 'Name'),
                    gapLarge,
                    AppText(
                      text: 'Password',
                      size: 12,
                      weight: FontWeight.w400,
                    ),
                    gap,
                    AppTextFeild(
                      controller: passwordCtrl,
                      hinttext: 'Password',
                      readonly: true,
                    ),
                    gapLarge,
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {},
                        child: AppText(
                          text: 'Change Password',
                          size: 12,
                          color: ColorResources.BTNRED,
                          weight: FontWeight.w400,
                          deccolor: ColorResources.BTNRED,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    gapLarge,
                    AppText(
                      text: 'Business Address Details',
                      size: 18,
                      weight: FontWeight.w600,
                    ),
                    gapLarge,
                    AppText(text: 'Pincode', size: 12, weight: FontWeight.w400),
                    gap,
                    AppTextFeild(controller: pincodeCtrl, hinttext: 'Pincode'),
                    gapLarge,
                    AppText(text: 'Address', size: 12, weight: FontWeight.w400),
                    gap,
                    AppTextFeild(controller: addressCtrl, hinttext: 'Address'),
                    gapLarge,
                    AppText(text: 'City', size: 12, weight: FontWeight.w400),
                    gap,
                    AppTextFeild(controller: cityCtrl, hinttext: 'City'),
                    gapLarge,
                    AppText(text: 'State', size: 12, weight: FontWeight.w400),
                    gap,
                    AppTextFeild(controller: stateCtrl, hinttext: 'State'),
                    gapLarge,
                    AppText(text: 'Country', size: 12, weight: FontWeight.w400),
                    gap,
                    AppTextFeild(controller: countryCtrl, hinttext: 'Country'),
                    gapLarge,
                    AppText(
                      text: 'Bank Details',
                      size: 18,
                      weight: FontWeight.w600,
                    ),
                    gapLarge,
                    AppText(
                      text: 'Account Number',
                      size: 12,
                      weight: FontWeight.w400,
                    ),
                    gap,
                    AppTextFeild(
                      controller: accnoCtrl,
                      hinttext: 'Account Number',
                    ),
                    gapLarge,
                    AppText(
                      text: 'Account Holder Name',
                      size: 12,
                      weight: FontWeight.w400,
                    ),
                    gap,
                    AppTextFeild(
                      controller: holdernameCtrl,
                      hinttext: 'Account Holder Name',
                    ),
                    gapLarge,
                    AppText(
                      text: 'IFSC Code',
                      size: 12,
                      weight: FontWeight.w400,
                    ),
                    gap,
                    AppTextFeild(controller: ifscCtrl, hinttext: 'IFSC Code'),
                    gapLarge,
                    ApBtn(
                      onPressed: () async{
                        await profileedit(context);
                      },
                      isValid: true,
                      isLoading: state.status==ProfileStatus.btnloading,
                      child: AppText(text: 'Save', color: ColorResources.WHITE),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  profileedit(BuildContext context) async {
    if (emailCtrl.text.isEmpty) {
      snackBar(context, message: 'Email is Required');
      
    }else if(nameCtrl.text.isEmpty) {
      snackBar(context, message: 'Name is required');
    }else{
      UserData body = UserData();
      body.uid = context.read<LoginBloc>().state.userid;
      body.email = emailCtrl.text;
      body.name = nameCtrl.text;
      body.password = passwordCtrl.text;
      body.address = addressCtrl.text;
      body.pincode = pincodeCtrl.text;
      body.city = cityCtrl.text;
      body.state = stateCtrl.text;
      body.country = countryCtrl.text;
      body.accountno = accnoCtrl.text;
      body.holdername= holdernameCtrl.text;
      body.ifsccode = ifscCtrl.text;
      context.read<ProfileBloc>().add(ProfileeditEvent(context, body));
    }
  }
}
