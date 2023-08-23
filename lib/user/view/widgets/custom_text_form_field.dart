import 'package:flutter/material.dart';

import 'package:beauty_care/common/layout/app_text.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
      this.title,
      this.hintText,
      this.controller,
      this.initialValue,
      this.onChanged,
      this.validator,
      this.textInputType,
      this.textInputAction,
      this.readOnly,
      this.maxLength,
      this.errorText})
      : super(key: key);

  final String? title;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final dynamic onChanged;
  final dynamic validator;
  final bool? readOnly;
  final int? maxLength;
  final String? errorText;

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
            initialValue: initialValue,
            keyboardType: textInputType ?? TextInputType.text,
            textInputAction: textInputAction ?? TextInputAction.next,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              errorText: errorText,
            ),
            maxLength: maxLength),
        SizedBox(height: title != null ? 20 : 8),
      ],
    );
  }
}
