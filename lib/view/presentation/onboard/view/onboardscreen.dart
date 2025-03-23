// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopywell_app/core/utils/theme/colors.dart';
import 'package:shopywell_app/core/utils/theme/dimensions.dart';
import 'package:shopywell_app/view/components/appbar.dart';
import 'package:shopywell_app/view/components/apprichtext.dart';
import 'package:shopywell_app/view/components/apptext.dart';
import 'package:shopywell_app/view/presentation/onboard/viewmodel/bloc/onboard_bloc.dart';

import 'components/dottedwidget.dart';
import 'components/onboardpage.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    context.read<OnboardBloc>().add(OnboardInitEvent(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardBloc, OnboardState>(
      builder: (context, state) {
        return Scaffold(
          appBar: ApBarMn(
            leading: Padding(
              padding: const EdgeInsets.only(left: padding17, top: padding17),
              child: AppRichText(
                normalText: "${state.currentindex + 1}",
                richText:
                    "/${state.onboardingData.length}",
                fontSize: 14,
                richTextFontSize: 14,
                richFontWeight: FontWeight.w600,
                normalFontWeight: FontWeight.w600,
                richTextColor: ColorResources.TEXTCOLORSUB,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<OnboardBloc>().add(OnboardskipEvent(context));
                },
                child: AppText(text: "Skip", size: 14, weight: FontWeight.w600),
              ),
            ],
          ),
          body: BlocBuilder<OnboardBloc, OnboardState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(paddingLarge),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (value) {
                          context.read<OnboardBloc>().add(
                            OnboardPageChangeEvent(value, context),
                          );
                        },
                        itemCount: state.onboardingData.length,
                        itemBuilder: (context, index) {
                          return OnboardingPage(
                            image: state.onboardingData[index]["img"]!,
                            title: state.onboardingData[index]["title"]!,
                            description:
                                state.onboardingData[index]["description"]!,
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            context.read<OnboardBloc>().add(
                              OnboardnextEvent(context, _pageController),
                            );
                          },
                          child: AppText(
                            text: state.currentindex != 0 ? "Prev" : "",
                            size: 14,
                            weight: FontWeight.w600,
                            color: ColorResources.LIGHTGREY,
                          ),
                        ),
                        Row(
                          children: [
                            DotIndicator(isActive: state.currentindex == 0),
                            DotIndicator(isActive: state.currentindex == 1),
                            DotIndicator(isActive: state.currentindex == 2),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<OnboardBloc>().add(
                              OnboardnextEvent(context, _pageController),
                            );
                          },
                          child: AppText(
                            text:
                                state.currentindex ==
                                        state.onboardingData.length - 1
                                    ? "Get Started"
                                    : "Next",
                            size: 14,
                            weight: FontWeight.w600,
                            color: ColorResources.PRIMARYCOLOR,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
