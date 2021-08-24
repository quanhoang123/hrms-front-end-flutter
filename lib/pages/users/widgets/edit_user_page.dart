import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/models/Account.dart';

class EditAccount extends StatefulWidget{
  Account user;
  EditAccount({this.user});
  @override
  _EditAccountState createState() => _EditAccountState(this.user);
}

class _EditAccountState extends State<EditAccount>{
  final Account user;
  _EditAccountState(this.user);
  // final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController cname ;
  TextEditingController cemail ;
  TextEditingController cavatar;
  TextEditingController cactive;
  TextEditingController cpassword;

  @override
  void initState(){
    super.initState();
    cemail =TextEditingController(text: widget.user.email);
    cname=TextEditingController(text: widget.user.name);
  }
  //Start Edit role form



  // void _ModelEditRole(context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           scrollable: true,
  //           title: Text('Add Role User'),
  //           content: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Form(
  //               child: Column(
  //                 children: <Widget>[
  //                   TextFormField(
  //                     controller: cname,
  //                     decoration: InputDecoration(
  //                       labelText: 'Name',
  //                       icon: Icon(Icons.person),
  //                     ),
  //                   ),
  //                   TextFormField(
  //                     controller: cemail,
  //                     decoration: InputDecoration(
  //                       labelText: 'Display Name',
  //                       icon: Icon(Icons.email),
  //                     ),
  //                   ),
  //                   TextFormField(
  //                     controller: cactive,
  //                     decoration: InputDecoration(
  //                       labelText: 'Description',
  //                       icon: Icon(Icons.message),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           actions: [
  //             ElevatedButton(
  //                 child: Text("Submit"),
  //                 onPressed: () {
  //                   // addData();
  //                 })
  //           ],
  //         );
  //       });
  // }


  //End Edit role Form
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Grouping and Delegating'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Card(
            elevation: 4.0,
            color: Colors.blue[700],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${user.id}",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${user.name}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        "${user.email}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      )],
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Date of Birth: ",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "${user.active}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}