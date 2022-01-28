import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ContactItem.dart';

class ContactScreen extends StatefulWidget {
  static const routName = 'contact_screen';

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  int numOfVisisblItems = 0;
  ContactItems item1 = ContactItems();
  ContactItems item2 = ContactItems();
  ContactItems item3 = ContactItems();
  TextEditingController nameContrller = TextEditingController();
  TextEditingController phoneContrller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          'contact Screen',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        toolbarHeight: 70,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: ListView(
          children: [
            TextField(
              controller: nameContrller,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                suffixIcon: Icon(
                  Icons.drive_file_rename_outline,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: phoneContrller,
              decoration: InputDecoration(
                hintText: 'Enter your phone',
                hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                suffixIcon: Icon(
                  Icons.call,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onAddButton,
                    child: Text(
                      'Add',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(70, 70)),
                        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            item1,
            SizedBox(
              height: 15,
            ),
            item2,
            SizedBox(
              height: 15,
            ),
            item3,
          ],
        ),
      ),
    );
  }

  void onAddButton() {
    setState(() {
      if (numOfVisisblItems < 3) {
        if (numOfVisisblItems == 0) {
          item1 = ContactItems(
            isVisibl: true,
            name: nameContrller.text,
            phone: phoneContrller.text,
            onDeletePressed: onDeletePressedByPosition,
            itemCount: 1,
          );
          numOfVisisblItems++;
        } else if (numOfVisisblItems == 1) {
          item2 = ContactItems(
              isVisibl: true,
              name: nameContrller.text,
              phone: phoneContrller.text,
              onDeletePressed: onDeletePressedByPosition,
              itemCount: 2);
          numOfVisisblItems++;
        } else if (numOfVisisblItems == 2) {
          item3 = ContactItems(
              isVisibl: true,
              name: nameContrller.text,
              phone: phoneContrller.text,
              onDeletePressed: onDeletePressedByPosition,
              itemCount: 3);
          numOfVisisblItems++;
        }
      }
    });
  }

  void onDeletePressed() {
    if (numOfVisisblItems == 3) {
      item1 = ContactItems();
      numOfVisisblItems--;
    } else if (numOfVisisblItems == 2) {
      item2 = ContactItems();
      numOfVisisblItems--;
    } else if (numOfVisisblItems == 1) {
      item3 = ContactItems();
      numOfVisisblItems--;
    }
    setState(() {});
  }

  void onDeletePressedByPosition(int itemCount) {
    if (itemCount == 1)
      item1 = ContactItems(
        isVisibl: false,
      );
    else if (itemCount == 2)
      item2 = ContactItems(
        isVisibl: false,
      );
    else if (itemCount == 3)
      item3 = ContactItems(
        isVisibl: false,
      );
  }
}
