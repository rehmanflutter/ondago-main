import 'package:get/get_navigation/get_navigation.dart';
import 'package:ondago/views/bussiness/Activity/all_activity.dart';
import 'package:ondago/views/bussiness/Section_3_4/Profile/edit_profile.dart';
import 'package:ondago/views/bussiness/Section_3_4/Profile/profile.dart';
import 'package:ondago/views/bussiness/Section_3_4/bussiness_home_sreeen.dart';
import 'package:ondago/views/bussiness/businessfilter.dart';
import 'package:ondago/views/bussiness/bussines_App_bar.dart';
import 'package:ondago/views/bussiness/section5.dart/business_feedback%20.dart';
import 'package:ondago/views/bussiness/section5.dart/business_payment_screen.dart';
import 'package:ondago/views/bussiness/section5.dart/bussines_home2.dart';
import 'package:ondago/views/Splash_and_onboarding/choose_suits_you_best.dart';
import 'package:ondago/views/Splash_and_onboarding/onboarding.dart';
import 'package:ondago/views/Splash_and_onboarding/splich.dart';
import 'package:ondago/views/auth/ForgotPassword/forgot_password.dart';
import 'package:ondago/views/auth/ForgotPassword/set_new_Password.dart';
import 'package:ondago/views/auth/otp_success_verifi.dart';
import 'package:ondago/views/auth/phone_number_verification%20.dart';
import 'package:ondago/views/auth/sign_in.dart';
import 'package:ondago/views/auth/sign_up.dart';
import 'package:ondago/views/pages/customer/Activity_Customer/activity_customer.dart';
import 'package:ondago/views/pages/customer/Custom_payment.dart';
import 'package:ondago/views/pages/customer/cutome_Map.dart';
import 'package:ondago/views/pages/customer/detail/home_detail_page.dart';
import 'package:ondago/views/pages/customer/feedback_page.dart';
import 'package:ondago/views/pages/customer/home/home_page.dart';
import 'package:ondago/views/pages/customer/payment/payment_details_page.dart';
import 'package:ondago/views/pages/customer/payment/payment_page.dart';
import 'package:ondago/views/pages/customer/profile/edit_profile_page.dart';
import 'package:ondago/views/pages/customer/profile/profile_page.dart';
import 'package:ondago/views/pages/worker/Activity_Worker/worker_Activity.dart';
import 'package:ondago/views/pages/worker/feedback_workr.dart';
import 'package:ondago/views/pages/worker/worker%20list/map_screen.dart';
import 'package:ondago/views/pages/worker/worker%20list/profile/edit_profile_worker.dart';
import 'package:ondago/views/pages/worker/worker%20list/profile/worker_profile.dart';
import 'package:ondago/views/pages/worker/worker%20list/worker_list_page.dart';
import 'package:ondago/views/pages/customer/Customer_screen.dart';
import 'package:ondago/views/pages/worker/worker_home_page.dart';
import 'package:ondago/views/pages/worker/worker_payment.dart';
import 'package:ondago/views/pages/worker/workerscreen.dart';
import 'package:ondago/views/bussiness/section5.dart/admins.dart';

