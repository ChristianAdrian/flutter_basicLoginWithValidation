import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/flutter_logo.png', scale: 4.0),
              Container(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Flutter Login',
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey)),
                              labelText: 'Email'),
                          validator: Validators.compose([
                            Validators.required('email is required'),
                            Validators.email('invalid email address')
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: TextFormField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey)),
                              labelText: 'Password'),
                          validator: Validators.compose(
                              [Validators.required('password is required')]),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: FlatButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              print(email.text);
                              print(password.text);
                              print('success');
                            }
                          },
                          child: Text("Login"),
                          textColor: Colors.white,
                          color: Colors.black,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10)),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
