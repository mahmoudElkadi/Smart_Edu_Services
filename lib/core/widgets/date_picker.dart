import 'package:flutter/material.dart';

Future<DateTime?> pickDate(context) => showDatePicker(
      context: context,
      firstDate: DateTime(2010),
      lastDate: DateTime(2200),
    );
