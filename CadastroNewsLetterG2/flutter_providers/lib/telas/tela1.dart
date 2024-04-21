import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_providers/models/user.dart';
import 'package:flutter_providers/providers/user_provider.dart';
import 'package:flutter_providers/telas/tela2.dart';

class Tela1 extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastro na NewsLetter de Notícias G2',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: Colors.red[700],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text(
              'Seu nome:',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Digite seu nome',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Seu email:',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Digite seu email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty || emailController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Campos Vazios'),
                      content: Text('Por favor, preencha todos os campos.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  User user = User(
                    name: nameController.text,
                    email: emailController.text,
                    categoria: '',
                    frequencia: '',
                  );
                  Provider.of<UserProvider>(context, listen: false).updateUser(user);
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Tela2()));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Cor vermelha para o botão
                foregroundColor: Colors.black, // Cor preta para o texto do botão
                side: BorderSide(color: Colors.black, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Ajustando o padding

              ),
              child: Text('Next', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
