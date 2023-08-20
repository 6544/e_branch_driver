
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../../Components/Components.dart';
import '../../../Helpers/Navigation.dart';
import '../../../Providers/Home/HomeProvider.dart';
import '../../../Providers/Home/HomeStates.dart';
import '../OrderDetailsScreens/OrderDetailsScreen.dart';
class DeliverdOrdersPage extends StatefulWidget {
  const DeliverdOrdersPage({Key? key}) : super(key: key);

  @override
  _DeliverdOrdersPageState createState() => _DeliverdOrdersPageState();
}

class _DeliverdOrdersPageState extends State<DeliverdOrdersPage> {
  late HomeProvider provider;
  double? distanceMeVendor , dicsanceVendorDriver;

  @override
  Widget build(BuildContext context) {
    return /*ChangeNotifierProvider(
      create: (BuildContext context) => HomeProvider()..getOrders("receved"),
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
            if(state == OrdersOnProccessState.LOADED && provider.recevedOrderModel!.data!.isEmpty){
              return Center(child: CustomText(text: "لا يوجد طلبات", fontSize: 16));
            }
            return ListView.separated(
                itemBuilder: (context,index){
                  return OrderCard(onTap: (){
                    Navigation.mainNavigator(context,  OrderDetailsScreen(order: provider.recevedOrderModel!.data![index],));
                  },deliveryPrice: provider.recevedOrderModel!.data![index].deliveryPrice.toString(),status: "receved",vendorName: provider.recevedOrderModel!.data![index].products![0].user!.name!, price: provider.recevedOrderModel!.data![index].price.toString(), orderId: provider.recevedOrderModel!.data![index].id.toString(),
                  );
                },
                separatorBuilder: (context,index){
                  return const SizedBox(height: 10,);
                },
                itemCount: provider.recevedOrderModel!.data!.length
            );
          }
      ),
    );*/
      StreamBuilder(
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
            return snapshot.data!.docs.length==0?Center(child: CustomText(text: "لا يوجد طلبات منتهية", fontSize: 18,)):
            ListView.separated(
                itemBuilder: (context,index){
                  return  OrderCard(onTap: (){
                    Navigation.mainNavigator(context,  OrderDetailsScreen(order: snapshot.data!.docs[index].data()));

                    // Navigation.mainNavigator(context,  OrderDetailsScreen(order: provider.onlineOrderModel!.data![index]));
                  },deliveryPrice: snapshot.data!.docs[index]["deliveryprice"],status: "receved",vendorName: snapshot.data!.docs[index]["vendorName"],/*distance1: Geolocator.distanceBetween(position!.latitude, position!.longitude,  double.parse("2"*//*provider.onlineOrderModel!.data![index].products![0].user!.lat.toString()*//*), double.parse(1*//*provider.onlineOrderModel!.data![index].products![0].user!.lang*//*.toString())),*/
                    /*distance2: Geolocator.distanceBetween(position!.latitude, position!.longitude,  double.parse(*//*provider.onlineOrderModel!.data![index].lat.toString()*//*"2"), double.parse("3"*//*provider.onlineOrderModel!.data![index].lang.toString()*//*))*/ price: snapshot.data!.docs[index]["price"], orderId: snapshot.data!.docs[index]["id"],
                  );
                },
                separatorBuilder: (context,index){
                  return const SizedBox(height: 10,);
                },
                itemCount:snapshot.data!.docs.length
            );

          });  }
}
