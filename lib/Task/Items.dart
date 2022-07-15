import 'package:flutter/material.dart';

class ContactOfItem extends StatefulWidget {
  String name;
  String phoneNumber;
  bool visible;
  ContactOfItem({this.name , this.phoneNumber , this.visible});
  @override
  State<StatefulWidget> createState() {
    return ContactOfItemState();
  }
}

class ContactOfItemState extends State<ContactOfItem> {
  ContactOfItem item1 = ContactOfItem(visible: false,);
  ContactOfItem item2 = ContactOfItem(visible: false,);
  ContactOfItem item3 = ContactOfItem(visible: false,);

  int numOfVisibleItems = 0 ;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.visible,
      child: Expanded(
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    // width: double.infinity,
                    child: Text(
                      'Name: ${widget.name}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    // width: double.infinity,
                    child: Text(
                      'Phone: ${widget.phoneNumber}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
                IconButton(
                    icon: Icon(Icons.delete,color: Colors.white,size: 30,),
                    onPressed: onDeleteItems,
                ),


            ],
          ),
        ),
      ),
    );
  }
  void onDeleteItems(){
    if(numOfVisibleItems == 0) {
      return;
    }else if(numOfVisibleItems == 1){
        item1 = ContactOfItem(visible: false,);
      }else if(numOfVisibleItems == 2){
      item2 = ContactOfItem (visible: false,);
    }else {
      item3 = ContactOfItem(visible: false,);
    }
    numOfVisibleItems -- ;
    }
  }

