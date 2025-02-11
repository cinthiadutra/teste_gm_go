import 'package:flutter/material.dart';
import 'package:test_gm_go/home/presenter/controllers/home_controller.dart';
import 'package:test_gm_go/home/presenter/pages/home_view.dart';
import 'package:test_gm_go/home/presenter/widget/row_filter.dart';
import 'package:test_gm_go/utils/app_colors.dart';
import 'package:test_gm_go/utils/app_fonts.dart';
import 'package:test_gm_go/utils/app_string.dart';

class HomeAppBarSliver extends StatefulWidget {
  const HomeAppBarSliver({super.key});

  @override
  State<HomeAppBarSliver> createState() => _HomeAppBarSliverState();
}

class _HomeAppBarSliverState extends State<HomeAppBarSliver> {
  final controller = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.white,
      centerTitle: true,
      toolbarHeight: 240,
      expandedHeight: 240,
      pinned: true,
      flexibleSpace: const RowFilter(),
      titleSpacing: 0,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    color: AppColors.white,
                  )),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.railway_alert,
                        size: 32,
                        color: AppColors.red,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        AppString.goNow,
                        style: AppFonts.bold(24, AppColors.darkGray),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: AppColors.white,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      AppString.goNow,
                      style: AppFonts.bold(24, AppColors.white),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: AppColors.white,
                ),
              )
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 40),
              child: DropdownButton<String>(
                iconEnabledColor: Colors.transparent,
                iconSize: 0,
                isExpanded: true,
                style: AppFonts.medium(14, AppColors.white),
                underline: Container(
                  color: Colors.transparent,
                ),
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
                value: controller.capitalSelected,
                onChanged: (value) {
                  setState(() {
                    controller.capitalSelected = value ?? '';
                  });
                },
              )),
        ],
      ),
    );
  }
}
