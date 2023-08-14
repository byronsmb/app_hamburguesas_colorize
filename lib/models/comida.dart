enum Categoria {
  simple,
  especial,
  vegano,
  smash,
}

class Comida {
  const Comida({
    required this.nombre,
    required this.descripcion,
    required this.miniDescripcion,
    required this.precio,
    required this.imagenUrl,
    required this.imagenExUrl,
    required this.categoria,
  });
  final String nombre;
  final String descripcion;
  final String miniDescripcion;
  final double precio;
  final String imagenUrl;
  final String imagenExUrl;
  final Categoria categoria;
}
