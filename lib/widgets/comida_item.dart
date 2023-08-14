import 'package:app_hamburguesas_abierto/detalle_comida.dart';
import 'package:app_hamburguesas_abierto/models/comida.dart';
import 'package:flutter/material.dart';

class ComidaItem extends StatelessWidget {
  const ComidaItem({super.key, required this.comida});
  final Comida comida;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalleComida(
              comida: comida,
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.36,
        margin: const EdgeInsets.only(right: 10),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.white,
              const Color.fromARGB(255, 15, 145, 33),
              Colors.black.withOpacity(0.4),
              Colors.black.withOpacity(0.4),
              const Color.fromARGB(255, 231, 88, 62),
              Colors.white,
            ],
            stops: const [0.0, 0.04, 0.1, 0.9, 0.96, 1.0],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        //width: 130,
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            Image.asset(
              comida.imagenUrl,
              width: 135,
              //height: 50,
              fit: BoxFit.cover,
            ), // Cambia la ruta a la imagen que quieras mostrar
            const SizedBox(width: 16.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                comida.nombre,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                comida.miniDescripcion,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: const Color.fromARGB(255, 235, 153, 12),
                      fontSize: 11,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '\$${comida.precio}',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 15,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
