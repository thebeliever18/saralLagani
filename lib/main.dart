
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saral_lagani/model/adbl_model.dart';
import 'package:saral_lagani/presentation/display.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saral Lagani',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ADBL'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  AdblModel? aModel;

// Fetch content from the json file
  Future<void> readJson() async {
  final String response = await rootBundle.loadString('assets/sample.json');
  final data = response;
  aModel = adblModelFromJson(data);
  if(aModel != null){
    setState(() {});
  }
  }


  @override
  void initState() {
    readJson();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: aModel == null ? const Center(child: Text('Loading...'),): Display(model: aModel,)
      ),
    );
  }
}
