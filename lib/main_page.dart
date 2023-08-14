import 'dart:ui';

import 'package:app_hamburguesas_abierto/data/datos_ficticios.dart';
import 'package:app_hamburguesas_abierto/models/comida.dart';
import 'package:app_hamburguesas_abierto/widgets/comida_item.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedButtonIndex = 1;
  String categoriaActual = 'simple';
  List<Comida> comidasFiltradas = comidaDisponible
      .where(
        (comidaN) => comidaN.categoria == Categoria.simple,
      )
      .toList();

  Widget _botonItem(BuildContext context, String imagenUrl, String texto,
      int index, int currentIndex, Categoria tipoCategoria) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selectedButtonIndex = index;
              comidasFiltradas = comidaDisponible
                  .where(
                    (comidaN) => comidaN.categoria == tipoCategoria,
                  )
                  .toList();
              categoriaActual = tipoCategoria.name;
            });
          },
          child: Container(
            height: 40,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    imagenUrl,
                    height: 40,
                  ),
                ),
                Positioned.fill(
                    child: Container(
                  decoration: BoxDecoration(
                    //color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: selectedButtonIndex == currentIndex
                            ? Colors.yellow.withOpacity(0.5)
                            : Colors.transparent, // Color de la sombra
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(3, 3),
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.grey,
                        Colors.red.withOpacity(0.4),
                        Colors.red.withOpacity(0.4),
                        const Color.fromARGB(255, 194, 231, 62),
                        Colors.white,
                      ],
                      stops: const [0.0, 0.02, 0.08, 0.92, 0.98, 1.0],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
        Text(
          texto,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(

              // fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double alturaPantalla = MediaQuery.of(context).size.height;
    double safeAreaAltura = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;
    double alturaDisponible = alturaPantalla - safeAreaAltura;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: SingleChildScrollView(
          child: Container(
            height: alturaDisponible, // MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              image: const DecorationImage(
                image: AssetImage('assets/images/fondo4.png'), //fondo3.jpg
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 10, sigmaY: 10), // Parámetros de desenfoque
              child: Container(
                color: Colors.black.withOpacity(0), // Color transparente
                // Aquí puedes agregar otros widgets encima del fondo desenfocado
                child: Stack(
                  children: [
                    _colorBordes(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: 'Hola ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                  children: [
                                    TextSpan(
                                      text: 'Luis',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 231, 88, 62)
                                      .withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/avatar.png'), // Ruta de la imagen
                                    fit: BoxFit
                                        .cover, // Ajusta la imagen al contenedor
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 50,
                            //width: 150,
                            decoration: BoxDecoration(
                              //color: Colors.yellow,
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white,
                                  const Color.fromARGB(255, 15, 145, 33),
                                  Colors.black.withOpacity(0.5),
                                  Colors.black.withOpacity(0.5),
                                  const Color.fromARGB(255, 231, 88, 62),
                                  Colors.white,
                                ],
                                stops: const [0.0, 0.02, 0.08, 0.92, 0.98, 1.0],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            // margin: const EdgeInsets.all(20),
                            child: const Center(
                              child: TextField(
                                textAlignVertical: TextAlignVertical.bottom,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 235, 153, 12),
                                  fontSize: 16,
                                ),
                                cursorColor: Colors.green, // color del cursor

                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.white54,
                                  ),
                                  hintText: 'Buscar comida...',
                                  hintStyle: TextStyle(
                                      color: Colors.white54), // Color del hint

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _botonItem(
                                context,
                                'assets/icons/simple.png',
                                'Simple',
                                1,
                                1,
                                Categoria.simple,
                              ),
                              _botonItem(
                                context,
                                'assets/icons/especial.png',
                                'Especial',
                                2,
                                2,
                                Categoria.especial,
                              ),
                              _botonItem(
                                context,
                                'assets/icons/vegan.png',
                                'Vegana',
                                3,
                                3,
                                Categoria.vegano,
                              ),
                              _botonItem(
                                context,
                                'assets/icons/smash.png',
                                'Smash',
                                4,
                                4,
                                Categoria.smash,
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Hamburguesas $categoriaActual',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    //color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                  ),
                            ),
                          ),
                          Container(
                            // color: Colors.white,
                            height: 210,
                            width: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              itemCount: comidasFiltradas.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ComidaItem(
                                  comida: comidasFiltradas[index],
                                );
                              },
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Oferta de Hoy!',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    //color: Colors.white,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Papas Fritas',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(

                                            //fontStyle: FontStyle.italic,
                                            //fontWeight: FontWeight.bold,
                                            ),
                                  ),
                                  Text(
                                    'Gratis',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      'Sólo Con Hamburguesa De Carne',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(

                                              // fontWeight: FontWeight.bold,
                                              ),
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Container(
                                    //color: Colors.amber,
                                    width: MediaQuery.of(context).size.width *
                                        0.46, //180,
                                    alignment: Alignment.topRight,
                                    child: Image.asset(
                                      'assets/images/black-con-tocino.png',
                                      height: 150,
                                      width: MediaQuery.of(context).size.width *
                                          0.38,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 4,
                                    left: 1,
                                    child: Image.asset(
                                      'assets/images/papas-fritas.png',
                                      height: 70,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ),
        ),
      )),
    );
  }
}

Widget _colorBordes(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.white,
          const Color.fromARGB(255, 15, 145, 33),
          Colors.black.withOpacity(0.15),
          Colors.black.withOpacity(0.15),
          const Color.fromARGB(255, 231, 88, 62),
          Colors.white,
        ],
        stops: const [0.0, 0.02, 0.1, 0.9, 0.98, 1.0],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
  );
}
