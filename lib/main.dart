import 'dart:io';

import 'package:appcrime/Views/TelaPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'MyHttpOverrides.dart';
import 'NavBar.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MaterialApp(
    title: 'Navigation Basics',
      debugShowCheckedModeBanner: false,
    home: Telaprincipal(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Color.fromRGBO(83, 198, 108, 1),
                  Color.fromRGBO(83, 198, 108, 1),
                  Color.fromRGBO(83, 198, 108, 1)
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(duration: Duration(milliseconds: 1000), child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 80),)),
                  SizedBox(height: 10,),
                  FadeInUp(duration: Duration(milliseconds: 1300), child: Text("Bem-vindo de volta", style: TextStyle(color: Colors.white, fontSize: 30),)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 60,),
                      FadeInUp(duration: Duration(milliseconds: 1400), child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10)
                            )]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                              ),
                              child: TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Senha",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      SizedBox(height: 40,),
                      FadeInUp(duration: Duration(milliseconds: 1500), child: Text("Esqueceu a senha?", style: TextStyle(color: Colors.grey),)),
                      SizedBox(height: 40,),
                      FadeInUp(duration: Duration(milliseconds: 1600), child: MaterialButton(
                        onPressed: () {},
                        height: 50,
                        // margin: EdgeInsets.symmetric(horizontal: 50),
                        color: Color.fromRGBO(83, 198, 108, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),

                        ),
                        // decoration: BoxDecoration(
                        // ),
                        child: Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      )),
                      SizedBox(height: 50,),
                      FadeInUp(duration: Duration(milliseconds: 1700), child: Text("Não possui login?", style: TextStyle(color: Colors.grey),)),
                      SizedBox(height: 30,),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: FadeInUp(duration: Duration(milliseconds: 1800), child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Cadastro()),
                                );
                              },
                              height: 50,
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text("Cadastre-se", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              ),
                            )),
                          ),
                          SizedBox(width: 1,),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nomeController.dispose();
    senhaController.dispose();
    confirmarSenhaController.dispose();
    super.dispose();
  }

  Future<void> _cadastrar() async {
    final String apiUrl = 'https://jsonplaceholder.typicode.com/posts'; // URL da API

    // Corpo da requisição com os dados do formulário
    final Map<String, dynamic> requestBody = {
      'name': nomeController.text,
      'email': emailController.text,
      'password': senhaController.text, // Inclua a senha no corpo da requisição se necessário
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201) {
        // Sucesso na requisição, parse a resposta
        final responseData = jsonDecode(response.body);
        // Navega para HomeMap passando os dados recebidos
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeMap(
              name: responseData['name'] ?? nomeController.text,
              email: responseData['email'] ?? emailController.text,
            ),
          ),
        );
      } else {
        // Lidar com erro, exibir mensagem para o usuário
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falha ao cadastrar: ${response.reasonPhrase}')),
        );
      }
    } catch (e) {
      // Lidar com exceções, exibir mensagem para o usuário
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Color.fromRGBO(12, 149, 192, 1),
                Color.fromRGBO(12, 149, 192, 1),
                Color.fromRGBO(12, 149, 192, 1),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 80,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeInUp(duration: Duration(milliseconds: 1000), child: Text("Cadastro", style: TextStyle(color: Colors.white, fontSize: 80),)),
                    SizedBox(height: 10,),
                    FadeInUp(duration: Duration(milliseconds: 1300), child: Text("Boas vindas", style: TextStyle(color: Colors.white, fontSize: 30),)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 60,),
                      FadeInUp(duration: Duration(milliseconds: 1400), child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                              ),
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                              ),
                              child: TextField(
                                controller: nomeController,
                                decoration: InputDecoration(
                                  hintText: "Nome",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                              ),
                              child: TextField(
                                controller: senhaController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Senha",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                              ),
                              child: TextField(
                                controller: confirmarSenhaController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Confirmar senha",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      SizedBox(height: 40,),
                      FadeInUp(duration: Duration(milliseconds: 1600), child: MaterialButton(
                        onPressed: _cadastrar, // Chama a função _cadastrar
                        height: 50,
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text("Cadastrar", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      )),
                      SizedBox(height: 50,),
                      FadeInUp(duration: Duration(milliseconds: 1700), child: Text("Já possui cadastro?", style: TextStyle(color: Colors.grey),)),
                      SizedBox(height: 30,),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: FadeInUp(duration: Duration(milliseconds: 1800), child: MaterialButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              height: 50,
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                              ),
                            )),
                          ),
                          SizedBox(width: 1,),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class HomeMap extends StatelessWidget {
  final String name;
  final String email;

  const HomeMap({Key? key, required this.name, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(name: name, email: email),
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text("Home"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}


// Definição da classe APICall, que é um StatefulWidget. StatefulWidget é usado quando o estado do widget pode mudar.
class APICall extends StatefulWidget {
  // Construtor da classe APICall. O parâmetro key é opcional e é passado para a classe pai.
  const APICall({Key? key}) : super(key: key);

  @override
  _APICallState createState() => _APICallState(); // Cria o estado para esse widget.
}

// A classe _APICallState gerencia o estado do widget APICall.
class _APICallState extends State<APICall> {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts'; // URL da API para a qual os dados serão enviados.
  final TextEditingController nameController = TextEditingController(); // Controlador para o campo de texto do nome.
  final TextEditingController emailController = TextEditingController(); // Controlador para o campo de texto do e-mail.
  String result = ''; // Variável para armazenar o resultado da chamada à API.

  @override
  void dispose() {
    // Método chamado quando o widget é removido da árvore de widgets.
    nameController.dispose(); // Libera recursos usados pelo controlador de nome.
    emailController.dispose(); // Libera recursos usados pelo controlador de e-mail.
    super.dispose(); // Chama o método dispose da superclasse.
  }

  // Método assíncrono para enviar dados para a API.
  Future<void> _postData() async {
    try {
      // Envia uma requisição POST para a API.
      final response = await http.post(
        Uri.parse(apiUrl), // Converte a URL da API para um objeto Uri.
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8', // Define o tipo de conteúdo como JSON.
        },
        body: jsonEncode(<String, dynamic>{
          'name': nameController.text, // Dados do nome coletados do controlador.
          'email': emailController.text, // Dados do e-mail coletados do controlador.
          // Adicione quaisquer outros dados que você deseja enviar no corpo.
        }),
      );

      // Verifica se a resposta da API tem o status code 201 (Criação bem-sucedida).
      if (response.statusCode == 201) {
        // Se o POST foi bem-sucedido, processa a resposta.
        final responseData = jsonDecode(response.body); // Decodifica o corpo da resposta como JSON.
        setState(() {
          // Atualiza o estado para exibir o resultado da API na interface do usuário.
          result =
          'ID: ${responseData['id']}\nName: ${responseData['name']}\nEmail: ${responseData['email']}';
        });
      } else {
        // Se a resposta não for bem-sucedida, lança uma exceção.
        throw Exception('Failed to post data');
      }
    } catch (e) {
      // Captura e trata qualquer exceção que ocorra durante a chamada da API.
      setState(() {
        // Atualiza o estado para exibir a mensagem de erro.
        result = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POST Request Example'), // Título da AppBar.
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // Espaçamento ao redor do corpo.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Alinha os widgets no centro verticalmente.
          children: [
            TextField(
              controller: nameController, // Define o controlador para o campo de texto do nome.
              decoration: InputDecoration(labelText: 'Name'), // Define o texto do rótulo.
            ),
            TextField(
              controller: emailController, // Define o controlador para o campo de texto do e-mail.
              decoration: InputDecoration(labelText: 'Email'), // Define o texto do rótulo.
            ),
            ElevatedButton(
              onPressed: _postData, // Define a função a ser chamada quando o botão for pressionado.
              child: Text('Submit'), // Texto exibido no botão.
            ),
            SizedBox(height: 20.0), // Espaçamento vertical entre o botão e o texto do resultado.
            Text(
              result, // Exibe o resultado ou mensagem de erro.
              style: TextStyle(fontSize: 16.0), // Define o tamanho da fonte para o texto do resultado.
            ),
          ],
        ),
      ),
    );
  }
}
