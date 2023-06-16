import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  Future <dynamic> getdata() async{
    var response = await get(
        Uri.parse("http://luckyapi.qizo.in/api/mcompanyprofiles"));
    if(response.statusCode==200){
      print('success');
      // var data=jsonDecode(response.body);
      // var list1=
      return jsonDecode(response.body);
    }
    // if (jsonDecode(response.body)[0]['result'] == 'success') {
    //
    //   return jsonDecode(response.body);
    // }
    else {
      Text('No Data');
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:Container(
            height: double.infinity,
            child: FutureBuilder(
              future: getdata(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
              {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                    itemBuilder: (context,index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Profile ID ',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                              Text('  ${snapshot.data[index]['companyProfileId']}',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Profile Name ',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                              Text('  ${snapshot.data[index]['companyProfileName']}',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Shor Name ',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                              Text('  ${snapshot.data[index]['companyProfileShortName']}',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Email Name ',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                              Text('  ${snapshot.data[index]['companyProfileMailingName']}',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('place ',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                              Text('  ${snapshot.data[index]['companyProfileAddress1']}',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
                            ],
                          ),



                        ],
                      ),
                    ),
                  );
                });

              },

            )
          )
          // Container(
          //   height: double.infinity,
          //   child: ListView.builder(
          //     itemCount: 3,
          //       itemBuilder: (context,index){
          //         return Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Container(
          //             height: 100,
          //             child: Row(
          //               children: [
          //                 Text('user',style: TextStyle(fontSize: 30),),
          //                 SizedBox(width: 20,),
          //                 Text('password',style: TextStyle(fontSize: 30),),
          //               ],
          //             ),
          //           ),
          //         );
          //       }),
          // )
        ),
    );
  }
}
