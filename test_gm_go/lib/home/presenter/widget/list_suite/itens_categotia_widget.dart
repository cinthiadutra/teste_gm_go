import 'package:flutter/material.dart';
import 'package:test_gm_go/home/data/models/item_categoria.dart';

class ItensCategotiaWidget extends StatelessWidget {
  final List<CategoriaItem> categoriaItens;
  const ItensCategotiaWidget({super.key, required this.categoriaItens});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: 350,
        height: 80, 
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white, // vai ser branco
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(3, (index) {
              if (index < categoriaItens.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[100],
                    ),
                    child: Image.network(categoriaItens[index].icone.toString(), width: 40, height: 40)
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("ver", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                      Text("todos", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                    ],
                  ),
                  Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
