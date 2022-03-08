import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'konversi suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Konverter Suhu'),
        ),
        body: Container(
          margin: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: etInput,
                decoration: InputDecoration(
                    labelText: "Celcius",
                    hintText: "Masukkan suhu dalam satuan celcius"),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              DropdownButton(
                value: 'Kelvin',
                items: [
                  DropdownMenuItem(
                    child: Text('Kelvin'),
                    value: 'Kelvin',
                  ),
                  DropdownMenuItem(
                    child: Text('Reamur'),
                    value: 'Reamur',
                  ),
                  DropdownMenuItem(
                    child: Text('Fahrenheit'),
                    value: 'Fahrenheit',
                  ),
                ],
                onChanged: (value) {},
              ),
              Container(
                child: Column(
                  children: [
                    Text("Hasil"),
                    Text('365'),
                  ],
                ),
              ),
              SizedBox(
                child: Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {},
                      child: Text('Konversi Suhu')),
                ),
              ),
              Container(
                child: Text('Riwayat Konversi'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
