// Importe os pacotes necessários
import 'dart:convert';
import 'package:flutter_geralnoticias_trabalho/constantes_ambiente.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/article.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Dio dio = Dio();
  List<Article> articles = [];
  List<Map<String, dynamic>> holidays = [];

  @override
  void initState() {
    super.initState();
    _pegarNoticias();
    _pegarFeriados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GeralNotícias",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          _buildFeriados(),
          Expanded(child: _buildUI()),
        ],
      ),
    );
  }

  // Widget para construir a lista de feriados
  Widget _buildFeriados() {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Feriados Nacionais',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: holidays.map<Widget>((holiday) {
              return Text(
                '${holiday['date']} - ${holiday['name']}',
                style: TextStyle(fontSize: 16),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Método para obter os feriados da API
  Future<void> _pegarFeriados() async {
    try {
      final response = await dio.get('https://brasilapi.com.br/api/feriados/v1/2024');
      setState(() {
        holidays = List<Map<String, dynamic>>.from(response.data);
      });
    } catch (e) {
      print('Erro ao buscar feriados: $e');
    }
  }

  // Método para obter as notícias da API
  Future<void> _pegarNoticias() async {
    try {
      final response = await dio.get('https://newsapi.org/v2/top-headlines?country=br&apiKey=${API_KEY}');
      final articlesJson = response.data['articles'] as List;
      setState(() {
        articles = articlesJson.map((a) => Article.fromJson(a)).toList();
      });
    } catch (e) {
      print('Erro ao buscar notícias: $e');
    }
  }

  // Método para lançar URL
  Future<void> _launchUrl(Uri url) async {
    if (!await launch(url.toString())) {
      throw Exception('Could not launch $url');
    }
  }

  // Widget para construir a lista de artigos em interface
  Widget _buildUI() {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ListTile(
          onTap: () {
            _launchUrl(Uri.parse(article.url ?? ""));
          },
          leading: Image.network(
            'assets/placeholder.png',
            height: 250,
            width: 100,
            fit: BoxFit.cover,
          ),
          title: Text(article.title ?? ""),
          subtitle: Text(article.publishedAt ?? ""),
        );
      },
    );
  }
}
