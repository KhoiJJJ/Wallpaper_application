import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/add_wallpaper_provider.dart';
import '../../../Utils/pick_file.dart';
import '../../../Widgets/custom.button.dart';
import '../../../Widgets/show_alert.dart';

class AddWallPaperPage extends StatefulWidget {
  const AddWallPaperPage({super.key});

  @override
  State<AddWallPaperPage> createState() => _AddWallPaperPageState();
}

class _AddWallPaperPageState extends State<AddWallPaperPage> {
  TextEditingController controller = TextEditingController();

  String image='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add New Wallpaper')),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                      label: Text('Enter Price (Optional)'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                       pickImage().then((value) {
                          setState(() {
                            image = value;
                          });
                        });
                    },
                    
                    child: const SizedBox(
                      height: 50,
                      width: 50,
                      child: Icon(Icons.camera),
                    ),
                  ),
                   if (image != '') Image.file(File(image)),
                  Consumer<UploadWallPaperProvider>(
                    builder: (context, add,child) {
                      WidgetsBinding.instance!.addPostFrameCallback((_) { 
                        if(add.message != ''){
                          showAlert(context, add.message);
                          add.clear();
                                                  }
                      }); 
                      return customButton(
                          text: "Upload",
                          onTap:add.status==true? null: () {
                            final uid = FirebaseAuth.instance.currentUser!.uid;

                            if(image != ''){
                               add.addWallPaper(
                                    wallPaperImage: File(image),
                                    uid: uid,
                                    price: controller.text,
                               );
                            }else{
                              showAlert(context, "Upload ảnh");
                            }
                          },
                          textColor: Colors.white,
                          bgColor:add.status==true? Colors.grey: Colors.blue,
                      );
                    }
                  )    
                ]),
              ),
            )
          ],
        ));
  }
}
