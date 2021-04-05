import 'package:dashboard_rest/pages/category/add.dart';
import 'package:dashboard_rest/pages/category/edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:dashboard_rest/pages/config.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var myprod =[
    {
      'pro_id':'1',
      ' pro_name':'مشاوي',
      'pro_price':'1200',
      'pro_qty':'3',
      ' pro_image':'assets/category/cat1.png'
    },
    {
      'pro_id':'1',
      ' pro_name':'مشاوي',
      'pro_price':'1200',
      'pro_qty':'3',
      ' pro_image':'assets/category/cat1.png'
    },
    {
      'pro_id':'1',
      ' pro_name':'مشاوي',
      'pro_price':'1200',
      'pro_qty':'3',
      ' pro_image':'assets/category/cat1.png'
    },
    {
      'pro_id':'1',
      ' pro_name':'مشاوي',
      'pro_price':'1200',
      'pro_qty':'3',
      ' pro_image':'assets/category/cat1.png'
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:primeryColor,
        title: Text('ادارةالتصنيفات '),
        centerTitle: true,

      ),
      backgroundColor: Colors.grey[50],
      body:Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.only(top: 1.0),
          child: ListView.builder(
            itemCount: myprod.length,
            itemBuilder: (context,index){
              return SingleProduct(
                pro_id: myprod[index]['pro_id'],
                pro_name: myprod[index]['pro_name'],
                pro_image: myprod[index]['pro_image'],
                pro_qty: myprod[index]['pro_qty'],
                pro_price: myprod[index]['pro_price'],

              );
            },
          ),
        ),
      ),
      //------Start------
      bottomNavigationBar:
      Container(
        height: 50.0,
        child: Column(
          children: [
            //sure pro
            Container(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>AddCategory()));
                },
                child:
                Text('اضافه تصنيف جديد ', style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                ),),
              ),
              height: 41.0,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                  BorderRadius.circular(40.0)
              ),
            ),
          ],
        ),
      ) ,
      //------End--------
    );
  }
}
class SingleProduct extends StatelessWidget {

  final String pro_id;
  final String pro_name;
  final String pro_price;
  final String pro_qty;
  final String pro_image;
  SingleProduct({
    this.pro_id,this.pro_name,this.pro_qty,this.pro_price, this.pro_image,
  });

  @override
  Widget build(BuildContext context) {

    return
      Card(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: Icon(Icons.cancel,
                color: Colors.red,
              ),
            ),
            Container(
              child: ListTile(
                title:
                new Text( pro_name != null ? pro_name.toString() : 'مشاوي',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
                subtitle: Text( pro_price != null ? pro_price.toString() : '',),
                leading: Container(
                  width: 50.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(pro_image != null ? pro_image.toString() : 'assets/category/cat1.png',),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                trailing: Container(
                  width: 30.0,
                  child: Row(
                    children: [
                      //---Edit---
                      GestureDetector(
                        onTap: (){
                       Navigator.push(context,
                       MaterialPageRoute(
                         builder: (context)=>EditCategory()
                       ));
                        },
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: FaIcon(
                           FontAwesomeIcons.edit,
                            color:Colors.white,
                            size: 16,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5.0)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  }
}

