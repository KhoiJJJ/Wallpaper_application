import 'package:flutter/material.dart';
import 'package:flutter_application_2/Provider/auth_provider.dart';
import 'package:flutter_application_2/Screens/main_activity.dart';
import 'package:flutter_application_2/Utils/routers.dart';

import '../../Widgets/show_alert.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    var signUpImages = ['g.png', 'f.png', 't.png'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang Đăng nhập/Đăng ký'),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20),
            //appLogo
            Container(
              height: 100,
              child: const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 150,
                  backgroundImage: AssetImage("assets/image/logo.jpg"),
                ),
              ),
            ),
            //welcome Text
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Xin chào",
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Đăng nhập vào tài khoản của bạn",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            
            PreferredSize(
               preferredSize: const Size.fromHeight(120.0),
              child: Column(
                children: [
                  TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  border: UnderlineInputBorder(),
                  labelText: 'Số điện thoại',
                ),
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.password_sharp),
                    border: UnderlineInputBorder(),
                    labelText: 'Mật khẩu',
                  ),
                ),
                ],
              ) 
            ),
           
            const SizedBox(
              height: 50,
            ),
           
            RichText(
              text: TextSpan(
                  text: "Hoặc đăng nhập bằng các hình thức sau:",
                  style: TextStyle(color: Colors.grey[500], fontSize: 16)),
            ),
            GestureDetector(
              onTap: () {
                AuthenticationProvider().signInWithGoogle().then((value) {
                  showAlert(context, "Bạn đăng nhập thành công");
                  nextPageOnly(page: const MainActivityPage(), context: context);
                }).catchError((e){
                  showAlert(context, e.toString());
                });
              },
              child: Wrap(
                children: List.generate(
                    3,
                    (index) => Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/image/${signUpImages[index]}"),
                          ),
                        )),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
           
             RichText(
                  text: TextSpan(
                      text: "Chưa có tài khoản?",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 20
                      ),
                      children:const [
                        TextSpan(
                          text: "Đăng ký",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontSize:20
                          ),
                        )]
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
