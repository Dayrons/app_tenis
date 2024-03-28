import 'package:faker/faker.dart';
import 'package:app_tenis/models/usuario.dart';

List<Usuario> usuarios = [
  Usuario(
    nombre: 'Dayrons',
    telefono: '04120148704',
    foto: "https://avatars.githubusercontent.com/u/52265180?v=4",
    apellido: 'Tovar',
    email: "dayrons@example.com",
  ),
  Usuario(
    nombre: 'Veronica',
    telefono: '04149131519',
    foto: faker.image.image(),
    apellido: 'Perez',
    email: "veronica@example.com",
  ),
   Usuario(
    nombre: 'Cristian',
    telefono: '04149131519',
    foto: faker.image.image(),
    apellido: 'Tovar',
    email: "cristian@example.com",
  ),
  
];

void callUsuariosSeeder() async {
  for (Usuario usuario in usuarios) {
    await usuario.create();
  }
}