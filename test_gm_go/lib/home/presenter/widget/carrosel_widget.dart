import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_gm_go/home/data/models/motel.dart';
import 'package:test_gm_go/home/presenter/controllers/home_controller.dart';
import 'package:test_gm_go/home/presenter/pages/home_view.dart';

class CarroselWidget extends StatefulWidget {
  final List<Motel> moteis;
  const CarroselWidget({super.key, required this.moteis});

  @override
  State<CarroselWidget> createState() => _CarroselWidgetState();
}

class _CarroselWidgetState extends State<CarroselWidget> {
  final HomeController _homeController = HomeController(repository: getIt.call());
  final ValueNotifier<int> _currentPage = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _homeController.getMotels();
  }

  @override
  void dispose() {
    _homeController.dispose();
    _currentPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;

    return ValueListenableBuilder<List<Motel>>(
      valueListenable: _homeController.listMoteis,
      builder: (context, moteis, _) {
        if (moteis.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider.builder(
              itemCount: moteis.length,
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  _currentPage.value = index;
                },
              ),
              itemBuilder: (context, index, realIndex) {
                final motel = moteis[index];

                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Image.network(
                        motel.logo ?? '',
                        width: widthScreen / 2.3,
                        height: widthScreen / 2.3,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 50),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SizedBox(
                          height: widthScreen / 2.2,
                          width: widthScreen / 2.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/fire.svg',
                                    width: 25,
                                    height: 25,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.red,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  const SizedBox(width: 2),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        motel.fantasia ?? "",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        motel.bairro ?? "Bairro não informado",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Desconto: ${motel.suites!.isNotEmpty ? motel.suites![0].itens ?? 'Sem desconto' : 'Sem desconto'}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "A partir de: R\$ ${_getMenorPreco(motel)}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Ação para reservar
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 37, 170, 77),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Reservar",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(Icons.arrow_forward_ios,
                                        size: 16, color: Colors.white),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            ValueListenableBuilder<int>(
              valueListenable: _currentPage,
              builder: (context, currentPage, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    moteis.length,
                    (index) => Container(
                      margin: const EdgeInsets.all(4),
                      width: currentPage == index ? 8 : 6,
                      height: currentPage == index ? 8 : 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPage == index
                            ? Colors.grey[800]
                            : Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  String _getMenorPreco(Motel motel) {
    // Verifica se 'suites' é nulo ou está vazio
    if (motel.suites == null || motel.suites!.isEmpty) {
      return "0,00"; // Retorna "0,00" se não houver suítes ou se 'suites' for nulo
    }

    double menorPreco = double.infinity;

    // Percorre as suítes, garantindo que 'suites' não seja nulo
    for (var suite in motel.suites!) {
      if (suite.periodos != null) {
        for (var periodo in suite.periodos!) {
          if (periodo.valor! < menorPreco) {
            menorPreco = periodo.valorTotal!;
          }
        }
      }
    }

    // Retorna o menor preço encontrado, ou "0,00" se não encontrar nenhum
    return menorPreco == double.infinity
        ? "0,00"
        : menorPreco.toStringAsFixed(2);
  }
}
