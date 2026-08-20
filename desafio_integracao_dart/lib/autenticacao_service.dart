import 'usuario.dart';

class AutenticacaoService {
  bool login(Usuario usuario, String senha) {
    if (usuario.email.isEmpty) {
      return false;
    }

    if (senha == '123456') {
      usuario.autenticado = true;
      return true;
    }

    usuario.autenticado = false;
    return false;
  }

  void logout(Usuario usuario) {
    usuario.autenticado = false;
  }
}
