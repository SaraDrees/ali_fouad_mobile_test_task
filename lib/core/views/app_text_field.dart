import 'package:ali_fouad_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class AppTextField extends StatefulWidget {
  TextEditingController controller;
  Function(String? string)? onChangedCallback;
  Function()? onTap;
  double? paddingHorizontal;
  double? height;
  int? maxLine;
  int? minLines;
  int? maxLength;
  double? fontSize;
  String? hintText;
  bool isPassword;
  bool readOnly;
  FocusNode? nextFocusNode;
  FocusNode? focusNode;
  TextInputType? keyboardType;
  Widget? prefixIcon;
  Widget? suffixIcon;
  EdgeInsetsGeometry? contentPadding;
  InputDecoration? decoration;
  bool autofocus;
  TextStyle? style;
  TextAlign? textAlign;
  List<TextInputFormatter>? inputFormatters;
  String? Function(String? value)? validator;
  Function(String? string)? onFieldSubmitted;


  AppTextField(
      {super.key, required this.controller,
        this.onChangedCallback,
        this.paddingHorizontal,
        this.height,
        this.fontSize,
        this.maxLine = 1,
        this.minLines,
        this.maxLength,
        this.onTap,
        this.readOnly = false,
        this.hintText,
        this.focusNode,
        this.isPassword = false,
        this.autofocus = false,
        this.prefixIcon,
        this.suffixIcon,
        this.contentPadding,
        this.keyboardType,
        this.inputFormatters,
        this.nextFocusNode,
        this.style,
        this.textAlign,
        this.decoration,
        this.validator,
        this.onFieldSubmitted });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool showPassword;

  @override
  void initState() {
    super.initState();
    showPassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      margin: EdgeInsets.only(top: 1.1.h),
      child: TextFormField(
        controller: widget.controller,
        cursorColor: AppColors.colorPrimary,
        focusNode: widget.focusNode,
        maxLines: widget.maxLine,
        minLines: widget.minLines,
        validator: widget.validator,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        textAlign: widget.textAlign ?? TextAlign.center,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        autofocus: widget.autofocus,
        obscureText: showPassword && widget.isPassword,
        obscuringCharacter: "*",
        style: widget.style ??
        Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: widget.fontSize ?? 13.sp, color: AppColors.textColorPrimary, fontWeight: FontWeight.bold),
        inputFormatters: widget.inputFormatters ?? [],
        decoration: widget.decoration ?? InputDecoration(
          counterText: '',
          contentPadding: widget.contentPadding??EdgeInsets.symmetric(vertical: 2.5.h , horizontal: 8.w),
          focusColor: AppColors.colorPrimary,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.enabledBorder, width: 1),),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.enabledBorder, width: 1),),
          enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide:  BorderSide(color: widget.controller.value.text.isEmpty?AppColors.enabledBorder : AppColors.colorPrimary, width: 1),),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red, width: 1),),
          hintText: widget.hintText,
          hintStyle:
          Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: widget.fontSize??13.sp, color: AppColors.hintTextColor,
          fontWeight: FontWeight.bold ),
        ),
        onChanged: (message) {
          if (widget.onChangedCallback != null) {
            widget.onChangedCallback!(message);
          }
        },
        onFieldSubmitted: (s) {
          if (widget.nextFocusNode != null) {
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          }
          if (widget.onFieldSubmitted != null) {
            widget.onFieldSubmitted!(s);
          }
        },
      ),
    );
  }
}
