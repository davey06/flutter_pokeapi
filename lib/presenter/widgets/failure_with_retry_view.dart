import 'package:flutter/material.dart';

class FailureWithRetryView extends StatelessWidget {
  const FailureWithRetryView({required this.retryFunction, super.key});
  final VoidCallback retryFunction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Whoops, something wrong'),
          ElevatedButton(
            onPressed: retryFunction,
            child: const Text('Retry'),
          )
        ],
      ),
    );
  }
}
