import 'package:flutter/material.dart';

import '../../../Widgets/custom.button.dart';

class AddWallPaperPage extends StatefulWidget {
  const AddWallPaperPage({super.key});

  @override
  State<AddWallPaperPage> createState() => _AddWallPaperPageState();
}

class _AddWallPaperPageState extends State<AddWallPaperPage> {
  TextEditingController controller = TextEditingController();
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
                    onTap: () {},
                    child: const SizedBox(
                      height: 50,
                      width: 50,
                      child: Icon(Icons.camera),
                    ),
                  ),
                  customButton(
                      text: "Upload",
                      onTap: () {},
                      textColor: Colors.white,
                      bgColor: Colors.blue,
                  )    
                ]),
              ),
            )
          ],
        ));
  }
}
