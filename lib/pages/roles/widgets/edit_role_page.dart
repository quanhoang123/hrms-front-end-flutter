import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/api/callapi.dart';
import 'package:flutter_web_dashboard/models/Roles.dart';
import 'package:flutter_web_dashboard/models/UserPermission.dart';
import 'package:flutter_web_dashboard/pages/roles/Service/api_role.dart';
import 'package:flutter_web_dashboard/pages/roles/widgets/role_table.dart';

class DetailRoles extends StatefulWidget{
  Role role;
  DetailRoles({this.role});
  @override
  _DetailRolesState createState() => _DetailRolesState(this.role);
}

class _DetailRolesState extends State<DetailRoles>{
  final Role role;
  _DetailRolesState(this.role);
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  //switch button
  bool _lights=true;
  //Get roles and permission to edit
  UserPermission _role;

  _getRoles() {
    RolesService.getRoleEdit(widget.role.id).then((response) {
      if (mounted) {
        setState(() {
          _role = response;
        });
        print(_role.role.permissions);
      }
    });
  }

  TextEditingController cname;
  TextEditingController  cdisplayName;
  TextEditingController cdescription;

  void editData()async {
    var data = {
      'name': cname.text,
      'display_name': cdisplayName.text,
      'description': cdescription.text,
    };
    var res = await CallApi().postData(data, 'edit-role/${widget.role.id}');
  }

  @override
  void initState(){
    super.initState();
    cname=TextEditingController(text: widget.role.name);
    cdisplayName=TextEditingController(text: widget.role.displayName);
    cdescription=TextEditingController(text: widget.role.description);
    _getRoles();
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
              controller: cdisplayName,
              decoration: InputDecoration(
                  hintText: "Enter password", labelText: "Enter email"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: cdescription,
              decoration: InputDecoration(
                  hintText: "Enter password", labelText: "Enter password"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                if( cname.text.isEmpty ||
                    cdisplayName.text.isEmpty ||
                    cdescription.text.isEmpty){

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
          for(Role response_role in _role.role.permissions)
          SwitchListTile(
            title: Text(response_role.name),
            value: _lights,
            onChanged: (bool  value) {
              setState(() { _lights = value; });
              },
            secondary: const Icon(Icons.lightbulb_outline),
          )
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
        for (Role response_role in _role.permission)
          TableRow(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${response_role.id}",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${response_role.name}",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${response_role.displayName}",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Text(
                "${response_role.description}",
              ),
            ),
          ]),
      ],
    );
  }
}