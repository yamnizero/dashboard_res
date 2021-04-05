import 'package:dashboard_rest/pages/config.dart';
import 'package:flutter/material.dart';

import 'package:dashboard_rest/pages/config.dart';

class EditUsers extends StatefulWidget {
  @override
  _EditUsersState createState() => _EditUsersState();
}

class _EditUsersState extends State<EditUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor:primeryColor,
          title: Text('تعديل تصنيف '),
          centerTitle: true,

        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.only(top: 30.0),
              child:Column(
                children: [
                  Expanded(
                      child:Form(
                        child: ListView(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.only(left: 20.0,right: 20.0),
                              margin: EdgeInsets.only(bottom:10.0 ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText:
                                    'اسم التصنيف',
                                    border: InputBorder.none
                                ),
                                validator: (String value){
                                  if(value.isEmpty || value.length < 1){
                                    return "الرجاء ادخال الاسم الكامل";
                                  }
                                } ,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.only(left: 20.0,right: 20.0),
                              margin: EdgeInsets.only(bottom:10.0 ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: ' الاسم بالانكليزي ',
                                    border: InputBorder.none
                                ),
                                validator: (String value){
                                  if(
                                  value.isEmpty || value.indexOf(".") == -1 ||
                                      value.isEmpty || value.indexOf("@") == -1
                                  )
                                  {
                                    return "الرجاء ادخال البريد الالكتروني";
                                  }
                                } ,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.only(left: 20.0,right: 20.0),
                              margin: EdgeInsets.only(bottom:10.0 ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: 'الترتيب',
                                    border: InputBorder.none
                                ),
                                validator: (String value){
                                  if(value.isEmpty || value.length < 5){
                                    return "الرجاء ادخال رقم الهاتف";
                                  }

                                } ,
                              ),
                            ),
                            MaterialButton(
                              onPressed: (){},
                              child: Container(

                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(bottom:10.0,top: 20.0 ),
                                padding: EdgeInsets.all( 2.0),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(25.0)
                                ),
                                child: Text('حفظ',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.white
                                  ),),
                              ),

                            ),

                          ],
                        ),
                      )
                  ),

                ],
              )
          ),
        )
    );
  }
}
