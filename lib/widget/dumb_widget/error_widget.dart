import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.error,
    required this.onPressed,
  });
  final String error;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 16.h,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Error', style: Theme.of(context).textTheme.headlineSmall),

          Text(
            error.toString(),
            maxLines: 3,
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          ElevatedButton(onPressed: onPressed, child: const Text('Retry')),
        ],
      ),
    );
  }
}
