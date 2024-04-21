import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_providers/models/user.dart';
import 'package:flutter_providers/providers/user_provider.dart';
import 'package:flutter_providers/telas/tela1.dart';

class Tela3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: AppBar(title: Text('Finalizar Cadastro')),
      body: Container(
        color: Colors.red[700], // Definindo um fundo vermelho
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Nome: ${user.name}',
                  style: TextStyle(
                    color: Colors.white, // Definindo a cor branca para o texto
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0, // Aumentando o tamanho do texto
                  ),
                ),
                Text(
                  'Email: ${user.email}',
                  style: TextStyle(
                    color: Colors.white, // Definindo a cor branca para o texto
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0, // Aumentando o tamanho do texto
                  ),
                ),
                Text(
                  'Categoria: ${user.categoria}',
                  style: TextStyle(
                    color: Colors.white, // Definindo a cor branca para o texto
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0, // Aumentando o tamanho do texto
                  ),
                ),
                Text(
                  'Frequência: ${user.frequencia}',
                  style: TextStyle(
                    color: Colors.white, // Definindo a cor branca para o texto
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0, // Aumentando o tamanho do texto
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Cadastro concluído'),
                        content: Text('Seu cadastro foi concluído com sucesso!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Limpar os campos após o submit final
                              Provider.of<UserProvider>(context, listen: false).updateUser(User(
                                name: '',
                                email: '',
                                categoria: '',
                                frequencia: '',
                              ));
                              // Navegar de volta para a tela inicial
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => Tela1()),
                                (route) => false, // Limpar todas as rotas anteriores
                              );
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[700], // Definindo um fundo vermelho
                    foregroundColor: Colors.white, // Definindo a cor branca para o texto do botão
                    side: BorderSide(color: Colors.black, width: 2), // Adicionando um contorno preto
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Definindo um raio personalizado
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Aumentando o padding
                  ),
                  child: Text('Cadastrar', style: TextStyle(fontSize: 24)), // Aumentando o tamanho do texto
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
