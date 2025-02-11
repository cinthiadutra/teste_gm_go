import 'package:flutter/material.dart';
import 'package:test_gm_go/home/data/models/suite.dart';

class CategoriasItensView extends StatelessWidget {
  final Suite entity;

  const CategoriasItensView({super.key, required this.entity});

  Widget principaisItensWidget(String texto) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,  // Faz com que a linha ocupe apenas o espaço necessário
        children: [
          const Expanded(child: Divider()),  // Linha à esquerda
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              texto,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Expanded(child: Divider()),  // Linha à direita
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),  // Ajuste a margem conforme necessário
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              // Espaço para não colar no topo
              const SizedBox(height: 50),  // Ajuste esse valor para controlar o espaço no topo
        
              // Nome da suíte
              Center(
                child: Text(
                  entity.nome.toString().toLowerCase(),
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              principaisItensWidget('princípais itens'),
              const SizedBox(height: 20),
              Wrap(
                spacing: 20.0,  // Espaço entre os itens
                runSpacing: 10.0,  // Espaço entre as linhas
                children: entity.categoriaItens!.map((item) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 30,  // Limita a largura para no máximo 2 itens por linha, com um espaçamento
                    child: Row(
                      children: [
                        Image.network(
                          item.icone ?? '',
                          width: 50,  // Ajuste o tamanho da imagem conforme necessário
                          height: 50,
                        ),
                        const SizedBox(width: 10),  // Espaço entre a imagem e o texto
                        Expanded(
                          child: Text(
                            item.nome.toString().toLowerCase(),
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              principaisItensWidget('tem também'),
              const SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.start,  // Garante que o conteúdo fique alinhado à esquerda
                spacing: 10.0,  // Espaço entre os itens
                runSpacing: 5.0,  // Espaço entre as linhas
                children: List.generate(entity.categoriaItens!.length, (index) {
                  final item = entity.categoriaItens![index];
                  return Text(
                    item.nome.toString().toLowerCase() +
                        (index < entity.categoriaItens!.length - 1 ? ', ' : ''),
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                    softWrap: true,  // Permite a quebra de linha
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
