import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactItems extends StatelessWidget {
  bool isVisibl;
  String name;
  String phone;
  Function? onDeletePressed;
  int itemCount;

  ContactItems(
      {this.isVisibl = false,
      this.name = '',
      this.phone = '',
      this.onDeletePressed,
      this.itemCount = 0});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisibl,
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Name :Ahmed',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Phone :015',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextButton(
                onPressed: () {
                  if (onDeletePressed == null) return;
                  onDeletePressed!(itemCount);
                },
                child: Text(
                  'Delete',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