class AppRouting {
  static final routes = [
    GetPage(
        name: '/SplichScreen',
        page: () => SplichScreen(),
        transition: Transition.circularReveal),
    GetPage(
        name: '/OnboardingScreen',
        page: () => OnboardingScreen(),
        transition: Transition.circularReveal),

    GetPage(
        name: '/ShooseSuitsYouBest',
        page: () => ShooseSuitsYouBest(),
        transition: Transition.circularReveal),

    GetPage(
        name: '/SigninScreen',
        page: () => SigninScreen(),
        transition: Transition.circularReveal),

    GetPage(
        name: '/SignUpScreen',
        page: () => SignUpScreen(),
        transition: Transition.circularReveal),

    GetPage(
        name: '/ForgotPassword',
        page: () => ForgotPassword(),
        transition: Transition.circularReveal),
    GetPage(
        name: '/SetNewPassword',
        page: () => SetNewPassword(),
        transition: Transition.circularReveal),

    GetPage(
        name: '/PhoneNumberVerification',
        page: () => PhoneNumberVerification(),
        transition: Transition.circularReveal),
    GetPage(
        name: '/SuccessOtpVerification', page: () => SuccessOtpVerification()),

//   Complect

//
//
    ///
/////      //    Worker   Said
    ///
    ///
    ///

    GetPage(
      name: '/WorkerHomePage',
      page: () => WorkerHomePage(), //WorkerHomePage
    ),
    GetPage(
        name: '/MapPage',
        page: () => MapPage(),
        transition: Transition.circularReveal),

    GetPage(
      name: '/WorkerScreen',
      page: () => WorkerScreen(),
    ),

    GetPage(
      name: '/WorkerPayments',
      page: () => WorkerPayments(),
    ),

    GetPage(
      name: '/ActivityWorker',
      page: () => ActivityWorker(), //
    ),

    GetPage(
      name: '/WorkerFeedbackPage',
      page: () => const WorkerFeedbackPage(), //
    ),
    GetPage(
      name: '/WorkerProfilePage',
      page: () => const WorkerProfilePage(), //WorkerProfilePage
    ),

    GetPage(
      name: '/WorkerEditProfilePage',
      page: () => WorkerEditProfilePage(), //
    ),

//

//
//

//    Customer   Said

    ///
    ///
    ///
    GetPage(
        name: '/CustomerPayment',
        page: () => CustomerPayment(),
        transition: Transition.circularReveal),
    GetPage(
        name: '/CustomerScreen',
        page: () => CustomerScreen(),
        transition: Transition.circularReveal),

    GetPage(
      name: '/ActivityCustomer',
      page: () => ActivityCustomer(), //
    ),

    GetPage(
      name: '/CustomerHomePage',
      page: () => CustomerHomePage(), //
    ),

    GetPage(
      name: '/CustomerProfilePage',
      page: () => CustomerProfilePage(),
    ),

    GetPage(
      name: '/CustomerEditProfilePage',
      page: () => CustomerEditProfilePage(), //
    ),

    GetPage(
      name: '/CustomerWorkerListPage',
      page: () => CustomerWorkerListPage(),
    ),

    GetPage(
      name: '/HomeDetailPage',
      page: () => HomeDetailPage(), //  Customer Filter Screen
    ),

    GetPage(
      name: '/CustomerMapPage',
      page: () => CustomerMapPage(), //
    ),

    GetPage(
      name: '/PaymentDetailsPage',
      page: () => PaymentDetailsPage(), //
    ),

    GetPage(
      name: '/PaymentPage',
      page: () => PaymentPage(), //
    ),

    GetPage(
      name: '/FeedbackPage',
      page: () => CustomerFeedbackPage(), //
    ),

    ///
/////
    ///
    ///
    ///    Section 3  And 4
    ///
    ///     Business
    ///

    GetPage(
      name: '/BussinessHomeSreeen',
      page: () => BussinessHomeSreeen(),
    ), //  not use this only check

    GetPage(
      name: '/ProfileScreens',
      page: () => ProfileScreens(),
    ),

    GetPage(
      name: '/EditProfiles',
      page: () => EditProfiles(),
    ),

    ///    Section 5
    ///
    ///
    GetPage(
      name: '/AdminScreenList',
      page: () => AdminScreenList(),
    ),
    GetPage(
      name: '/BusinessQueList',
      page: () => BusinessQueList(), //   Home 2 Screen
    ),

    GetPage(
      name: '/BusinessFilterScreen',
      page: () => BusinessFilterScreen(), //
    ),

    GetPage(
      name: '/BusinessPaymentScreen',
      page: () => BusinessPaymentScreen(), //
    ),

    GetPage(
      name: '/BusinessFeedback',
      page: () => BusinessFeedback(), //
    ),

    GetPage(
      name: '/AllActivity',
      page: () => AllActivity(), //
    ),

    GetPage(
      name: '/BusinessBottomAppBar',
      page: () => BusinessBottomAppBar(), //
    ),

//     GetPage(
//       name: '/BusinessQueList',
//       page: () => BusinessQueList(), //
//     ),

//     GetPage(
//       name: '/BusinessQueList',
//       page: () => BusinessQueList(), //
//     ),

//     GetPage(
//       name: '/BusinessQueList',
//       page: () => BusinessQueList(), //
//     ),

//     GetPage(
//       name: '/BusinessQueList',
//       page: () => BusinessQueList(), //
//     ),

//     GetPage(
//       name: '/BusinessQueList',
//       page: () => BusinessQueList(), //
//     ),

//     GetPage(
//       name: '/BusinessQueList',
//       page: () => BusinessQueList(), //
//     ),

//     GetPage(
//       name: '/BusinessQueList',
//       page: () => BusinessQueList(), //   Home 2 Screen
//     ),

//     GetPage(
//       name: '/BusinessQueList',
//       page: () => BusinessQueList(), //   Home 2 Screen
//     ),

//     GetPage(
//       name: '/BusinessQueList',
//       page: () => BusinessQueList(), //   Home 2 Screen
//     ),
  ];
}
