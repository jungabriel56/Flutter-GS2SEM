import 'package:flutter/material.dart';
import 'package:gs/models/eletroposto.dart';
import 'package:gs/services/eletroposto_service.dart';

class EletropostoProvider with ChangeNotifier {
  EletropostoService _eletropostoService = EletropostoService();
  List<Eletroposto> _eletropostos = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Eletroposto> get eletropostos => _eletropostos;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchEletropostos() async {
    _isLoading = true;
    notifyListeners();
    try {
      await Future.delayed(Duration(seconds: 4));

      _eletropostos = await _eletropostoService.fetchEletropostos();
    } catch (e) {
      _errorMessage = 'Erro ao ccarregar eletroposto: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
