import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ondago/models/Onboarding_Model.dart';
import 'package:ondago/views/Splash_and_onboarding/choose_suits_you_best.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final pageController = PageController();

  List<OnboardingModel> pageList = [
    OnboardingModel(
        image: Images.Maskgroup,
        subtitle: 'You can find services or work available to assist you',
        title: 'Location Permission'),
    OnboardingModel(
        image: Images.beautiful,
        subtitle: 'Select services or workers that are located nearby.',
        title: 'Select Worker'),
    OnboardingModel(
        image: Images.Rectangle,
        subtitle: 'Give each other 5-star ratings.',
        title: 'Worker Rating')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    //  Image.asset(Images.containercie)
                    Stack(
                      children: [
                        Container(
                          height: 59.h,
                        ),
                        Container(
                          height: 50.h,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Images.containercie),
                                fit: BoxFit.fill),
                            // color: Color(0xff3A81F7),
                            // borderRadius: BorderRadius.only(
                            //     bottomLeft: Radius.circular(100),
                            //     bottomRight: Radius.circular(100))
                          ),
                        ),
                        Positioned(
                          left: 70,
                          right: 70,
                          bottom: 0,
                          child: Container(
                            height: 40.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                // color: Colors.amber,
                                image: DecorationImage(
                                    image: AssetImage(pageList[index].image),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          right: 20,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed('/ShooseSuitsYouBest');
                            },
                            child: TextCustom(
                              text: 'skip',
                              size: 16,
                              col: Colors.white,
                              weight: FontWeight.w700,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextCustom(
                      text: pageList[index].title,
                      size: 4.h,
                      weight: FontWeight.w400,
                      col: Color(0xff282773),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: 50.h,
                      // color: Colors.amber,
                      child: TextCustom(
                        align: TextAlign.center,
                        text: pageList[index].subtitle,
                        size: 2.h,
                        weight: FontWeight.w700,
                        col: Color(0xff8590B6),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  effect: const ExpandingDotsEffect(
                    spacing: 4.0,
                    radius: 8.0,
                    dotWidth: 6.0,
                    dotHeight: 6.0,
                    // paintStyle: PaintingStyle.stroke,
                    strokeWidth: 1.5,
                    dotColor: Color(0xffE1ECFF),
                    activeDotColor: Color(0xff3A81F7),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Color(0xff3A81F7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    if (pageController.page == pageList.length - 1) {
                      Get.toNamed('/SigninScreen');
                    } else {
                      // Go to the next page.
                      pageController.nextPage(
                        duration: Duration(seconds: 1),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
