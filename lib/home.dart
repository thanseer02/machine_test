import 'package:flutter/material.dart';

import 'display.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(child: Text('Login',style: TextStyle(fontSize: 25),)),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'password',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>view()));
                  }, child: Text('OK')),
                  SizedBox(width: 10,),
                  OutlinedButton(onPressed: (){}, child: Text('cancel')),

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
