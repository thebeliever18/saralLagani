import 'package:flutter/material.dart';
import 'package:saral_lagani/model/adbl_model.dart';
import 'package:saral_lagani/presentation/heading.dart';

class Display extends StatefulWidget {
  final AdblModel? model;
  const Display({Key? key, this.model})
      : super(key: key);

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  Map<String, List<Asset>>? data;

  @override
  void initState() {
    super.initState();

    if (widget.model != null) {
      data = widget.model!.assets;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Heading(mapData: data,),
    );
  }
}
