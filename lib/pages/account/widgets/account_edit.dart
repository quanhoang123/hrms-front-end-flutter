

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:html' as html;

import 'package:flutter_web_dashboard/api/callapi.dart';
import 'package:flutter_web_dashboard/models/Account.dart';
import 'package:flutter_web_dashboard/pages/account/accounts.dart';
import 'package:flutter_web_dashboard/pages/account/network/account_service.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';


import 'package:path/path.dart' as path;
import 'package:mime_type/mime_type.dart';
import 'package:image_picker_web/image_picker_web.dart';

class EditAccount extends StatefulWidget {
  Account account;
  EditAccount({this.account});
  @override
  _EditAccountState createState() => _EditAccountState(this.account);
}

class _EditAccountState extends State<EditAccount> {
  final Account account;
  var avatar;
  _EditAccountState(this.account);

  TextEditingController cname;
  TextEditingController cemail;
  TextEditingController cpassword;
  TextEditingController crole;
  bool cactive = false;
  String cavatar;


  void editData() async {
    var data = new Map<String, dynamic>();
    data['name']= cname.text;
    data['email']= cemail.text;
    data['password']= cpassword.text;
    data['avatar']= this.avatar;
    data['active']= this.cactive;
    
    await CallApi().postData(data, 'edit-account/${account.id}');
    Get.offAllNamed(accountsPageRoute);

  }

  String _selectRoleId;
  //get Role
  AccountRole _role;
  _getRoles() {
    AccountService.getRoleEdit(widget.account.id).then((response) {
      if (mounted) {
        setState(() {
          _role = response;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    cname = TextEditingController(text: widget.account.name);
    cemail = TextEditingController(text: widget.account.email);
    cpassword = TextEditingController(text: widget.account.password);
    this.cavatar = widget.account.avatar;
    this.cactive = widget.account.active;
    _getRoles();
  }


  // Demo upload image

  Future<void> _onAddPhoto() async {

    var mediaData = await ImagePickerWeb.getImageInfo;
    dynamic mimeType = mime(path.basename(mediaData.fileName));
    dynamic mediaFile =
    html.File(mediaData.data, mediaData.fileName, {'type': mimeType});

    print('imageFile ${mediaData.toString()}');

    if (mediaData != null) {
      setState(() {
        avatar = mediaData.data;
      });
    }
  }
    @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
            leading: IconButton(
            icon: BackButton(),
            onPressed: () {
              Navigator.of(context).pop;
            },
        )),
        Center(
          child: Stack(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 10))
                    ],
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          cavatar,
                        ))),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      color: Colors.green,
                    ),
                    child: GestureDetector(
                      onTap: () => _onAddPhoto(),
                      child: avatar == null
                          ? Container(
                        height: 100,
                        margin: EdgeInsets.all(5),
                        child: Center(
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      )
                          : Center(
                        child: Container(
                          width: 300,
                          height: 500,
                          child: Image.memory(avatar),
                        ),
                      ),
                      //avatar.first
                    ),
                  )),
            ],
          ),
        ),
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
            controller: cpassword,
            decoration: InputDecoration(
                hintText: "Enter password", labelText: "Enter password"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('(Để trống để dữ nguyên)'),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: SwitchListTile(
              title: Text(cactive ? "Kich Hoat" : "Vo Hieu Hoa"),
              value: cactive,
              onChanged: (bool value) {
                setState(() {
                  cactive = value;
                });
                print(cactive);
              },
              // secondary: const Icon(Icons.airplanemode_active),
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton(
            hint: Text("Select Permission"),
            items: _role.roles != null ? _role.roles.map(
                  (item) => DropdownMenuItem(
                    child: Text(item.name),
                    value: item.id.toString(),
                  ),
                ).toList() : CircularProgressIndicator(),
            onChanged: (newVal) {
              setState(() {
                _selectRoleId = newVal;
              });
              print(_selectRoleId);
            },
            value: _selectRoleId,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop;
              },
              child: Text('Cancel'),
            ),
            OutlinedButton(
              onPressed: () {
                editData();
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (BuildContext context) => AccountPage()),
                );
              },
              child: Text('Save'),
            ),
          ],
        )
      ],
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
