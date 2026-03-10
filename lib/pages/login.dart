import 'package:flutter/material.dart';
import 'package:latihan_kuiz/pages/home.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  LoginPage({super.key});

  //fungsi
  void _loginCon(BuildContext context) {
    if(_usernameCon.text.isEmpty || _passwordCon.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Masukkan Username atau Password",
            style: TextStyle(
              color: Colors.black
          )),
          backgroundColor: const Color.fromARGB(255, 255, 247, 0),
        ),
      );
    }
    else if (_usernameCon.text.trim() == "Alfin" && _passwordCon.text.trim() == "Alfin123") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Username atau Password salah"),
          backgroundColor: Colors.red,
        ),    
      );
    }
  }


  //ui
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "KANTIN VETERAN",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 3, 95, 6),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //atas card login
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),

              //===================
              SizedBox(
                width: MediaQuery.of(context).size.width,
                //-- bagian login card --
                child: Card(
                  color: const Color.fromARGB(255, 123, 152, 82),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        //-- gambar --
                        
                        Image.asset('assets/image/lambang.png'),
                        
                        
                        //-- username --
                        TextField(
                          controller: _usernameCon,
                          decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 250, 243, 243),
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 167, 189, 136),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                              )
                          ),
                        ),

                        const SizedBox(height: 20),

                        //-- password --
                        TextField(
                          controller: _passwordCon,
                          obscureText: true,
                          //style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: const Color.fromARGB(255, 250, 243, 243),
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 167, 189, 136),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40)
                              )
                          ),
                        ),

                        const SizedBox(height: 24),
                        // login button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 88, 188, 7)),
                              ),
                              onPressed: (){
                                _loginCon(context);
                              },
                              child: const Text('Login')
                          ),
                        ),
                        const SizedBox(height: 24),
                        // // -- button --
                        // TextButton(
                        //     onPressed: () {},
                        //     child: const Text('Forgot password?')
                        // )
                      ],
                    ),
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
