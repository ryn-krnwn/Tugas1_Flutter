import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tugas1_flutter/pages/profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final globalkey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalkey,
      body: Container(
        padding: EdgeInsets.only(top: 64, bottom: 64, left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Center(
                child: Text(
                  'EDIT PROFILE',
                  style: TextStyle(fontSize: 40, color: Colors.blueAccent),
                ),
              ),
            ),
            Container(
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your Name',
                ),
              ),
            ),
            Container(
              height: 48,
              color: Colors.blueAccent,
              child: ElevatedButton(
                child: Text(
                  'Update',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                onPressed: () {
                  if (nameController.text == '') {
                    //showToast('Please Input Your Name');
                    showSnackBar('Please Input Your Name');
                    //showAlertDialogMaterial('Please Input Your Name');
                  } else
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => profile(name: nameController.text,),
                      ),
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  showToast(Text) {
    Fluttertoast.showToast(
        msg: Text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.5),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  showSnackBar(text) {
    final snackbar = SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          print('Clicked Undo');
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  showAlertDialogMaterial(text) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('info'),
        content: text(text),
        actions: [
          FloatingActionButton(
            child: Text('No'),
            onPressed: () {
              Navigator.pop(context);
              print('Clicked');
            },
          ),
          FloatingActionButton(
            onPressed: () {
              print("Yes, Accept");
            },
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      barrierColor: Colors.black.withOpacity(0.7),
      barrierDismissible: false,
    );
  }
}
