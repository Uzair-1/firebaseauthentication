// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OPT extends StatelessWidget {
  const OPT(TextEditingController phoneNumberController, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 68,width: 40,
      child: TextFormField(
        onChanged:  (value){
          if(value.length==1){
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(
          hintText: '*',
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
