import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _usuarioController = new TextEditingController();
  final TextEditingController _senhaController = new TextEditingController();
  String _boasVindas = "";

  void _loginSucces() {
    setState(() {
      if (_usuarioController.text.isNotEmpty &&
          _senhaController.text.isNotEmpty) {
        debugPrint(_senhaController.text);

        _boasVindas = "Bem vindo " + _usuarioController.text;
      }else{
       _boasVindas = "Preencha os dados";      }
    });
  }

  void _cancelLogin() {
    _usuarioController.clear();
    _senhaController.clear();

    setState(() {
      _boasVindas = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.amber,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/face.png", width: 90.0, height: 90.0),
            ),
            Container(
              width: double.infinity,
              color: Colors.white70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _usuarioController,
                      decoration: InputDecoration(
                        hintText: "Nome",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.5)),
                        icon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _senhaController,
                      decoration: InputDecoration(
                        hintText: "Senha",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.5)),
                        icon: Icon(Icons.vpn_key),
                      ),
                      obscureText: true,
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          //margin: const EdgeInsets.only(left: 38.0),
                          child: RaisedButton(
                            onPressed: _loginSucces,
                            color: Colors.deepOrange,
                            child: Text("Criar Conta"),
                          ),
                        ),
                        Container(
                          //margin: const EdgeInsets.only(left: 92.0),
                          child: RaisedButton(
                            onPressed: _cancelLogin,
                            color: Colors.deepOrange,
                            child: Text("Cancelar"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("$_boasVindas",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19.6,
                        fontWeight: FontWeight.w500
                    ),)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
