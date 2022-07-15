import 'package:flutter/material.dart';
import 'package:practice_stateful_widget/ContactItems.dart';
import 'package:practice_stateful_widget/Task/Items.dart';

class Contacts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ContactsState();
  }
}

class ContactsState extends State<Contacts> {
  ContactOfItem item1 = ContactOfItem(
    visible: true,
  );
  ContactOfItem item2 = ContactOfItem(
    visible: false,
  );
  ContactOfItem item3 = ContactOfItem(
    visible: false,
  );
  int numOfVisibleItems = 0;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    String validate(){
      if(formKey.currentState.validate()){

        print('Validated');
      }else{
        return 'You Must Entered Name';
      }
      return null ;
    }
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 20, left: 5, bottom: 20, right: 5),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                validator: (value )=> validate(),
                decoration: InputDecoration(
                  hintText: 'Enter Your Name Here',
                  hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  filled: true,
                  fillColor: Colors.indigo,
                  errorStyle: TextStyle(
                    color: Color(0xFF7C130A),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.drive_file_rename_outline,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: phoneController,
                validator: (value){
                  if(value == null || value.isEmpty ){
                    return 'You Must Entered Your Phone Number';
                  }
                  return null ;
                },
                decoration: InputDecoration(
                  hintText: 'Enter Your Phone Number',
                  hintStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  errorStyle: TextStyle(
                    color: Color(0xFF7C130A),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  filled: true,
                  fillColor: Colors.indigo,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                      )),
                  suffixIcon: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.indigo,
                        ),
                        child: TextButton(
                          onPressed: onAddPressed,
                          child: Text(
                            'Add',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                      ),
                    ),
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
        ),
      ),
    );
  }

  void onAddPressed() {
    setState(() {
      if (numOfVisibleItems < 3) {
        if (numOfVisibleItems == 0) {
          item1 = ContactOfItem(
            visible: true,
            name: nameController.text,
            phoneNumber: phoneController.text,
          );
        } else if (numOfVisibleItems == 1) {
          item2 = ContactOfItem(
            visible: true,
            name: nameController.text,
            phoneNumber: phoneController.text,
          );
        } else if (numOfVisibleItems == 2) {
          item3 = ContactOfItem(
            visible: true,
            name: nameController.text,
            phoneNumber: phoneController.text,
          );
        }
        numOfVisibleItems++;
      }
    });
    nameController.clear();
    phoneController.clear();
  }

}
