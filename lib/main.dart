import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'lab2',
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  double? index;
  String status = '';
  String title = 'Lab 2';

  void _calculate() {
   double height = double.parse(_heightController.text);
   double weight = double.parse(_weightController.text);
    setState(() {
      index = weight / ((height * height)/10000);
      if (index! < 18.5) {
        status = "Under Weight";
      } else if (index! >= 18.5 && index! < 24.9) {
        status = 'Healthy';
      } else if (index! >= 25 && index! < 30) {
        status = 'Overweight';
      } else {
        status = 'Obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0.0,

      ),
        backgroundColor: Colors.white,
      body: Center(
          child: SizedBox(
            width: 320,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                        labelText: "Height",
                      ),
                      controller: _heightController,
                    ),
                    TextField(
                      keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Weight",
                      ),
                      controller: _weightController,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: _calculate,
                      child: const Text('Start'),
                      style: ElevatedButton.styleFrom(
                        fixedSize:const Size(100,40),
                        backgroundColor: Colors.green
                      )
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      index == null ? '' : index!.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 50),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      status,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
  }
}



