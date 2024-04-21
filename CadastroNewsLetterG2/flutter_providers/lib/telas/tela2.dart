import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_providers/models/user.dart';
import 'package:flutter_providers/providers/user_provider.dart';
import 'package:flutter_providers/telas/tela3.dart';

class Tela2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Escolha a categoria',
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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Categoria da Newsletter',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  border: InputBorder.none,
                ),
                value: 'Escolher...',
                onChanged: (String? newValue) {
                  User currentUser =
                      Provider.of<UserProvider>(context, listen: false).user;
                  currentUser.categoria = newValue!;
                  Provider.of<UserProvider>(context, listen: false)
                      .updateUser(currentUser);
                },
                items: <String>[
                  'Escolher...',
                  'Tudo',
                  'Tecnologia',
                  'Cultura',
                  'Política',
                  'Internacional',
                  'Finanças',
                  'Esporte'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Frequência',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  border: InputBorder.none,
                ),
                value: 'Escolher...',
                onChanged: (String? newValue) {
                  User currentUser =
                      Provider.of<UserProvider>(context, listen: false).user;
                  currentUser.frequencia = newValue!;
                  Provider.of<UserProvider>(context, listen: false)
                      .updateUser(currentUser);
                },
                items: <String>[
                  'Escolher...',
                  '1 vez por semana',
                  '2 vezes por semana',
                  '3 vezes por semana',
                  '4 vezes por semana',
                  '5 vezes por semana',
                  '6 vezes por semana'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                User currentUser =
                    Provider.of<UserProvider>(context, listen: false).user;
                if (currentUser.categoria.isEmpty ||
                    currentUser.frequencia.isEmpty) {
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
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Tela3()));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.black,
                side: BorderSide(color: Colors.black, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32), // Aumentando o padding
              ),
              child: Text('Next', style: TextStyle(fontSize: 20)), // Aumentando o tamanho do texto
            ),
            SizedBox(height: 10), // Adicionando um espaço entre os botões
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
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
              child: Text('Back', style: TextStyle(fontSize: 10)), // Ajustando o tamanho do texto
            ),
          ],
        ),
      ),
    );
  }
}
