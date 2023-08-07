// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cuidapet/app/core/ui/extensions/theme_extensions.dart';

class CuidapetDefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color? color;
  final String label;
  final double labelSize;
  final Color? labelColor;
  final double padding;
  final double width;
  final double height;

  const CuidapetDefaultButton({
    Key? key,
    required this.onPressed,
    this.borderRadius = 10,
    this.color,
    required this.label,
    this.labelSize = 20,
    this.padding = 10,
    this.labelColor,
    this.width = double.infinity,
    this.height = 66,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: color ?? context.primaryColor,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: labelSize,
            color: labelColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
