import 'package:flutter/material.dart';

class NotificationsIndicator extends StatelessWidget {
  const NotificationsIndicator({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      child: Stack(
        children: [
          const Icon(Icons.notifications_none_outlined, color: Colors.black87),
          Positioned(
            left: 2,
            child: Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle
              )
            ),
          )
        ],
      ),
    );
  }
}