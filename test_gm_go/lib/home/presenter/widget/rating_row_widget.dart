import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  final double media;
  final int qtdAvaliacoes;

  const RatingRow({super.key, required this.media, required this.qtdAvaliacoes});


void _showBottomSheet(BuildContext context, String title, double rating) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 500,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              height: 5, // Tamanho do traço
              width: 50, // Largura do traço
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.grey, // Cor do traço
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 30,),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  "Avaliação Geral",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
              child: Row(
                children: [
                  Row(
                    children: [
                      Text(
                        '$rating',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8), // Espaço entre a avaliação e as estrelas
                      _buildRatingStars(rating),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        '${qtdAvaliacoes.toString()} avaliações',
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildRatingStars(double rating) {
  List<Widget> stars = [];
  
  int fullStars = rating.floor();

  for (int i = 0; i < fullStars; i++) {
    stars.add(const Icon(Icons.star, color: Colors.yellow, size: 22));
  }

  for (int i = fullStars; i < 5; i++) {
    stars.add(const Icon(Icons.star, color: Colors.grey, size: 22));
  }

  return Row(
    children: stars,
  );
}



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => _showBottomSheet(context, 'Média', media),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffFDD835), width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                const Icon(Icons.star, color: Color(0xffFDD835), size: 18,),
                const SizedBox(width: 5),
                Text(
                  media.toString(),
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => _showBottomSheet(context, 'Avaliações', media),
          child: Row(
            children: [
              Text(
                '${qtdAvaliacoes.toString()} avaliações',
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 5),
              const Icon(Icons.keyboard_arrow_down, color: Colors.black),
            ],
          ),
        ),
      ],
    );
  }
}
