import 'package:flutter/material.dart';

class MessageInput extends StatelessWidget {

  final ValueChanged <String> onValue;

  const MessageInput(
    {
      required this.onValue, 
      super.key
    });

  @override
  Widget build(BuildContext context) {


    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();


    final outlineBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20),
      
    );



    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: InputDecoration(
        enabledBorder:outlineBorder,
        focusedBorder: outlineBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: Icon(Icons.send_outlined),
          onPressed: () {
          final textValue = textController.value.text;
          print("Value $textValue");
          onValue(textValue);
          }
        ),
        
      ),
      onFieldSubmitted: (value) {
        print("Submit $value");       
        textController.clear(); 
        focusNode.requestFocus();
        onValue(value);
      }
    );
  }
}