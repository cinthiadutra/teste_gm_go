import 'package:flutter/material.dart';
import 'package:test_gm_go/home/presenter/controllers/home_controller.dart';

class SelectionPageWidget extends StatefulWidget {
  final HomeController pageCont;
  const SelectionPageWidget({super.key, required this.pageCont});

  @override
  State<SelectionPageWidget> createState() => _SelectionPageWidgetState();
}

class _SelectionPageWidgetState extends State<SelectionPageWidget> {
  Widget _buildSelectionItem(
      String text, bool isSelected, IconData icon, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
            border: isSelected
                ? Border.all(color: Colors.red[700]!)
                : Border.all(color: Colors.transparent),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isSelected ? Colors.red[700] : Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: widget.pageCont.isSelectedNow,
        builder: (context, isSelectedNow, child) {
          return Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.red[800],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                _buildSelectionItem("ir agora", isSelectedNow, Icons.flash_on,
                    () {
                  setState(() {
                    widget.pageCont.isSelectedNow.value = true;
                    widget.pageCont.goToPage(0);
                  });
                }),
                _buildSelectionItem(
                    "ir outro dia", !isSelectedNow, Icons.check_box_outlined,
                    () {
                  setState(() {
                    widget.pageCont.isSelectedNow.value = false;
                    widget.pageCont.goToPage(1);
                  });
                }),
              ],
            ),
          );
        });
  }
}
