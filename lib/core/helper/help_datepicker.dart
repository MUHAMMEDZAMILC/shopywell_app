import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

 showAppDatePicker(BuildContext context,
    {DateTime? selectedDate,
    bool isAllowPastDate = false,
    bool isAllowFutureDate = true,DateTime? limitfuturedate,DateTime? limitpastdate}) async {
  selectedDate ??= DateTime.now();

  final DateTime? picked = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: selectedDate,
      firstDate:
          isAllowPastDate ? limitpastdate?? DateTime(DateTime.now().year - 50) : DateTime.now(),
      lastDate: isAllowFutureDate
          ? limitfuturedate?? DateTime(DateTime.now().year + 1)
          : DateTime.now());

  if (picked != null && picked != selectedDate) {
    selectedDate = picked;
  }
  debugPrint("$selectedDate");
  return DateFormat('yyyy-MM-dd').format(selectedDate).toString() ;
}

converttdatetostring(String date) {
  return  DateFormat('yyyy-MM-dd').format( DateTime.parse(date)).toString() ;
}
// convert date string to with day name
converttdatetoincday(String date) {
  return  DateFormat('dd EEEE yyyy').format( DateTime.parse(date)).toString() ;
}