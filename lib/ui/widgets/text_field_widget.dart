

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
   TextFieldWidget({
    this.textController,
    this.maxlength,
    this.readOnly = false,
    this.currentLength,
    
    Key? key,  this.onChanged,
  }) : super(key: key);

  TextEditingController ? textController;
  int ? maxlength;
  bool readOnly;
  ValueChanged<String>  ? onChanged;
  int ? currentLength;


  

  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xff232527),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: textController,
            minLines: 5,
            maxLines: 10,
            readOnly: readOnly,
            
            onChanged: onChanged,
           
          ),
          const SizedBox(height: 20,),
          Text(
            '$currentLength/${maxlength}',
            style:const TextStyle(
              color: Colors.grey
            ),
            ),
        ],
      ),
    );
  }
}


