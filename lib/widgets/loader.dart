import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

class Loader extends StatefulWidget {
  final Color color;
  final double top;
  final double bottom;
  const Loader({Key? key, this.color = Colors.white, this.top = 0, this.bottom = 0})
      : super(key: key);
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.top, bottom: widget.bottom),
      child: SpinKitThreeBounce(
        color: widget.color,
        size: 4.w,
        controller: _controller,
      ),
    );
  }
}
