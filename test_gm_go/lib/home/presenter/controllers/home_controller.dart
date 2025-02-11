// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:test_gm_go/home/data/models/motel.dart';
import 'package:test_gm_go/home/data/models/result_state.dart';
import 'package:test_gm_go/home/domain/usecases/home_usercase.dart';

class HomeController {
  final HomeUsercase _usercase;
  final PageController _pageController = PageController();
  final Duration _duration = const Duration(milliseconds: 300);
  final Curve _curve = Curves.easeInOut;
  String capitalSelected = '';

  /// Estado da requisição de motéis
  ValueNotifier<ResultState<List<Motel>>> listAll =
      ValueNotifier<ResultState<List<Motel>>>(ResultState(running: true));

  /// Lista de motéis carregada
  ValueNotifier<List<Motel>> listMoteis = ValueNotifier<List<Motel>>([]);

  /// Estado da aba selecionada
  ValueNotifier<bool> isSelectedNow = ValueNotifier<bool>(true);

  /// Índice atual da página
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  HomeController({required HomeUsercase usercase}) : _usercase = usercase;

  PageController get pageController => _pageController;

  /// Inicializa o controller e busca os motéis
  void initHomeController(int index) {
    // Garantir que a navegação para a página aconteça após a tela ser montada
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(index);
      setIndex(index);
    });

    getMotels();
  }

  /// Busca a lista de motéis e atualiza o estado
  Future<void> getMotels() async {
    // Alterar o estado para "carregando"
    if (!listAll.hasListeners) return; // Verifica se o ValueNotifier ainda está ativo
    listAll.value = ResultState(running: true);

    // Executando o UseCase
    final result = await _usercase.execute();
    result.fold(
      (failure) {
        // Caso ocorra falha, atualizar o estado para erro
        if (!listAll.hasListeners) return;
        listAll.value = ResultState(error: true, message: failure.toString());
      },
      (moteis) {
        // Se a resposta for bem-sucedida, atualizar o estado com a lista de motéis
        if (!listAll.hasListeners) return;
        listAll.value = ResultState(result: moteis);
        if (!listMoteis.hasListeners) return;
        listMoteis.value = List.from(moteis);
      },
    );
  }

  /// Atualiza o índice atual e notifica mudanças
  void setIndex(int index) {
    _currentIndex = index;
    if (!isSelectedNow.hasListeners) return;
    isSelectedNow.value = index == 0;
  }

  /// Animação para mudar de página
  void goToPage(int index) {
    if (_pageController.hasClients) {
      _pageController.animateToPage(index, duration: _duration, curve: _curve);
    }
  }

  /// Voltar para a página anterior
  void goToPrevious() {
    if (_currentIndex > 0) {
      _pageController.previousPage(duration: _duration, curve: _curve);
    }
  }

  /// Avançar para a próxima página
  void goToNext(int total) {
    if (_currentIndex < total - 1) {
      _pageController.nextPage(duration: _duration, curve: _curve);
    }
  }

  /// Libera recursos ao encerrar o controller
  void dispose() {
    _pageController.dispose();
    listAll.dispose();
    listMoteis.dispose();
    isSelectedNow.dispose();
  }

  List<String> brazilStates = [
    'Acre',
    'Alagoas',
    'Amapá',
    'Amazonas',
    'Bahia',
    'Ceará',
    'Espírito Santo',
    'Goiás',
    'Maranhão',
    'Mato Grosso',
    'Mato Grosso do Sul',
    'Minas Gerais',
    'Pará',
    'Paraíba',
    'Paraná',
    'Pernambuco',
    'Piauí',
    'Rio de Janeiro',
    'Rio Grande do Norte',
    'Rio Grande do Sul',
    'Rondônia',
    'Roraima',
    'Santa Catarina',
    'São Paulo',
    'Sergipe',
    'Tocantins'
  ];
}
