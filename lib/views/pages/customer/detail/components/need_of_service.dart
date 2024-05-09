import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NeedOfService extends StatelessWidget {
  const NeedOfService({
    super.key,
    required DateTime? selectedDate,
    required TimeOfDay? selectedTime,
    required this.dateTap,
    required this.timeTap,
  })  : _selectedDate = selectedDate,
        _selectedTime = selectedTime;

  final DateTime? _selectedDate;
  final TimeOfDay? _selectedTime;
  final VoidCallback dateTap;
  final VoidCallback timeTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date',
              style: GoogleFonts.poppins(
                color: const Color(0xff282773),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: Adaptive.px(40),
              width: Adaptive.px(147),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: const Color(0xffE1ECFF),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      _selectedDate != null
                          ? DateFormat('MM/dd/yyyy').format(_selectedDate!)
                          : 'Select Date',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff343434),
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: dateTap,
                      child: Image.asset('assets/icons/calendar1.png'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Time',
              style: GoogleFonts.poppins(
                color: const Color(0xff282773),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: Adaptive.px(40),
              width: Adaptive.px(147),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: const Color(0xffE1ECFF),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      _selectedTime != null
                          ? '${_selectedTime?.hourOfPeriod}:${_selectedTime!.minute} ${_selectedTime!.period == DayPeriod.am ? 'AM' : 'PM'}'
                          : 'Select Time',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff343434),
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: timeTap,
                      child: Image.asset('assets/icons/time.png'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
