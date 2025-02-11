import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  List<String> filters = ['com desconto', 'disponíveis', 'hidro', 'piscina', 'sauna', 'ofurô', 'decoração erótica', 'decoração temática', 'cadeira erótica', 'pista de dança', 'garagem privativa', 'frigobar', 'internet wi-fi', 'suíte para festas', 'suíte com acessibilidade'];
  String? selectedFilter;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = selectedFilter == 'filtros' ? null : 'filtros';
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration: BoxDecoration(
                color: selectedFilter == 'filtros' ? Colors.red[600] : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.filter_list,
                    color: selectedFilter == 'filtros' ? Colors.white : Colors.black,
                    size: 20,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'filtros',
                    style: TextStyle(
                      color: selectedFilter == 'filtros' ? Colors.white : Colors.black,
                      fontSize: 14,
                      fontWeight: selectedFilter == 'filtros' ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // filtros adicionais
          ...filters.map((filter) {
            bool isSelected = selectedFilter == filter;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedFilter = isSelected ? null : filter;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.red[600] : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  filter,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
