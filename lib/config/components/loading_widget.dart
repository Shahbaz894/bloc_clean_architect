import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadWidget extends StatefulWidget {
  final double size;

  const LoadWidget({Key? key, this.size = 60}) : super(key: key);

  @override
  State<LoadWidget> createState() => _LoadWidgetState();
}

class _LoadWidgetState extends State<LoadWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      width: widget.size,
      child: Platform.isAndroid
          ? const CircularProgressIndicator(color: Colors.red)
          : const CupertinoActivityIndicator(),
    );
  }
}
