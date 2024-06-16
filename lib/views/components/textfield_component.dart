import 'package:bloom_app/constants/colors/app_colors.dart';
import 'package:bloom_app/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldComponent extends StatelessWidget {
  final Color? labelColor;
  final TextEditingController controller;
  final String? hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Function(String _)? onChanged;
  final TextInputType keyboardType;
  final int maxLength;
  final Widget? suffixIcon;
  final Widget? icon;

  final Widget? prefixWidget;
  final bool readOnly;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final VoidCallback? onTap;
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  final EdgeInsetsGeometry? padding;
  final TextStyle? hintTextStyle;
  final bool enlargePrfixWidget;

  final TextStyle? textStyle;
  final List<TextInputFormatter>? formatter;
  final TextAlign textAlign;
  final InputBorder? errorBorder;
  final InputBorder? focusErrorBorder;
  final double? borderRadius;
  final TextCapitalization? textCapitalization;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool isLabelRequired;
  final bool autofocus;
  final String? labelText;
  final void Function()? onEditingComplete;
  final InputBorder? focusedBorder;
  final TextInputAction? textInputAction;
  const TextFieldComponent({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.validator,
    this.onChanged(String _)?,
    this.keyboardType = TextInputType.text,
    this.maxLength = 45,
    this.suffixIcon,
    this.prefixWidget,
    this.onTap,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines,
    required this.currentFocus,
    this.nextFocus,
    this.padding,
    this.hintTextStyle,
    this.textStyle,
    this.formatter,
    this.textAlign = TextAlign.start,
    this.errorBorder,
    this.borderRadius,
    this.textCapitalization,
    this.autocorrect = true,
    this.enableSuggestions = false,
    this.focusErrorBorder,
    this.isLabelRequired = false,
    this.labelText,
    this.autofocus = false,
    this.onEditingComplete,
    this.labelColor,
    this.enlargePrfixWidget = true,
    this.icon,
    this.focusedBorder,
    required this.controller,
    this.minLines,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isLabelRequired
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Text(
                  labelText.toString(),
                  style: Fonts.noto(
                    context,
                    labelColor ?? AppColors.raisinBlack,
                    13,
                    FontWeight.w400,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        TextFormField(
            maxLines: maxLines ?? 1,
            minLines: minLines ?? 1,
            controller: controller,
            autofocus: autofocus,
            readOnly: readOnly,
            focusNode: currentFocus,
            enableSuggestions: enableSuggestions,
            autocorrect: autocorrect,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enabled: enabled,
            obscureText: obscureText,
            maxLength: maxLength,
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            textInputAction: textInputAction ??
                (nextFocus != null
                    ? TextInputAction.next
                    : TextInputAction.done),
            onTap: onTap,
            onChanged: (_) => onChanged == null ? () {} : onChanged!(_),
            onEditingComplete: onEditingComplete ??
                () {
                  currentFocus.unfocus();
                  if (nextFocus != null) {
                    nextFocus?.requestFocus();
                  }
                },
            style: textStyle ??
                Fonts.noto(
                  context,
                  Colors.black,
                  13,
                  FontWeight.w400,
                ),
            validator: validator,
            keyboardType: keyboardType,
            inputFormatters: formatter,
            textAlign: textAlign,
            decoration: InputDecoration(
              counterText: '',
              counterStyle: Fonts.noto(
                  context, AppColors.grayniteGray, 12, FontWeight.w400),
              filled: true,
              errorMaxLines: 2,
              fillColor: AppColors.white.withOpacity(0.60),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
              ),
              focusedBorder: focusedBorder ??
                  OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.magentaPink, width: 1.2.h),
                    borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
                  ),
              errorBorder: errorBorder ??
                  OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.errorRed),
                    borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
                  ),
              focusedErrorBorder: focusErrorBorder ??
                  OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.errorRed),
                    borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
                  ),
              contentPadding: padding ??
                  EdgeInsetsDirectional.only(
                      start: 16,
                      top: 16,
                      bottom: 15,
                      end: suffixIcon != null ? 0 : 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
              ),
              hintText: hintText ?? '',
              hintStyle: hintTextStyle ??
                  Fonts.noto(
                      context, AppColors.grayniteGray, 13, FontWeight.w400),
              prefixIcon: prefixWidget != null
                  ? Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: prefixWidget,
                    )
                  : null,
              suffixIcon: suffixIcon,
              icon: icon,
            )),
      ],
    );
  }
}
