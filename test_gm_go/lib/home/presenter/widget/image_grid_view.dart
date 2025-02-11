import 'package:flutter/material.dart';
import 'package:test_gm_go/config/routes.dart';
import 'package:test_gm_go/utils/routes_data/image_select_data.dart';


class ImageGridView extends StatelessWidget {
  final String suite;
  final List<String> imageUrls;

  const ImageGridView({super.key, required this.imageUrls, required this.suite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          suite.toString().toLowerCase(),
          maxLines: 2, 
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 18),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop,
          icon: Icon(Icons.arrow_back_ios, size: 18, color: Colors.grey[700]),
        ),
      ),
      body: imageUrls.isEmpty
          ? const Center(
              child: Text('Esta suíte não possui imagens.'),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _buildImageGrid(context),
              ),
            ),
    );
  }

  List<Widget> _buildImageGrid(BuildContext context) {
    List<Widget> widgets = [];

    // Exibe a primeira imagem sozinha (imagem comprida)
    if (imageUrls.isNotEmpty) {
      widgets.add(_buildImageWithPadding(context, imageUrls[0], 0));
    }

    // Se houver mais de 1 imagem, adiciona as próximas 2 lado a lado
    for (int i = 1; i < imageUrls.length; i += 2) {
      // Se restar 1 imagem no final, adiciona ela sozinha
      if (i + 1 < imageUrls.length) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 8.0), // Apenas um padding entre as linhas
            child: Row(
              children: [
                _buildFlexibleImage(context, imageUrls[i], i),
                const SizedBox(width: 8),
                _buildFlexibleImage(context, imageUrls[i + 1], i + 1),
              ],
            ),
          ),
        );
      } else {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: _buildImageWithPadding(context, imageUrls[i], i),
          ),
        );
      }
    }

    return widgets;
  }

  Widget _buildImageWithPadding(BuildContext context, String imageUrl, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: _buildImageContainer(context, imageUrl, index),
    );
  }

  Widget _buildFlexibleImage(BuildContext context, String imageUrl, int index) {
    return Expanded(
      child: _buildImageContainer(context, imageUrl, index),
    );
  }

  Widget _buildImageContainer(BuildContext context, String imageUrl, int index) {
    return GestureDetector(
      onTap: () {
        final img = ImageSelectData(images: imageUrls, title: suite, index: index);
        Navigator.of(context).pushNamed
        (RoutesPath.imageSelection, arguments: img);
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

