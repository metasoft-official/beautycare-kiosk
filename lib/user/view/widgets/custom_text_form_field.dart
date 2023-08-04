import 'package:flutter/material.dart';

import 'package:beauty_care/common/layout/app_text.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.title,
      this.hintText,
      required this.controller,
      this.focusNode,
      this.onChanged,
      this.validator,
      this.textInputType,
      this.textInputAction,
      this.readOnly,
      this.maxLength})
      : super(key: key);

  final String? title;
  final String? hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final dynamic onChanged;
  final dynamic validator;
  final bool? readOnly;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(title!, style: AppTextTheme.black12b),
          const SizedBox(height: 8)
        ],
        TextFormField(
            readOnly: readOnly ?? false,
            autocorrect: false,
            controller: controller,
            focusNode: focusNode,
            keyboardType: textInputType ?? TextInputType.text,
            textInputAction: textInputAction ?? TextInputAction.next,
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
            ),
            maxLength: maxLength),
        SizedBox(height: title != null ? 20 : 8),
      ],
    );
  }
}
