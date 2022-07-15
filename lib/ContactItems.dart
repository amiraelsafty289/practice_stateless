import 'package:flutter/material.dart';

class ContactItems extends StatefulWidget {
  String name;
  String phoneNumber;
  bool visible ;
  Function onDeletePressed ;
  ContactItems({this.name, this.phoneNumber , this.visible , this.onDeletePressed});
  @override
  State<StatefulWidget> createState() {
    return ContactItemsState();
  }
}

class ContactItemsState extends State<ContactItems> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Expanded(
          child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Name: ${widget.name}',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                        ),
                      ),
                      Text(
                        'Phone: ${widget.phoneNumber}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            ),
                      ),


                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red,
                  ),
                  child: TextButton(
                    onPressed: (){
                      widget.onDeletePressed();
                    },
                    child: Text(
                      'Delete',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18),
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
