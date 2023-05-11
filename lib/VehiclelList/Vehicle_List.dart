
import 'package:flutter/material.dart';
import '../../Helper/globle style.dart';
import '../Model/MyVehicleData.dart';
import 'VehicleDummyModel.dart';
import 'my_Vehicle_view_details.dart';

class my_Vehicle_List extends StatefulWidget {
  final MyVehicleData data;
  final int index;
  my_Vehicle_List({Key? key,required this.data, required this.index}) : super(key: key);

  @override
  State<my_Vehicle_List> createState() => _my_Vehicle_ListState();
}

class _my_Vehicle_ListState extends State<my_Vehicle_List> {
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
          new my_Vehicle_DetailScreen(data: widget.data,)));

        },
        child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      "assets/images/Vagnera.png",
                      width: 120,
                      height: 150,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:   [
                        Text(widget.data.owner,
                          style: TextStyle(
                            fontSize: 20,fontWeight:FontWeight.bold,color: Colors.black
                        ),),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children:  [
                            Text(
                             widget.data.vehicleNumber,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            SizedBox(width: 10), // Add some space between the two Text widgets
                            // Text(
                            //   widget.data.ownerCount,
                            //   style: TextStyle(
                            //     fontSize: 13,
                            //     fontWeight: FontWeight.normal,
                            //     color: Colors.grey,
                            //
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.data.makerModel,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0.0),
                          child:
                          Text(
                            "PUC expiring Date: " + widget.data.pucExpiry,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
