import 'package:flutter/material.dart';
import 'package:practice_stateful_widget/ContactItems.dart';

class MyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyScreenState();
  }
}

class MyScreenState extends State<MyScreen> {
  ContactItems item1 = ContactItems(
    visible: false,
  );
  ContactItems item2 = ContactItems(
    visible: false,
  );
  ContactItems item3 = ContactItems(
    visible: false,
  );
  int numOfVisibleItems = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 5, bottom: 20, right: 5),

      child: ListView(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Enter Your Name Here',
              hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.blue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
              ),
              suffixIcon: Icon(
                Icons.drive_file_rename_outline,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: phoneController,
            decoration: InputDecoration(
              hintText: 'Enter Your Phone Number',
              hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  )),
              suffixIcon: Icon(
                Icons.phone,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue,
                    ),
                    child: TextButton(
                      onPressed: onAddPressed,
                      child: Text(
                        'Add',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
                // Expanded(
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(30),
                //       color: Colors.red,
                //     ),
                //     child: TextButton(
                //       onPressed: onDeletePressed,
                //       child: Text(
                //         'Delete',
                //         style: TextStyle(
                //             color: Colors.black,
                //             fontSize: 18),
                //       ),
                //     ),
                //   ),
                // ),


              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [item1],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              item2,
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [item3],
          ),
        ],
      ),
    );
  }

  void onAddPressed() {
    setState(() {
      if (numOfVisibleItems < 3) {
        if (numOfVisibleItems == 0) {
          item1 = ContactItems(
            visible: true,
            name: nameController.text,
            phoneNumber: phoneController.text,
            onDeletePressed: ()=>
              onDeletePressedByPosition(1)
            ,
          );
        } else if (numOfVisibleItems == 1) {
          item2 = ContactItems(
            visible: true,
            name: nameController.text,
            phoneNumber: phoneController.text,
            onDeletePressed: ()=>{
              onDeletePressedByPosition(2)
            },
          );
        } else if (numOfVisibleItems == 2) {
          item3 = ContactItems(
            visible: true,
            name: nameController.text,
            phoneNumber: phoneController.text,
            onDeletePressed: ()=>{
              onDeletePressedByPosition(3)
            },
          );
        }
        numOfVisibleItems++;
      }
    });
    nameController.clear();
    phoneController.clear();
  }

void onDeletePressedByPosition(int position){
   setState(() {
     if(numOfVisibleItems == 0) {

     }else if(position == 1){
       item1 = ContactItems(visible: false,);
       numOfVisibleItems--;
     }else if(position == 2){
       item2 = ContactItems(visible: false,);
       numOfVisibleItems--;
     }else {
       item3 = ContactItems(visible: false,);
       numOfVisibleItems--;

     }
   });
}


}
