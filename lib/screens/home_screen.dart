import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:project4/service/home_screen_service.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Api Integration")),
      ),
      body: FutureBuilder(
          future: getApi(),
          builder: (context,snapshot) {
            if (snapshot.connectionState== ConnectionState.waiting) {
              return Text("Loading");
          
            } else {
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Api(title: 'Email', value:data[index]['name'].toString()),
                         Api(title: 'Address', value:data[index]['address']['street'].toString()),                  
                        //  Api(title: 'Geo', value: snapshot.data![index].address!.geo!.lat.toString()),

                          
                          ],
                          
                      ),
                    );
                  });
            }
          }),
    );
  }
}

class Api extends StatelessWidget {
  String title;
  String value;
 Api({ Key? key ,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(value),

      ],
    );
  }
}