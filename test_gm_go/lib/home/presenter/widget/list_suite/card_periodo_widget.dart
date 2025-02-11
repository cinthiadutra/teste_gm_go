import 'package:flutter/material.dart';
import 'package:test_gm_go/home/data/models/periodo.dart';

class CardPeriodoWidget extends StatelessWidget {
  final Periodo? entity;
  const CardPeriodoWidget({super.key, required this.entity});

  String formatCurrency(double? value) {
    if (value == null) {
      return "R\$ 00,00";
    }

    String formattedValue = value.toStringAsFixed(2);
    formattedValue = formattedValue.replaceAll('.', ',');
    return "R\$ $formattedValue";
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: 350,
        height: 90, 
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white, // vai ser branco
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entity?.tempoFormatado ?? '', 
                  style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey[700], fontSize: 22)
                ),
                Text(
                  formatCurrency(entity?.valor), 
                  style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey[700], fontSize: 22)
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey[700]),
          ],
        ),
      )
    );
  }
}