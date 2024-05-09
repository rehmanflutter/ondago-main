import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ondago/controllers/Customer_Controller/map_customer.dart';
import 'package:ondago/controllers/Worker_Controller/worker%20listController/mapcontroller.dart';
import 'package:ondago/views/pages/customer/feedback_page.dart';
import 'package:ondago/views/pages/customer/payment/payment_details_page.dart';
import 'package:ondago/views/widgets/common_button.dart';
import 'package:ondago/views/widgets/cusatm_container.dart';
import 'package:ondago/views/widgets/text_common.dart';
import 'package:ondago/views/widgets/utils/images.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomerMapPage extends StatefulWidget {
  @override
  State<CustomerMapPage> createState() => _MapPageState();
}

class _MapPageState extends State<CustomerMapPage> {
  final Rx<LatLng> initialCameraPosition = Rx<LatLng>(const LatLng(0, 0));

  Completer<GoogleMapController> mapController = Completer();

  final Set<Marker> _markers = <Marker>{};
  late LatLng currentLocation;
  late LatLng destinationLocation;

  final Set<Polyline> _polylines = <Polyline>{};
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;

  void setInitialLocation() {
    currentLocation = LatLng(28.310350, 70.127403);
    destinationLocation = LatLng(28.4212, 70.2989);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    polylinePoints = PolylinePoints();
    setInitialLocation();
    setState(() {});
  }

  void setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyDO0uZbpJal4iwl_XYP9fW2T5hd-0Ggm-o",
        PointLatLng(currentLocation.latitude, currentLocation.longitude),
        PointLatLng(
            destinationLocation.latitude, destinationLocation.longitude));

    if (result.status == 'OK') {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }

      setState(() {
        _polylines.add(Polyline(
            width: 10,
            polylineId: const PolylineId('polyLine'),
            color: const Color(0xFF08A5CB),
            points: polylineCoordinates));
      });
    }
  }

  void showMarker() {
    setState(() {
      _markers.add(Marker(
        markerId: const MarkerId('sourcePin'),
        position: currentLocation,
        icon: BitmapDescriptor.defaultMarker,
      ));
      _markers.add(Marker(
        markerId: const MarkerId('destinationPin'),
        position: destinationLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(90),
      ));
    });
  }

  final controller = Get.put(CustomerMapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            compassEnabled: false,
            tiltGesturesEnabled: false,
            polylines: _polylines,
            markers: _markers,
            onMapCreated: (GoogleMapController controller) {
              mapController.complete(controller);

              showMarker();
              setPolylines();
            },
            initialCameraPosition: CameraPosition(
              target: currentLocation,
              zoom: 12,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('assets/images/loction.png'),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Obx(
                    () => Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(PaymentDetailsPage());

                            dialogBoxshow(context,
                                'Are you on the route? ' //'Are you on the Route?'
                                );
                            controller.op1.value = true;
                          },
                          child: Icon(
                            Icons.circle,
                            color: controller.op1.value == true
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                        Container(height: 40, child: VerticalDivider()),
                        GestureDetector(
                          onTap: () {
                            controller.op2.value = true;

                            dialogBoxshow(context,
                                'Did you arrive at this location?' //'Are you on the Route?'
                                );
                          },
                          child: Icon(
                            Icons.circle,
                            color: controller.op2.value == true
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                        Container(height: 40, child: VerticalDivider()),
                        GestureDetector(
                          onTap: () {
                            controller.op3.value = true;
                            dialogBoxshow(context,
                                'Did you start the work? ' //'Are you on the Route?'
                                );
                          },
                          child: Icon(
                            Icons.circle,
                            color: controller.op3.value == true
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                        Container(height: 40, child: VerticalDivider()),
                        GestureDetector(
                          onTap: () {
                            controller.op4.value = true;

                            dialogBoxshow(
                                context, 'Did you complete the work? ');
                          },
                          child: Icon(
                            Icons.circle,
                            color: controller.op4.value == true
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),

                        ///  Container(height: 40, child: VerticalDivider()),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      GestureDetector(
                        onTap: () {},
                        child: TextCustom(
                          text: 'ETA 5 - 10 min',
                          col: Colors.white,
                          size: 24,
                          weight: FontWeight.w700,
                        ),
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(Images.chat),
                          SizedBox(
                            height: 20,
                          ),
                          SvgPicture.asset(Images.call)
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // CommonButton(
              //     onTap: () {
              //       dialogBoxshow(context,
              //           'Did you arrive at this location? ' //'Are you on the Route?'
              //           );
              //       // Get.to(() => FeedbackPage());
              //     },
              //     title: 'Complete Work'),
              SizedBox(height: Get.height * 0.04),
            ],
          ),
        ],
      ),
    );
  }

  void dialogBoxshow(BuildContext context, String value) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: Colors.transparent,
            // insetPadding: EdgeInsets.all(0),
            contentPadding: EdgeInsets.all(0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustamContainer(
                  wigth: 200,
                  col: Colors.white70,
                  cir: 20,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: TextCustom(
                        align: TextAlign.center,
                        text: 'Worker is on the route'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustamContainer(
                  wigth: 200,
                  col: Colors.white70,
                  cir: 20,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: TextCustom(
                        align: TextAlign.center,
                        text: 'Worker is not on the route'),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
