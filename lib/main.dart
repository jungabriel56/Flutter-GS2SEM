import 'package:flutter/material.dart';
import 'package:gs/pages/widgets/eletroposto_list.dart';
import 'package:gs/providers/eletroposto_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EletropostoProvider()..fetchEletropostos(),
      child: MaterialApp(
        home: EletropostoList(),
      ),
    );
  }
}
