import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/styles.dart';
import 'animation_click.dart';

class TextFieldCpn extends StatelessWidget {
  const TextFieldCpn({
    required this.controller,
    required this.focusNode,
    this.labelText,
    this.labelRight,
    this.showSuffixIcon = false,
    this.showPrefixIcon = false,
    this.colorSuffixIcon,
    this.colorPrefixIcon,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNext,
    this.hasMutilLine = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.readOnly = false,
    this.functionPrefix,
    this.functionSuffer,
    this.enabled = true,
    this.hintText,
    this.labelStyle,
    this.autoFocus = false,
    this.filled = true,
    this.fillColor,
    this.borderColor,
    this.onChanged,
    this.onEditingComplete,
    this.suffixWidget,
    this.keyboardType,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? focusNext;
  final String? labelText;
  final Widget? labelRight;
  final bool showSuffixIcon;
  final bool showPrefixIcon;
  final String? prefixIcon;
  final Color? colorPrefixIcon;
  final String? suffixIcon;
  final Widget? suffixWidget;
  final Color? colorSuffixIcon;
  final bool hasMutilLine;
  final bool readOnly;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Function()? functionPrefix;
  final Function()? functionSuffer;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final String? hintText;
  final TextStyle? labelStyle;
  final bool autoFocus;
  final bool filled;
  final Color? fillColor;
  final Color? borderColor;
  final TextInputType? keyboardType;

  OutlineInputBorder createInputDecoration(BuildContext context,
      {Color? color}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: borderColor ?? grey200),
        borderRadius: BorderRadius.circular(12));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                labelText!,
                style: labelStyle ?? headline(color: grey1100),
              ),
              if (labelRight != null) ...[labelRight!]
            ],
          ),
        ],
        const SizedBox(height: 8),
        TextField(
            textAlignVertical: TextAlignVertical.center,
            controller: controller,
            focusNode: focusNode,
            maxLines: maxLines ?? (hasMutilLine ? null : 1),
            minLines: minLines,
            readOnly: readOnly,
            maxLength: maxLength,
            autofocus: autoFocus,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            keyboardType: hasMutilLine
                ? TextInputType.multiline
                : (keyboardType ?? TextInputType.text),
            onSubmitted: (value) {
              focusNode.unfocus();
              FocusScope.of(context).requestFocus(focusNext);
            },
            style: body(color: grey1100),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: subhead(color: grey400),
              fillColor: fillColor ?? grey100,
              filled: filled,
              contentPadding: const EdgeInsets.all(18),
              prefixIcon: showPrefixIcon
                  ? AnimationClick(
                      function: functionPrefix ?? () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: prefixIcon != null
                            ? Image.asset(
                                prefixIcon!,
                                height: 24,
                                width: 24,
                                color: colorPrefixIcon ?? grey200,
                              )
                            : const SizedBox(),
                      ),
                    )
                  : const SizedBox(),
              prefixIconConstraints: const BoxConstraints(
                minHeight: 16,
                minWidth: 16,
              ),
              suffixIcon: showSuffixIcon
                  ? suffixWidget ??
                      AnimationClick(
                        function: functionSuffer ?? () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: suffixIcon != null
                              ? Image.asset(
                                  suffixIcon!,
                                  height: 24,
                                  width: 24,
                                  color: colorSuffixIcon ?? primary,
                                )
                              : const SizedBox(),
                        ),
                      )
                  : const SizedBox(),
              suffixIconConstraints: const BoxConstraints(
                minHeight: 16,
                minWidth: 16,
              ),
              focusedBorder: createInputDecoration(context, color: emerald1),
              enabledBorder: createInputDecoration(context),
              errorBorder: createInputDecoration(context, color: radicalRed1),
              enabled: enabled,
            )),
      ],
    );
  }
}
