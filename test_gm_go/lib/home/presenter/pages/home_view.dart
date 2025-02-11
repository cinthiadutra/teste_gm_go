import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:test_gm_go/home/presenter/controllers/home_controller.dart';
import 'package:test_gm_go/home/presenter/widget/floating_map_button_widget.dart';
import 'package:test_gm_go/utils/app_colors.dart';
import 'package:test_gm_go/utils/app_fonts.dart';
import 'package:test_gm_go/utils/home_appbar_custom.dart';
import 'go_now_view.dart';

final getIt = GetIt.instance;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = getIt<HomeController>();
    controller.initHomeController(0); // Inicializa o controlador
    controller.getMotels(); // Carrega os dados dos motéis

    // Definir valor inicial de 'capitalSelected' se estiver vazio ou nulo
    if (controller.capitalSelected.isEmpty && controller.brazilStates.isNotEmpty) {
      controller.capitalSelected = controller.brazilStates.first;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        controller: controller,
        widget: DropdownButton<String>(
          iconEnabledColor: Colors.transparent,
          iconSize: 0,
          isExpanded: true,
          style: AppFonts.medium(14, AppColors.white),
          underline: Container(color: Colors.transparent),
          items: controller.brazilStates.map(
            (capital) {
              return DropdownMenuItem(
                value: capital,
                child: Text(
                  capital,
                  style: AppFonts.bold(
                    15,
                    AppColors.darkGray,
                  ),
                ),
              );
            },
          ).toList(),
          selectedItemBuilder: (context) {
            return controller.brazilStates.map(
              (capital) {
                return DropdownMenuItem(
                  value: capital,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        capital,
                        style: AppFonts.bold(
                          15,
                          AppColors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: AppColors.white,
                      )
                    ],
                  ),
                );
              },
            ).toList();
          },
          value: controller.capitalSelected.isNotEmpty
              ? controller.capitalSelected
              : null, // Se estiver vazio, pode ser nulo
          onChanged: (value) {
            setState(() {
              controller.capitalSelected = value ?? '';
            });
          },
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          GoNowView(),
          GoNowView(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingMapButtonWidget(
        onPressed: () {},
      ),
    );
  }
}
