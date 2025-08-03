import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:jatri_app/src/configs/appColors.dart';
import 'package:jatri_app/src/configs/appUtils.dart';
import 'package:jatri_app/src/widgets/text/kText.dart';

class ReturnDateAndTime extends StatefulWidget {
  final Function(DateTime, TimeOfDay) onReturnDateTimeSelected;

  ReturnDateAndTime({Key? key, required this.onReturnDateTimeSelected})
      : super(key: key);

  @override
  State<ReturnDateAndTime> createState() => _ReturnDateAndTimeState();
}

class _ReturnDateAndTimeState extends State<ReturnDateAndTime> {
  var dateTime = DateFormat('d MMMM yyyy');
  var selectedRoundDate = DateTime.now();
  var selectedRoundTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        helpText: 'selectJourneyTime'.tr,
        cancelText: 'cancel'.tr,
        confirmText: 'submit'.tr,
        context: context,
        initialDate: selectedRoundDate,
        firstDate: DateTime(2022),
        lastDate: DateTime(2101));
    setState(() {
      _selectTime();
      selectedRoundDate = picked ?? selectedRoundDate;
      widget.onReturnDateTimeSelected(selectedRoundDate, selectedRoundTime);
    });
  }

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      helpText: 'enterTime1hourFromNow'.tr,
      cancelText: 'cancel'.tr,
      confirmText: 'submit'.tr,
      context: context,
      initialTime: selectedRoundTime,
    );
    if (newTime != null) {
      setState(() {
        selectedRoundTime = newTime;
        widget.onReturnDateTimeSelected(selectedRoundDate, selectedRoundTime);
      });
    }
  }
  String _formatTimeOfDay(TimeOfDay time) {
    final hours = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    final minutes = time.minute.toString().padLeft(2, '0');
    return '$hours:$minutes $period';
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: KText(
              text: 'RETURNDATETIME',
              fontSize: 12,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: black45,
                        ),
                        SizedBox(width: 10),
                        KText(
                          text: selectedRoundDate == null
                              ? 'selectDate'
                              : '${dateTime.format(selectedRoundDate)}'
                              .toString(),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        Spacer(),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 1,
                color: black,
              ),
              SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectTime(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.time_outline,
                          color: black45,
                        ),
                        SizedBox(width: 10),
                        KText(
                          text: selectedRoundTime == null
                              ? 'selectTime'
                              : _formatTimeOfDay(selectedRoundTime),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        Spacer(),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
