import 'package:flutter/material.dart';

class MyMessage extends StatelessWidget {
   final String message;
  const MyMessage(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: Text(message, style: TextStyle(color: Colors.white),),
          ),
        ),
        SizedBox(height: 10,)
        
      ],
      

    );
  }
}