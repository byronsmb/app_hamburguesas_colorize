import 'dart:async';
import 'dart:ui';

import 'package:app_hamburguesas_abierto/models/comida.dart';
import 'package:flutter/material.dart';

class DetalleComida extends StatefulWidget {
  const DetalleComida({super.key, required this.comida});
  final Comida comida;

  @override
  State<DetalleComida> createState() => _DetalleComidaState();
}

class _DetalleComidaState extends State<DetalleComida> {
  double _width = 0;
  double _height = 55;
  bool isExpanded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 1), () {
      setState(() {
        _height = MediaQuery.of(context).size.height * 0.52;
      });
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _width = MediaQuery.of(context).size.width - 50;
  }

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              image: DecorationImage(
                image: AssetImage(
                    widget.comida.imagenExUrl), //('assets/images/fondo1.jpg'),
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
                        padding: const EdgeInsets.only(
                          left: 35,
                          right: 35,
                          //top: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.white,
                                  ),
                                ),
                                const Icon(
                                  Icons.more_vert_outlined,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            Center(
                              child: AnimatedContainer(
                                width: _width,
                                height: _height,
                                onEnd: () {
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                },
                                decoration: BoxDecoration(
                                  borderRadius: _borderRadius,
                                  //color: Colors.red,
                                ),
                                duration: const Duration(seconds: 1),
                                curve: Curves.fastOutSlowIn,
                                // padding: EdgeInsets.symmetric(vertical: -5),
                                child: Image.asset(
                                  widget.comida.imagenExUrl,
                                  //width: 2,
                                  //height: 50,
                                  fit:
                                      isExpanded ? BoxFit.contain : BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.black.withOpacity(0.3),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Prueba la mejor Hamburguesa',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            //color: Colors.white,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.comida.nombre,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: Colors.white,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    'Con una mezcla única de carne de res de primera calidad y una selección especial de condimentos secretos, cada mordisco es una explosión de sabor en tu paladar.',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(

                                            // fontWeight: FontWeight.bold,
                                            ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Tiempo de Entrega',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall!
                                                      .copyWith(
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 235, 153, 12),

                                                        // fontWeight: FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: const Icon(
                                                Icons.watch_later_outlined,
                                                color: Colors.white,
                                              ),
                                              title: Text(
                                                '35 Mins',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge!
                                                    .copyWith(
                                                      // color: Color.fromARGB(255, 235, 153, 12),
                                                      // fontWeight: FontWeight.bold,
                                                      fontSize: 17,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35, //150,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              gradient: const LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 192, 2, 2),
                                                  Color.fromARGB(
                                                      255, 218, 169, 169),
                                                ],
                                                stops: [0.4, 1],
                                              ),
                                            ),
                                            transform: Matrix4.skewX(0.5),
                                            child: const Center(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'Comprar',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 10,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.red,
                                                    Color.fromARGB(
                                                        255, 194, 133, 133),
                                                  ],
                                                  stops: [0.4, 1],
                                                ),
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
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
