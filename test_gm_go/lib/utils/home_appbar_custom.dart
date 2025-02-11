import 'package:flutter/material.dart';
import 'package:test_gm_go/home/presenter/controllers/home_controller.dart';
import 'package:test_gm_go/utils/app_colors.dart';
import 'package:test_gm_go/utils/app_fonts.dart';
import 'package:test_gm_go/utils/app_string.dart';

class HomeAppBar extends AppBar {
  final HomeController controller;
  final ValueChanged? onChange;
  final Widget widget;
  HomeAppBar({super.key, required this.controller, this.onChange,required this.widget})
      : super(
          toolbarHeight: 100,
          backgroundColor: Colors.red.shade800,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: AppColors.white,
                      )),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.bolt,
                          size: 20,
                          color: AppColors.red,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          AppString.goNow,
                          style: AppFonts.regular(16, AppColors.darkGray),
                        ),
                      ],
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
                          Icons.calendar_month_outlined,
                          color: AppColors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          AppString.goOtherday,
                          style: AppFonts.regular(12, AppColors.white),
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
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: widget),
            ],
          ),
        );
}
