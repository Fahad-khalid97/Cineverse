import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeviceInfo extends StatelessWidget {
  const DeviceInfo({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.h,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyLarge),
        Text(value, style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}
