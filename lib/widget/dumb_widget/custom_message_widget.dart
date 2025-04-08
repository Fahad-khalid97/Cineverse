import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMessageWidget extends StatelessWidget {
  const CustomMessageWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 16.h,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            maxLines: 3,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
