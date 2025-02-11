import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:test_gm_go/home/data/models/motel.dart';
import 'package:test_gm_go/home/data/models/result_state.dart';
import 'package:test_gm_go/home/presenter/controllers/home_controller.dart';
import 'package:test_gm_go/home/presenter/widget/card_motel_widget.dart';
import 'package:test_gm_go/home/presenter/widget/carrosel_widget.dart';
import 'package:test_gm_go/home/presenter/widget/filter_widget.dart';
import 'package:test_gm_go/utils/result.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class GoNowView extends StatefulWidget {
  const GoNowView({super.key});

  @override
  State<GoNowView> createState() => _GoNowViewState();
}

class _GoNowViewState extends State<GoNowView> {
  final controller = getIt<HomeController>();

  @override
  void initState() {
    super.initState();
    // Inicia a execução do caso de uso e carrega os dados
    controller.getMotels();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.red[600],
      onRefresh: () async {
        await controller.getMotels();
      },
      child: ValueListenableBuilder<ResultState<List<Motel>>>(
        valueListenable: controller.listAll,
        builder: (context, state, _) {
          if (state.running) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      CarroselWidget(
                          moteis: controller.listAll.value.result ?? []),
                      const FilterWidget(),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      );
                    },
                    childCount:
                        3, // Ajuste para a quantidade desejada de itens de loading
                  ),
                ),
              ],
            );
          }

          // Verifica se houve erro ao buscar os dados
          if (state is Error) {
            return const Center(
              child: Text("Não há motéis para listar no momento!"),
            );
          }

          // Quando os dados estão disponíveis e a lista não está vazia
          if (state is Ok<List<Motel>>) {
            final moteis = (state as Ok<List<Motel>>).value;
            if (moteis.isEmpty) {
              return const Center(
                child: Text("Nenhum motel encontrado!"),
              );
            }
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      CarroselWidget(moteis: moteis),
                      const FilterWidget(),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final motel = moteis[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CardMotelWidget(entity: motel),
                      );
                    },
                    childCount: moteis.length,
                  ),
                ),
              ],
            );
          }

          // Retorna um contêiner vazio caso nenhum dos estados anteriores seja válido
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
