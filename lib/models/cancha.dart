class Cancha {
  int id;
  String nombre;
  double precio;
  String direccion;
  String descripcion;
  String imagen;
  String latitud;
  String longitud;



  Cancha({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.direccion,
    required this.descripcion,
    required this.imagen,
    required this.latitud,
    required this.longitud,


  });

  Cancha.fromMap(Map snapshot, String id)
      : id = snapshot['id'],
        nombre = snapshot['nombre'],
        precio = snapshot['precio'],
        direccion = snapshot['direccion'],
        descripcion = snapshot['descripcion'],
        imagen = snapshot['imagen'],
        latitud = snapshot['latitud'],
        longitud = snapshot['longitud'];
     
  
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nombre": nombre,
      "precio": precio,
      "direccion": direccion,
      "descripcion": descripcion,
      "imagen": imagen,
      "latitud": latitud,
      "longitud": longitud,
      
    };
  }
}