import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ondago/views/widgets/common_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChildrenNameAndAge extends StatelessWidget {
  const ChildrenNameAndAge({
    super.key,
    required this.nameCtrl,
    required this.ageCtrl,
  });

  final TextEditingController nameCtrl;
  final TextEditingController ageCtrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Adaptive.px(193),
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CommonField(
                    isPrefix: false,
                    hintText: 'Ethina Miller',
                    controller: nameCtrl,
                    prefixIcon: 'prefixIcon',
                    onChanged: (value) {},
                    validator: (value) {
                      return '';
                    },
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: CommonField(
                    isPrefix: false,
                    hintText: '11 Years',
                    controller: ageCtrl,
                    prefixIcon: 'prefixIcon',
                    onChanged: (value) {},
                    validator: (value) {
                      return '';
                    },
                  ),
                ),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: const Color(0xff3A81F7),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff000000).withOpacity(.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
