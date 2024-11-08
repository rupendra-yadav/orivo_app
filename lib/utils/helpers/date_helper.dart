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


}