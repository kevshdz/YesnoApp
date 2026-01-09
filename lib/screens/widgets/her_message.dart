import 'package:flutter/material.dart';
import 'package:yes_no_app/screens/domain/entities/message.dart';

class HerMessage extends StatelessWidget {
  final Message message;
  const HerMessage({super.key, required this.message});
  
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            child: Text(message.text, style: TextStyle(color: Colors.white),),
          ),
        ),
        SizedBox(height: 5),

        _ImageBubble(message.imgUrl!)
        
      ],
      

    );
  }
}


class _ImageBubble extends StatelessWidget {
  
  final String img;

  const _ImageBubble(this.img); 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(20),
      child: Image.network(
        img,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if(loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text("Enviando imagen...."),
          );
        },
        )
        );
  }
}