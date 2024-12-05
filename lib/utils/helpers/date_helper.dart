import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateHelper{

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return '${DateFormat('dd').format(dateTime)}\n${DateFormat('MMM').format(dateTime)}\n${DateFormat('yyyy').format(dateTime)}';
  }

  String formatTime(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return '${DateFormat('hh').format(dateTime)}\n${DateFormat('mm').format(dateTime)}\n${DateFormat('a').format(dateTime)}';
  }


  String formatDateTime(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    String formattedDate = DateFormat("dd-MMMM-yyyy h:mm a").format(parsedDate);
    return formattedDate;
  }


  String getMonth(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    String formattedDate = DateFormat("MMMM").format(parsedDate);
    return formattedDate;
  }


  String getTime(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    String formattedDate = DateFormat("h:mm a").format(parsedDate);
    return formattedDate;
  }

  String formatDateToday(String dateString) {
    try {
      // Parse the input string to a DateTime object
      final DateTime date = DateFormat('yyyy-MM-dd').parse(dateString);

      final DateTime now = DateTime.now();
      final DateTime today = DateTime(now.year, now.month, now.day);
      final DateTime yesterday = today.subtract(Duration(days: 1));

      final DateTime providedDate = DateTime(date.year, date.month, date.day);

      if (providedDate == today) {
        return "Today";
      } else if (providedDate == yesterday) {
        return "Yesterday";
      } else {
        // Format the date in dd-mm-yyyy format
        return DateFormat('dd-MM-yyyy').format(date);
      }
    } catch (e) {
      // Handle invalid date strings
      return "Invalid date format";
    }
  }


}