// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MyController extends GetxController {
//   var selectedCountry = 'اختر الدولة'.obs;

//   List<String> countries = [
//     'مصر',
//     'السعودية',
//     'الإمارات',
//     // ... إضافة المزيد من الدول
//   ];
// }

// class MyHomePage extends StatelessWidget {
//   final MyController controller = Get.put(MyController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dropdown Button Example'),
//       ),
//       body: Center(
//         child: Obx(() => DropdownButton<String>(
//               value: controller.selectedCountry.value,
//               icon: const Icon(Icons.arrow_downward),
//               elevation: 16,
//               style: const TextStyle(color: Colors.deepPurple),
//               underline: Container(
//                 height: 2,
//                 color: Colors.deepPurpleAccent,
//               ),
//               onChanged: (String? newValue) {
//                 controller.selectedCountry.value = newValue!;
//               },
//               items: controller.countries
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             )),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class Country {
//   String name;

//   Country(this.name);

//   factory Country.fromJson(Map<String, dynamic> json) {
//     return Country(json['name']);
//   }
// }

// class CountryController extends GetxController {
//   var countries = <Country>[].obs;
//   var selectedCountry = 'اختر الدولة'.obs;

//   @override
//   void onInit() {
//     fetchCountries();
//     super.onInit();
//   }

//   void fetchCountries() async {
//     final response = await http.get(Uri.parse('https://restcountries.com/v2/all'));

//     if (response.statusCode == 200) {
//       var countriesJson = json.decode(response.body) as List;
//       countries.value = countriesJson.map((countryJson) => Country.fromJson(countryJson)).toList();
//     } else {
//       Get.snackbar('Error', 'Failed to fetch countries');
//     }
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final CountryController controller = Get.put(CountryController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Countries Dropdown Example'),
//       ),
//       body: Center(
//         child: Obx(() => DropdownButton<String>(
//               value: controller.selectedCountry.value,
//               icon: const Icon(Icons.arrow_downward),
//               elevation: 16,
//               style: const TextStyle(color: Colors.deepPurple),
//               underline: Container(
//                 height: 2,
//                 color: Colors.deepPurpleAccent,
//               ),
//               onChanged: (String? newValue) {
//                 controller.selectedCountry.value = newValue!;
//               },
//               items: controller.countries
//                   .map<DropdownMenuItem<String>>((Country country) {
//                 return DropdownMenuItem<String>(
//                   value: country.name,
//                   child: Text(country.name),
//                 );
//               }).toList(),
//             )),
//       ),
//     );
//   }
// }


///////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Country {
  String name;

  Country(this.name);

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(json['name']);
  }
}

class CountryController extends GetxController {
  var countries = <Country>[
    Country("AAA"),
    Country("assdvvv"),
    Country("AAAbb"),
    Country("assdbbb"),
    Country("AAAnnn"),
    Country("assdmmm"),
    Country("zaz"),
    Country("ab"),
    Country("aqwe"),
  ].obs;
  List<Country> filteredCountries = <Country>[];
  String selectedCountry = '';

  @override
  void onInit() {
    fetchCountries();
    super.onInit();
  }

  void fetchCountries() async {
    // ... كود جلب الدول كما في المثال السابق ...
  }

  void filterCountries(String query) {
    if (query.isEmpty) {
      filteredCountries = countries;
      update();
    } else {
      filteredCountries = countries.where((country) {
        return country.name.toLowerCase().startsWith(query.toLowerCase());
      }).toList();
      update();
    }
  }
}

class MyHomePage11Con extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CountryController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries Autocomplete Example'),
      ),
      body: Center(
        child: GetBuilder<CountryController>(
            builder: (controller) => Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Autocomplete<Country>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<Country>.empty();
                      }
                      controller.filterCountries(textEditingValue.text);
                      return controller.filteredCountries;
                    },
                    displayStringForOption: (Country country) => country.name,
                    onSelected: (Country selection) {
                      controller.selectedCountry = selection.name;
                    },
                  ),
                )),
      ),
    );
  }
}
