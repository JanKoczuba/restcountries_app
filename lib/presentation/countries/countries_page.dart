import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CountriesPage extends StatefulWidget {
  const CountriesPage({Key? key}) : super(key: key);

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
