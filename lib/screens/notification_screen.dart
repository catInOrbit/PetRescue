import 'package:flutter/material.dart';
import 'package:petrescue/widgets/notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              NotificationWidget()
            ],
          ),
        ),
      ),
    );
  }
}
