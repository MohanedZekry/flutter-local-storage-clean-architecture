import 'package:flutter/material.dart';

class DefaultTextFieldWidget extends StatelessWidget {

  final TextEditingController controller;
  final String labelTitle;
  const DefaultTextFieldWidget({
    Key? key,
    required this.controller,
    required this.labelTitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      maxLength: 60,
      style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500
      ),
      controller: controller,
      validator: (val) =>
      val!.isEmpty ? 'Please $labelTitle your email' : null,
      decoration:  InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(15)
          ),
        ),
        labelText: labelTitle,
        counterText: '',
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.7),
            width: 0,
          ),
          borderRadius: const BorderRadius.all(
              Radius.circular(15)
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(15)
          ),
        ),

        fillColor: Colors.grey.withOpacity(0.1),
        prefixIcon: Icon(
          Icons.info_outline_rounded, color: Colors.blue.withOpacity(.8),),
      ),
    );
  }
}
