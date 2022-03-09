import 'package:flutter/material.dart';
import 'package:flutter_temperature_converter_2/widgets/hasilKonversiSuhu.dart';
import 'package:flutter_temperature_converter_2/widgets/inputSuhu.dart';
import 'package:flutter_temperature_converter_2/widgets/riwayatSuhu.dart';
import 'package:flutter_temperature_converter_2/widgets/targetKonversiSuhu.dart';
import 'package:flutter_temperature_converter_2/widgets/tombolKonversiSuhu.dart';

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
  List<String> listSatuanSuhu = ['Kelvin', 'Reamur', 'Fahrenheit'];
  String selectedDropDown = 'Kelvin';
  int hasilPerhitungan = 0;
  List listHasil = [];

  void onDropDownChanged(Object? value) {
    return setState(() {
      selectedDropDown = value.toString();
    });
  }

  void konversiSuhu() {
    return setState(() {
      if (etInput.text.isNotEmpty) {
        switch (selectedDropDown) {
          case 'Kelvin':
            hasilPerhitungan = int.parse(etInput.text) + 273;
            break;
          case 'Reamur':
            hasilPerhitungan = (4 * int.parse(etInput.text) / 5) as int;
            break;
          case 'Fahrenheit':
            hasilPerhitungan = (9 * int.parse(etInput.text) / 5) as int;
            break;
          default:
        }
        listHasil.add("Konversi dari " +
            etInput.text +
            " Celcius ke " +
            selectedDropDown +
            "dengan hasil : " +
            hasilPerhitungan.toString());
      }
    });
  }

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
          title: const Text('Konverter Suhu'),
        ),
        body: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              inputSuhu(etInput: etInput),
              targetKonversiSuhu(
                selectedDropDown: selectedDropDown,
                listSatuanSuhu: listSatuanSuhu,
                onDropDownChanged: onDropDownChanged,
              ),
              hasilKonversiSuhu(hasilPerhitungan: hasilPerhitungan),
              tombolKonversiSuhu(
                konversiSuhu: konversiSuhu,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  'Riwayat Konversi',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              riwayatSuhu(listHasil: listHasil)
            ],
          ),
        ),
      ),
    );
  }
}
