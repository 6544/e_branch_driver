
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../Components/Components.dart';
import '../../../Helpers/HelperFunctions.dart';
import '../../../Helpers/Navigation.dart';
import '../OrderDetailsScreens/OrderDetailsScreen.dart';


class AvailableOrdersPage extends StatefulWidget {
   const AvailableOrdersPage({Key? key}) : super(key: key);

  @override
  _AvailableOrdersPageState createState() => _AvailableOrdersPageState();
}

class _AvailableOrdersPageState extends State<AvailableOrdersPage> {
  Position? position;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 0),() async {
      position = await determinePosition();
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("orders")
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          return snapshot.data!.docs.length==0?Center(child: CustomText(text: "لا يوجد طلبات متاحة", fontSize: 18,)):
          ListView.separated(
              itemBuilder: (context,index){
                return  OrderCard(onTap: (){
                  Navigation.mainNavigator(context,  OrderDetailsScreen(order: snapshot.data!.docs[index].data()));
                },deliveryPrice: snapshot.data!.docs[index]["deliveryprice"],status: "online",vendorName: snapshot.data!.docs[index]["vendorName"],distance1: Geolocator.distanceBetween(position?.latitude??1, position?.longitude??1,  double.parse("2"/*provider.onlineOrderModel!.data![index].products![0].user!.lat.toString()*/), double.parse(1/*provider.onlineOrderModel!.data![index].products![0].user!.lang*/.toString())),
                    distance2: Geolocator.distanceBetween(position?.latitude??1, position?.longitude??1,  double.parse(/*provider.onlineOrderModel!.data![index].lat.toString()*/"2"), double.parse("3"/*provider.onlineOrderModel!.data![index].lang.toString()*/)), price: snapshot.data!.docs[index]["price"], orderId: snapshot.data!.docs[index]["id"],
                );
              },
              separatorBuilder: (context,index){
                return const SizedBox(height: 10,);
              },
              itemCount:snapshot.data!.docs.length
          );

        });

  }
}
