import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:beauty_care/common/layout/app_text.dart';
import 'package:beauty_care/common/layout/app_color.dart';

class CustomDropdownButton2 extends StatelessWidget {
  const CustomDropdownButton2(
      {Key? key,
      required this.items,
      required this.hint,
      this.value,
      this.onChanged,
      this.icon,
      this.maxHeight,
      this.scrollbarTheme,
      this.buttonStyle,
      this.selectedStyle,
      this.itemStyle,
      this.boxDecoration})
      : super(key: key);

  // null값 허용이어도 필수 작성해야하는 필드
  final List<String> items;
  final String hint;
  final String? value;
  final dynamic onChanged;

  final Widget? icon;
  final double? maxHeight;
  final ScrollbarThemeData? scrollbarTheme;
  final ButtonStyleData? buttonStyle;
  final TextStyle? selectedStyle;
  final TextStyle? itemStyle;
  final BoxDecoration? boxDecoration;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<String>(
      isExpanded: true,
      underline: const SizedBox(),
      hint: Text(
        hint,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: selectedStyle ?? AppTextTheme.middleGrey12m,
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: itemStyle ?? AppTextTheme.middleGrey14m,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ))
          .toList(),
      value: value,
      onChanged: onChanged,
      buttonStyleData: buttonStyle ??
          const ButtonStyleData(
              elevation: 0,
              padding: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                    BorderSide(color: AppColor.middleGrey)),
              )),
      iconStyleData: IconStyleData(
        icon: icon ??
            const Icon(
              Icons.keyboard_arrow_down,
              color: AppColor.grey,
            ),
      ),
      dropdownStyleData: DropdownStyleData(
          maxHeight: maxHeight ?? 200,
          scrollbarTheme: scrollbarTheme ??
              ScrollbarThemeData(
                thumbVisibility: MaterialStateProperty.resolveWith((states) {
                  return true;
                }),
                thumbColor: MaterialStateProperty.resolveWith((states) {
                  return AppColor.middleGrey;
                }),
                radius: const Radius.circular(5),
              ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColor.middleGrey),
          ),
          useSafeArea: true),
    );
  }
}
