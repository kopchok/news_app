import 'package:flutter/material.dart';

class ErrorNews extends StatelessWidget {
  const ErrorNews({super.key, this.onRefresh});

  final Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 8),
          Text(
            'Someting is wrong\nplease try again.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade400),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: onRefresh,
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
