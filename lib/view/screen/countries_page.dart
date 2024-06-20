// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jobs/controller/countries_controller.dart';

// class CountriesPage extends StatelessWidget {
//   const CountriesPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     Get.put(CountryController());
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Countries'),
//       ),
//       body: Center(
//         child: GetBuilder<CountryController>(
//             builder: (controller) => Padding(
//               padding: const EdgeInsets.only(right: 40.0),
//               child: Center(
//                 child: Autocomplete<Country>(
//                   optionsBuilder: (TextEditingValue textEditingValue) {
//                     if (textEditingValue.text == '') {
//                       return const Iterable<Country>.empty();
//                     }
//                     controller.filterCountries(textEditingValue.text);
//                     return controller.filteredCountries;
//                   },
//                   displayStringForOption: (Country country) => country.name!,
//                   onSelected: (Country selection) {
//                     controller.selectedCountry = selection.name!;
//                   },
//                 ),
//               ),
//             )),
//       ),
//     );
//   }
// }
