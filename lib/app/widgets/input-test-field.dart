import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class InputTextField extends StatelessWidget {
   InputTextField({
    super.key,
     required this.textController,
     required this.hint
  });
  final String hint;
   final textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 40.0, 32.0, 4.0),
      child: TextFormField(
        key: Key(hint),
        keyboardType: TextInputType.text,
        controller: textController,
        decoration:  InputDecoration(
          filled: false,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1.0,
            ),
          ),
          labelText: hint,
        ),
        validator: (value){
          if (value == null || value.trim().isEmpty){
            return 'please enter your name';
          }
        },
        // style:
        // TextStyle(fontSize: 20.0, color: textTheme.button.color),
        // validator: validateUserName,
        // onSaved: (val) => this.loginFields._username = val
        // ),
      ),
    );
  }
}