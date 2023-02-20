import 'package:flutter/material.dart';

class IdCardInputField extends StatelessWidget {
  const IdCardInputField({
    Key? key,
    required TextEditingController input,
    required String helperText,
    required String labelText,
    required TextInputType textInputType,
    required String? Function(String?)? validator,
  })  : _input = input,
        _helperText = helperText,
        _labelText = labelText,
        _textInputType = textInputType,
        _validator = validator,
        super(key: key);

  final TextEditingController _input;
  final String _helperText;
  final String _labelText;
  final TextInputType _textInputType;
  final String? Function(String?)? _validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _input,
      keyboardType: _textInputType,
      validator: _validator,
      decoration: InputDecoration(
        helperText: _helperText,
        label: Text(
          _labelText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        helperStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade600),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey.shade400,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
