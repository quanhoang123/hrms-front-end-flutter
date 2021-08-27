import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:flutter_web_dashboard/api/callapi.dart';
import 'package:flutter_web_dashboard/models/Account.dart';
import 'package:flutter_web_dashboard/pages/account/accounts.dart';
import 'package:flutter_web_dashboard/pages/account/network/account_service.dart';

import 'package:image_picker/image_picker.dart';

class EditAccount extends StatefulWidget {
  Account account;
  EditAccount({this.account});
  @override
  _EditAccountState createState() => _EditAccountState(this.account);
}

class _EditAccountState extends State<EditAccount> {
  final Account account;
  _EditAccountState(this.account);

  TextEditingController cname;
  TextEditingController cemail;
  TextEditingController cpassword;
  TextEditingController crole;
  bool cactive = false;
  String cavatar;

  void editData() async {
    var data = {
      'name': cname.text,
      'email': cemail.text,
      'password': cpassword.text,
      'avatar': this.cavatar,
      'active': this.cactive,
    };
    var res =
        await CallApi().postData(data, 'edit-account/${widget.account.id}');
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
        print(_role.roles);
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



  //Test upload image

  Future<FilePickerResult> selectFile(bool allowMultiple) async {
    var files;
    await FilePicker.platform
        .pickFiles(
      type: FileType.custom,
      allowedExtensions: ["pdf", "doc", "docx", "png", "jpg", "xls", "xlsx", "ppt", "pptx"], ///Dinh dang file minh muon
      allowMultiple: allowMultiple,
    ).then((selectedFiles) => files = selectedFiles);
    return files;
  }

  Future<void> addFile(FilePickerResult fileResult) async {
    List<dynamic> files = [];
    for (var file in fileResult.files) {
      files.add(await dio.MultipartFile.fromFile(file.path));
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
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      tooltip: 'Edit Profile',
                      onPressed: () async  {
                          final files = await selectFile(true);
                      },
                    ),
                  )),
            ],
          ),
        ),
        // showImage(),
        // Center(
        //   child: _image == null
        //       ? new Stack(
        //     children: <Widget>[
        //       new Center(
        //         child: new CircleAvatar(
        //           radius: 80.0,
        //           backgroundColor:
        //           const Color(0xFF778899),
        //         ),
        //       ),
        //       new Center(
        //         child: Icon(
        //           Icons.perm_identity,
        //           size: 120,
        //         ),
        //       ),
        //     ],
        //   )
        //       : new CircleAvatar(
        //     radius: 60,
        //     child: ClipOval(
        //       child: Align(
        //         heightFactor: 0.8,
        //         widthFactor: 1.0,
        //         child: new Image.file(_image),
        //       ),
        //     ),
        //   ),
        // ),
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
            items: _role.roles
                .map(
                  (item) => DropdownMenuItem(
                    child: Text(item.name),
                    value: item.id.toString(),
                  ),
                )
                .toList(),
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
