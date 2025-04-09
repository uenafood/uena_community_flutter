import 'package:flutter/material.dart';
import 'package:uena_community_flutter/commons/uena_community_colors.dart';

class UenaCommunityTextField extends StatefulWidget {
  final String? title;
  final TextEditingController? controller;
  final TextInputType inputType;
  final String? placeholder;
  final Function(String value)? onValueChanged;

  const UenaCommunityTextField({
    super.key,
    this.title,
    this.controller,
    this.inputType = TextInputType.text,
    this.placeholder,
    this.onValueChanged,
  });

  @override
  State<UenaCommunityTextField> createState() => _UenaCommunityTextFieldState();
}

class _UenaCommunityTextFieldState extends State<UenaCommunityTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        hintText: widget.placeholder,
        hintStyle: const TextStyle(color: UenaCommunityColors.grayLight),
        fillColor: UenaCommunityColors.grayPale,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: UenaCommunityColors.grayLightTransparent,
            width: 2.0,
          ),
        ),
      ),
      style: const TextStyle(
        fontSize: 14.0,
        color: UenaCommunityColors.grayDark,
      ),
      onChanged: widget.onValueChanged,
    );
  }
}
