// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondago/controllers/worker_controller.dart';
import 'package:ondago/models/job_model.dart';
import 'package:ondago/views/pages/customer/home/home_page.dart';
import 'package:ondago/views/pages/worker/Activity_Worker/worker_Activity.dart';
import 'package:ondago/views/pages/worker/popups.dart';
import 'package:ondago/views/pages/worker/worker%20list/profile/worker_profile.dart';
import 'package:ondago/views/pages/worker/workerscreen.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/search_field.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/colour_sclass.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:ondago/views/widgets/utils/stringss.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WorkerHomePage extends StatefulWidget {
  const WorkerHomePage({super.key});

  @override
  State<WorkerHomePage> createState() => _WorkerHomePageState();
}

class _WorkerHomePageState extends State<WorkerHomePage> {
  final TextEditingController searchCtrl = TextEditingController();
  bool isCook = false;
  bool isHome = false;
  bool isRandom = false;
  bool isCashier = false;
  bool isBaby = false;
  bool isDriver = false;

  WorkerController workerController = Get.put(WorkerController());
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    // workerController.getCustomerInfo();
    // workerController.getAllJob();
    // TODO: implement initState
    super.initState();
  }

  final PageController _pageController = PageController();
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 4,
        backgroundColor: const Color(0xff3A81F7),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.1),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 30, backgroundImage: AssetImage(Images.me2)),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ibrahim',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Worker',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.1),
            RowData(
              onTap: () => Get.to(() => const WorkerProfilePage()),
              image: SvgPicture.asset(
                Images.profile,
                color: Colors.white,
              ),
              title: 'Profile',
            ),
            SizedBox(height: Get.height * 0.04),
            RowData(
              onTap: () {
                Get.to(WorkerScreen());
              },
              image: SvgPicture.asset(Images.driver3),
              title: 'Payment',
            ),
            SizedBox(height: Get.height * 0.04),
            RowData(
              onTap: () {},
              image: SvgPicture.asset(Images.setting),
              title: 'Settings',
            ),
            SizedBox(height: Get.height * 0.4),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
              child: const Divider(color: Colors.white),
            ),
            SizedBox(height: Get.height * 0.02),
            RowData(
              onTap: () {
                Get.to(ActivityWorker());
              },
              image: SvgPicture.asset(Images.logout),
              title: 'Log Out',
            ),
          ],
        ),
      ),

      //   Body
      key: _key,

      backgroundColor: Color(0xffF2F5FE),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.1),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => _key.currentState!.openDrawer(),
                    child: CircleAvatar(
                        radius: 30, backgroundImage: AssetImage(Images.me2)
                        // NetworkImage(getCustomer.imageUrl!),
                        ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Ibrahim',
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset('assets/icons/notification.png'),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.04),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
              child: Column(
                children: [
                  SearchField(searchCtrl: searchCtrl),
                  SizedBox(height: Get.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Job Preferences',
                        style: GoogleFonts.poppins(
                            color: const Color(0xff282773),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_up_outlined,
                        color: Color(0xff282773),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          SwitchTile(
                            image: 'assets/icons/cook.png',
                            title: AppStrings.CHILD_CARE,
                            value: isCook,
                            onChanged: (value) {
                              setState(() {
                                showJobPreferenceDialogue(context, childCare);
                                isCook = value;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          SwitchTile(
                            image: 'assets/icons/homeaid.png',
                            title: AppStrings.SENIOR_CARE,
                            value: isHome,
                            onChanged: (value) {
                              setState(() {
                                showJobPreferenceDialogue(context, seniorCare);
                                isHome = value;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          SwitchTile(
                            image: 'assets/icons/random.png',
                            title: AppStrings.SPECIAL_NEEDS,
                            value: isRandom,
                            onChanged: (value) {
                              showJobPreferenceDialogue(context, specialNeed);
                              setState(() {
                                isRandom = value;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          SwitchTile(
                            image: 'assets/icons/cashier.png',
                            title: AppStrings.PET_CARES,
                            value: isCashier,
                            onChanged: (value) {
                              showJobPreferenceDialogue(context, petCare);
                              setState(() {
                                isCashier = value;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          SwitchTile(
                            image: 'assets/icons/baby.png',
                            title: AppStrings.HEALTH_AND_BEAUTY,
                            value: isBaby,
                            onChanged: (value) {
                              showJobPreferenceDialogue(
                                  context, healthAndBeauty);
                              setState(() {
                                isBaby = value;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          SwitchTile(
                            image: 'assets/icons/driver.png',
                            title: AppStrings.HOME_AND_GARDEN,
                            value: isDriver,
                            onChanged: (value) {
                              showJobPreferenceDialogue(context, homeAndGarden);
                              setState(() {
                                isDriver = value;
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_currentPageIndex > 0) {
                            _pageController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                            setState(() {
                              _currentPageIndex--;
                            });
                          }
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Color(0xff282773),
                        ),
                      ),
                      CommonButton(onTap: () {}, title: 'Unavailable'),
                      GestureDetector(
                        onTap: () {
                          if (_currentPageIndex < 3) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                            setState(() {
                              _currentPageIndex++;
                            });
                          }
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xff282773),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.04),
                  Container(
                    //  color: Colors.amber,
                    height: Get.height * 0.6,
                    width: Get.width,
                    child: GetX<WorkerController>(
                        init: workerController,
                        builder: (cont) {
                          return cont.getJobList.isEmpty
                              ? const Center(
                                  child: Text(
                                  'No Job posted yet',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ))
                              : PageView.builder(
                                  controller: _pageController,
                                  itemCount: cont.getJobList.length,
                                  itemBuilder: (context, index) {
                                    JobModel jobModel = cont.getJobList[index];
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: NetworkImage(
                                                      jobModel.imageUrl!),
                                                ),
                                                const SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      jobModel.userName!,
                                                      style: GoogleFonts.poppins(
                                                          color: const Color(
                                                              0xff282773),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Container(
                                                      width: Get.width * 0.550,
                                                      // color: Colors.amber,
                                                      child: Text(
                                                        'Lorem ipsum dolor sit amet consectetur. Pulvinar tempus fusce magna eleifend fringilla convallis quis. Tincidunt egestas at urna pellentesque hendrerit erat proin. Faucibus amet mauris pretium vivamus posuere vitae integer non lectus. Congue massa felis potenti morbi sagittis nec.', //  jobModel.description!,
                                                        style: GoogleFonts.poppins(
                                                            color: const Color(
                                                                0xff282773),
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                  ],
                                                ),
                                              ],
                                            ),

                                            ////
                                            ///
                                            ////
                                            ///
                                            ///
                                            ///
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  height: Adaptive.px(57),
                                                  width: Adaptive.px(100),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffEAEFFE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Duration',
                                                          style: GoogleFonts.poppins(
                                                              color: const Color(
                                                                  0xff282773),
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const SizedBox(
                                                            height: 5),
                                                        RichText(
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: '5 ',
                                                                style: GoogleFonts.poppins(
                                                                    color: const Color(
                                                                        0xff282773),
                                                                    fontSize: 8,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              TextSpan(
                                                                text: 'Hours ',
                                                                style: GoogleFonts.poppins(
                                                                    color: const Color(
                                                                        0xff282773),
                                                                    fontSize: 8,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              ),
                                                              TextSpan(
                                                                text: '30 ',
                                                                style: GoogleFonts.poppins(
                                                                    color: const Color(
                                                                        0xff282773),
                                                                    fontSize: 8,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    'Minutes ',
                                                                style: GoogleFonts.poppins(
                                                                    color: const Color(
                                                                        0xff282773),
                                                                    fontSize: 8,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: Adaptive.px(57),
                                                  width: Adaptive.px(100),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffEAEFFE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Pay',
                                                          style: GoogleFonts.poppins(
                                                              color: const Color(
                                                                  0xff282773),
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const SizedBox(
                                                            height: 5),
                                                        RichText(
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: '\$50',
                                                                style: GoogleFonts.poppins(
                                                                    color: const Color(
                                                                        0xff282773),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  height: Adaptive.px(57),
                                                  width: Adaptive.px(100),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffEAEFFE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Pay',
                                                          style: GoogleFonts.poppins(
                                                              color: const Color(
                                                                  0xff282773),
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const SizedBox(
                                                            height: 5),
                                                        RichText(
                                                          text: TextSpan(
                                                            children: [
                                                              // TextSpan(
                                                              //   text: '5 ',
                                                              //   style: GoogleFonts.poppins(
                                                              //       color: const Color(
                                                              //           0xff282773),
                                                              //       fontSize: 8,
                                                              //       fontWeight:
                                                              //           FontWeight
                                                              //               .bold),
                                                              // ),
                                                              TextSpan(
                                                                text: '\$50 ',
                                                                style: GoogleFonts.poppins(
                                                                    color: const Color(
                                                                        0xff282773),
                                                                    fontSize: 8,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: Adaptive.px(57),
                                                  width: Adaptive.px(100),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffEAEFFE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Start date',
                                                          style: GoogleFonts.poppins(
                                                              color: const Color(
                                                                  0xff282773),
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const SizedBox(
                                                            height: 5),
                                                        RichText(
                                                          text: TextSpan(
                                                            children: [
                                                              // TextSpan(
                                                              //   text: '',
                                                              //   style: GoogleFonts.poppins(
                                                              //       color: const Color(
                                                              //           0xff282773),
                                                              //       fontSize: 8,
                                                              //       fontWeight:
                                                              //           FontWeight
                                                              //               .bold),
                                                              // ),
                                                              TextSpan(
                                                                text:
                                                                    '20/12/2024 ',
                                                                style: GoogleFonts.poppins(
                                                                    color: const Color(
                                                                        0xff282773),
                                                                    fontSize: 8,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    playVideoDialogue(context);
                                                  },
                                                  child: Container(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                            Images.imageicon),
                                                        TextCustom(
                                                          text: 'Watch Video',
                                                          size: 10,
                                                          weight:
                                                              FontWeight.w500,
                                                          col: const Color(
                                                              0xff3A81F7),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.h,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    playVideoDialogue(context);
                                                  },
                                                  child: Container(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                            Images.imagic),
                                                        TextCustom(
                                                          text: 'View Photo',
                                                          size: 10,
                                                          weight:
                                                              FontWeight.w500,
                                                          col: const Color(
                                                              0xff3A81F7),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                        }),
                  ),
                  SizedBox(height: Get.height * 0.05),

                  Row(
                    children: [
                      Expanded(
                          child: CommonButton(
                              onTap: () {
                                showInterestedPopup(context);
                                //workerController.applyForJOb();
                              },
                              title: 'Interested')),
                      SizedBox(width: Get.width * 0.04),
                      Expanded(
                          child: SizedBox(
                        width: Adaptive.px(240),
                        height: Adaptive.px(47),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(0xffF2F5FE),
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: const BorderSide(
                                      color: Color(0xff282773)),
                                ))),
                            child: Text(
                              'Not Interested',
                              style: GoogleFonts.poppins(
                                  color: const Color(0xff282773),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            )),
                      )),
                    ],
                  ),
                  // GetX<WorkerController>(
                  //     init: workerController,
                  //     builder: (cont) {
                  //       return cont.getJobList.isEmpty
                  //           ? SizedBox()
                  //           : cont.getCustomer.isShow!
                  //               ? CommonButton(
                  //                   onTap: () {
                  //                     Get.to(() => MapPage());
                  //                     //   workerController.applyForJOb();
                  //                   },
                  //                   title: cont.getCustomer.isStart!
                  //                       ? 'Start work'
                  //                       : 'Applied')
                  //               :
                  //     }),
                  SizedBox(height: Get.height * 0.1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

// popopopopo

//
}

class SwitchTile extends StatelessWidget {
  SwitchTile({
    super.key,
    required this.image,
    required this.title,
    this.value = false,
    required this.onChanged,
  });
  final String image;
  final String title;
  bool value;
  final void Function(bool)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image),
        const SizedBox(width: 10),
        Text(
          title,
          style: GoogleFonts.poppins(
              color: const Color(0xff282773),
              fontSize: 14,
              fontWeight: FontWeight.w400),
        ),
        const Spacer(),
        CupertinoSwitch(
          activeColor: const Color(0xffD7EDFE),
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

void showJobPreferenceDialogue(
    BuildContext context, List<String> jobPositions) {
  List<String> experiences = ['Beginner', 'Middle', "Expert"];
  RxInt selectedPosition = 0.obs;
  RxInt selectedExperience = 0.obs;
  showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextCustom(
                                text: AppStrings.POSITIONS,
                                col: Colors.white,
                                size: 4.5.w,
                                weight: FontWeight.w600,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: jobPositions.length,
                                itemBuilder: (context, index) {
                                  RxBool isSelected = false.obs;
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Row(
                                      children: [
                                        Material(
                                          color: AppColors.primaryColor,
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Obx(
                                              () => Checkbox(
                                                side: const BorderSide(
                                                    color: Colors.white),
                                                checkColor: Colors.yellow,
                                                fillColor: MaterialStateProperty
                                                    .resolveWith<Color?>(
                                                        (Set<MaterialState>
                                                            states) {
                                                  if (states.contains(
                                                      MaterialState.selected)) {
                                                    return Colors.yellow;
                                                  }
                                                  return null;
                                                }),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                value: selectedPosition.value ==
                                                        index
                                                    ? true
                                                    : false,
                                                onChanged: (value) {
                                                  //isSelected.value=value!;
                                                  selectedPosition.value =
                                                      index;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        TextCustom(
                                          text: jobPositions[index],
                                          col: Colors.white,
                                          size: 4.5.w,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextCustom(
                                text: AppStrings.EXPERIENCE,
                                col: Colors.white,
                                size: 4.5.w,
                                weight: FontWeight.w600,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: experiences.length,
                                itemBuilder: (context, index) {
                                  RxBool isSelected = false.obs;
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Row(
                                      children: [
                                        Material(
                                          color: AppColors.primaryColor,
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Obx(
                                              () => Checkbox(
                                                side: const BorderSide(
                                                    color: Colors.white),
                                                checkColor: Colors.yellow,
                                                fillColor: MaterialStateProperty
                                                    .resolveWith<Color?>(
                                                        (Set<MaterialState>
                                                            states) {
                                                  if (states.contains(
                                                      MaterialState.selected)) {
                                                    return Colors.yellow;
                                                  }
                                                  return null;
                                                }),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                value:
                                                    selectedExperience.value ==
                                                            index
                                                        ? true
                                                        : false,
                                                onChanged: (value) {
                                                  //isSelected.value=value!;
                                                  selectedExperience.value =
                                                      index;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        TextCustom(
                                          text: experiences[index],
                                          col: Colors.white,
                                          size: 4.5.w,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 4.h,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        child: TextCustom(
                          text: 'Save',
                          col: AppColors.primaryColor,
                          weight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

List<String> seniorCare = ['Home Aid', 'CNA'];
List<String> specialNeed = ['Home Aid', 'CNA'];
List<String> childCare = ['Teacher', 'Nanny', 'Baby Sitter'];
List<String> petCare = ['Dog Walker', 'Pet sitter', 'Groomer'];
List<String> healthAndBeauty = [
  'Barber',
  'Hair Stylist',
  'Nail Technician',
  'Personal Trainer',
  'Masseuse'
];
List<String> homeAndGarden = [
  'House Keeper',
  'Cleaner',
  'Laundry',
  'Lawn Mower',
  'painter'
];
