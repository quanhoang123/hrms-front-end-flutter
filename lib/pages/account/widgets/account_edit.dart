import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/api/callapi.dart';
import 'package:flutter_web_dashboard/models/Account.dart';

import 'package:flutter_web_dashboard/pages/roles/widgets/role_table.dart';

class EditAccount extends StatefulWidget{
  Account account;
  EditAccount({this.account});
  @override
  _EditAccountState createState() => _EditAccountState(this.account);
}

class _EditAccountState extends State<EditAccount>{
  final Account account;
  _EditAccountState(this.account);
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  //switch button
  // bool _lights=true;
  //Get roles and permission to edit


  TextEditingController cname;
  TextEditingController  cemail;
  TextEditingController cpassword;
  TextEditingController cactive;
  TextEditingController cavatar;

  void editData()async {
    var data = {
      'name': cname.text,
      'display_name': cemail.text,
      'description': cpassword.text,
    };
    var res = await CallApi().postData(data, 'edit-role/${widget.account.id}');
  }

  @override
  void initState(){
    super.initState();
    cname=TextEditingController(text: widget.account.name);
    cemail=TextEditingController(text: widget.account.email);
    cavatar=TextEditingController(text: widget.account.avatar);

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        title: Text('Detail Grouping and Delegating'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: cname,
              decoration: InputDecoration(
                  hintText: "Enter username", labelText: "Enter username"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: cemail,
              decoration: InputDecoration(
                  hintText: "Enter password", labelText: "Enter email"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: cavatar,
              decoration: InputDecoration(
                  hintText: "Enter password", labelText: "Enter password"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                if( cname.text.isEmpty ||
                    cemail.text.isEmpty ||
                    cpassword.text.isEmpty){

                }else{
                  editData();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) => RolesTable()),);
                }
              },
              child: Text("Edit"),
            ),
          ),
          // roles(),
        ],
      ),
    );
  }
  Table roles() {
    return Table(
      border: TableBorder(
        bottom: BorderSide(color: Colors.red, width: 2),
        horizontalInside: BorderSide(color: Colors.red, width: 2),
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "ID",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "NAME",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "Display Name",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Text(
              "Description",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ]),

      ],
    );
  }
}