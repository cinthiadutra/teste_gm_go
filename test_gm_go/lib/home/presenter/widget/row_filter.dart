import 'package:flutter/material.dart';
import 'package:test_gm_go/utils/app_colors.dart';
import 'package:test_gm_go/utils/app_fonts.dart';

class RowFilter extends StatelessWidget {
  const RowFilter({super.key});

  @override
  Widget build(BuildContext context) {
    const filters = [
      'filtros',
      'com desconto',
      'disponíveis',
      'hidro',
      'piscina'
    ];

    return FlexibleSpaceBar(
      background: Stack(
        children: [
          Container(
            color: AppColors.red,
            height: 240,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 16, top: 4, bottom: 4),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.4, color: AppColors.gray),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: index == 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.settings_applications),
                              const SizedBox(width: 8),
                              Text(
                                filters[index],
                                style: AppFonts.regular(16, AppColors.gray),
                              ),
                            ],
                          )
                        : Text(
                            filters[index],
                            textAlign: TextAlign.center,
                            style: AppFonts.regular(14, AppColors.gray),
                          ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
