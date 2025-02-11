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
            return Column(
              children: [
                CarroselWidget(moteis: controller.listAll.value.result ?? []),
                const FilterWidget(),
                Expanded(
                  child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
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
                  ),
                ),
              ],
            );
          }

          if (state is Error) {
            return const Center(
              child: Text("Não há motéis para listar no momento!"),
            );
          }

          if (state is Ok<List<Motel>>) {
            final moteis = (state as Ok<List<Motel>>).value;
            return CustomScrollView(
              slivers: [
                CarroselWidget(moteis: moteis),
                SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    title: const FilterWidget(),
                    background: Container(color: Colors.white),
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

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
