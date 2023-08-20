
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Components/Components.dart';
import '../../../Helpers/Navigation.dart';
import '../../../Providers/Home/HomeProvider.dart';
import '../../../Providers/Home/HomeStates.dart';
import '../OrderDetailsScreens/OrderDetailsScreen.dart';
class ProblemOrdersPage extends StatefulWidget {
  const ProblemOrdersPage({Key? key}) : super(key: key);

  @override
  _ProblemOrdersPageState createState() => _ProblemOrdersPageState();
}

class _ProblemOrdersPageState extends State<ProblemOrdersPage> {
  late HomeProvider provider;
  double? distanceMeVendor , dicsanceVendorDriver;

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
          return snapshot.data!.docs.length==0?Center(child: CustomText(text: "لا يوجد طلبات متعثرة", fontSize: 18,)):
          ListView.separated(
              itemBuilder: (context,index){
                return  OrderCard(onTap: (){
                  Navigation.mainNavigator(context,  OrderDetailsScreen(order: snapshot.data!.docs[index].data()));

                  // Navigation.mainNavigator(context,  OrderDetailsScreen(order: provider.onlineOrderModel!.data![index]));
                },deliveryPrice: snapshot.data!.docs[index]["deliveryprice"],status: "back",vendorName: snapshot.data!.docs[index]["vendorName"],/*distance1: Geolocator.distanceBetween(position!.latitude, position!.longitude,  double.parse("2"*//*provider.onlineOrderModel!.data![index].products![0].user!.lat.toString()*//*), double.parse(1*//*provider.onlineOrderModel!.data![index].products![0].user!.lang*//*.toString())),*/
                  /*distance2: Geolocator.distanceBetween(position!.latitude, position!.longitude,  double.parse(*//*provider.onlineOrderModel!.data![index].lat.toString()*//*"2"), double.parse("3"*//*provider.onlineOrderModel!.data![index].lang.toString()*//*))*/ price: snapshot.data!.docs[index]["price"], orderId: snapshot.data!.docs[index]["id"],
                );
              },
              separatorBuilder: (context,index){
                return const SizedBox(height: 10,);
              },
              itemCount:snapshot.data!.docs.length
          );

        });/*ChangeNotifierProvider(
      create: (BuildContext context) => HomeProvider()..getOrders("debug"),
      child: Selector<HomeProvider,OrdersOnProccessState>(
          selector: (context,homeProvider){
            provider = homeProvider;
            return HomeStates.ordersOnProccessState;
          },
          builder: (context, state,child) {
            if(state == OrdersOnProccessState.LOADING){
              return const Center(child:  CircularProgressIndicator());
            }
            if(state == OrdersOnProccessState.ERROR){
              return Center(child: CustomText(text: "حدث خطأ", fontSize: 16));
            }
            if(state == OrdersOnProccessState.LOADED && provider.debugOrderModel!.data!.isEmpty){
              return Center(child: CustomText(text: "لا يوجد طلبات", fontSize: 16));
            }
            return ListView.separated(
                itemBuilder: (context,index){
                  return OrderCard(onTap: (){
                    Navigation.mainNavigator(context,  OrderDetailsScreen(order: provider.debugOrderModel!.data![index],));
                  },deliveryPrice: provider.debugOrderModel!.data![index].deliveryPrice.toString(),status: "back",vendorName: provider.debugOrderModel!.data![index].products![0].user!.name!, price: provider.debugOrderModel!.data![index].price.toString(), orderId: provider.debugOrderModel!.data![index].id.toString(),
                  );
                },
                separatorBuilder: (context,index){
                  return const SizedBox(height: 10,);
                },
                itemCount: provider.debugOrderModel!.data!.length
            );
          }
      ),
    );*/
  }
}
