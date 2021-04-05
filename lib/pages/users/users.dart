import 'package:dashboard_rest/component/progress.dart';
import 'package:dashboard_rest/pages/config.dart';
import 'package:dashboard_rest/pages/users/add.dart';
import 'package:dashboard_rest/pages/users/edit.dart';
import 'package:dashboard_rest/pages/users//users_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


List<SingleUser> userList = new List<SingleUser>();
class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  ScrollController myScroll;
  GlobalKey<RefreshIndicatorState> refreshKey;
  int i=0;
  bool loadingList = false;
 void getDataUser(int count) async {
   loadingList = true;
   setState(() {});
   List arr = await getData(count);
   for(int i=0 ; i<arr.length ; i++)
     {
       userList.add(
         new  SingleUser(
           use_id: arr[i]["use_id"],
           use_name: arr[i]["use_name"],
           use_mobile: arr[i]["use_mobile"],
           use_active: arr[i]["use_active"],
           use_lastdate: arr[i]["use_lastdate"],
         ));
     }
   loadingList = false;
   setState(() {});
 }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myScroll = new ScrollController();
     refreshKey =  GlobalKey<RefreshIndicatorState>();

    getDataUser(0);

    myScroll.addListener(() {
      if(myScroll.position.pixels == myScroll.position.maxScrollExtent){
        i+=10;
        getDataUser(i);
        print("scroll");
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:primeryColor,
        title: Text('ادارةالتصنيفات '),
        centerTitle: true,

      ),
      backgroundColor: Colors.grey[50],
      body:RefreshIndicator(
        onRefresh: () async
        {
           i = 0;
          userList.clear();
         await getDataUser(0);
        },
        key: refreshKey,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 1.0),
                child: ListView.builder(
                  controller: myScroll,
                  itemCount: userList.length,
                  itemBuilder: (context,index){
                    return SingleUser(
                      use_id: userList[index].use_id,
                      use_name: userList[index].use_name,
                      use_lastdate: userList[index].use_lastdate,
                      use_active: userList[index].use_active,
                      use_mobile: userList[index].use_mobile,

                    );
                  },
                ),
              ),
              Positioned(child:
                  loadingList ? circularProgress() : Text(""),
                bottom: 0,
                left: MediaQuery.of(context).size.width/2,
              )
            ],
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
                          builder: (context)=>AddUsers()));
                },
                child:
                Text('اضافه مستخدم جديد ', style: TextStyle(
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
class SingleUser extends StatelessWidget {

  final String use_id;
  final String use_name;
  final String use_mobile;
  final String use_active;
  final String use_lastdate;
  SingleUser({
    this.use_id,this.use_name,this.use_active,this.use_mobile, this.use_lastdate,
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
                new Text( use_name,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
                subtitle: Text( use_mobile),
                leading: Container(
                  width: 50.0,
                  child:Text(use_lastdate),
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
                         builder: (context)=>EditUsers()
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

