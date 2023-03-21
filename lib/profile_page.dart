import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home_page.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isObscurePassword = true;
  File? file;
  ImagePicker image = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text(
          'PROFILE',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            shadows: [
              Shadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(2, 2),
              )
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
      ),

      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right:15),
        color: Colors.grey[300], // set background color
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: SizedBox(
                        width: 130.0,
                        height: 130.0,
                        child: file == null
                            ? const Icon(
                          Icons.image,
                          size: 50,
                          color: Colors.black,
                        )
                            : Image.file(
                          file!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Column(
                      children: <Widget>[
                        IconButton(
                          padding: const EdgeInsets.all(0),
                          icon: const Icon(Icons.camera),
                          color: Colors.black,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text("Please choose"),
                                content: const Text("From:"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () async {
                                      PermissionStatus cameraStatus = await Permission.camera.request();
                                      if (cameraStatus == PermissionStatus.granted) {
                                        getCam(ImageSource.camera);
                                      } else if (cameraStatus == PermissionStatus.denied) {
                                        return;
                                      }
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(14),
                                      child: const Text("Camera"),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      PermissionStatus cameraStatus = await Permission.storage.request();
                                      if (cameraStatus == PermissionStatus.granted) {
                                        getGall(ImageSource.gallery);
                                      } else if (cameraStatus == PermissionStatus.denied) {
                                        return;
                                      }
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(14),
                                      child: const Text("Gallery"),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(14),
                                      child: const Text("Cancel"),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Claudio San Juan Daruca Jr.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.grey,
                      offset: Offset(2, 2),
                    ),
                  ],
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,

                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Bachelor of Science in Information Technology',
                style: TextStyle(
                  fontSize: 18,

                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.grey,
                      offset: Offset(2, 2),
                    ),
                  ],

                  decorationThickness: 2,

                ),
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                '3rd Year Section R2 - Networking Track',
                style: TextStyle(
                  fontSize: 18,

                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.grey,
                      offset: Offset(2, 2),
                    ),
                  ],

                  decorationThickness: 2,

                ),
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'Born in January 12, 2001',
                style: TextStyle(
                  fontSize: 18,

                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.grey,
                      offset: Offset(2, 2),
                    ),
                  ],

                  decorationThickness: 2,

                ),
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'Carmen, Cagayan de Oro City',
                style: TextStyle(
                  fontSize: 18,

                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.grey,
                      offset: Offset(2, 2),
                    ),
                  ],

                  decorationThickness: 2,

                ),
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'Male',
                style: TextStyle(
                  fontSize: 18,

                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.grey,
                      offset: Offset(2, 2),
                    ),
                  ],

                  decorationThickness: 2,

                ),
              ),
            ),
            const SizedBox(height: 120),
            const Center(
              child: Text(
                'A day without coffee is a day wasted!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 4,
                      color: Colors.grey,
                      offset: Offset(2, 2),
                    ),
                  ],
                  decorationThickness: 2,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }


  getCam(ImageSource source) async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file = File(img!.path);
    });
  }

  getGall(ImageSource source) async {
    // ignore: deprecated_member_use
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file = File(img!.path);
    });
  }


}
