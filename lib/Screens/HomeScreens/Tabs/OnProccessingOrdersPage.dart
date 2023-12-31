
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../../Components/Components.dart';
import '../../../Helpers/Navigation.dart';
import '../../../Providers/Home/HomeProvider.dart';
import '../../../Providers/Home/HomeStates.dart';
import '../OrderDetailsScreens/OrderDetailsScreen.dart';
class OnProccessingOrdersPage extends StatefulWidget {
  const OnProccessingOrdersPage({Key? key}) : super(key: key);

  @override
  _OnProccessingOrdersPageState createState() => _OnProccessingOrdersPageState();
}

class _OnProccessingOrdersPageState extends State<OnProccessingOrdersPage> {
  late HomeProvider provider;
  double? distanceMeVendor , dicsanceVendorDriver;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeProvider>().getOrders("onproccess");
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
          return snapshot.data!.docs.length==0?Center(child: CustomText(text: "لا يوجد طلبات قيد التنفيذ", fontSize: 18,)):
          ListView.separated(
              itemBuilder: (context,index){
                return  OrderCard(onTap: (){
                  Navigation.mainNavigator(context,  OrderDetailsScreen(order: snapshot.data!.docs[index].data()));

                  // Navigation.mainNavigator(context,  OrderDetailsScreen(order: provider.onlineOrderModel!.data![index]));
                },deliveryPrice: snapshot.data!.docs[index]["deliveryprice"],status: "onproccess",vendorName: snapshot.data!.docs[index]["vendorName"],/*distance1: Geolocator.distanceBetween(position!.latitude, position!.longitude,  double.parse("2"*//*provider.onlineOrderModel!.data![index].products![0].user!.lat.toString()*//*), double.parse(1*//*provider.onlineOrderModel!.data![index].products![0].user!.lang*//*.toString())),*/
                  /*distance2: Geolocator.distanceBetween(position!.latitude, position!.longitude,  double.parse(*//*provider.onlineOrderModel!.data![index].lat.toString()*//*"2"), double.parse("3"*//*provider.onlineOrderModel!.data![index].lang.toString()*//*))*/ price: snapshot.data!.docs[index]["price"], orderId: snapshot.data!.docs[index]["id"],
                );
              },
              separatorBuilder: (context,index){
                return const SizedBox(height: 10,);
              },
              itemCount:snapshot.data!.docs.length
          );

        });
    /*Consumer<HomeProvider>(
        builder: (context, provider,child) {
          if(HomeStates.ordersOnProccessState == OrdersOnProccessState.LOADING && context.read<HomeProvider>().onproccessOrderModel==null){
            return const Center(child:  CircularProgressIndicator());
          }
          if(HomeStates.ordersOnProccessState == OrdersOnProccessState.ERROR){
            return Center(child: CustomText(text: "حدث خطأ", fontSize: 16));
          }
          if(HomeStates.ordersOnProccessState == OrdersOnProccessState.LOADED && provider.onproccessOrderModel!.data!.isEmpty){
            return Center(child: CustomText(text: "لا يوجد طلبات", fontSize: 16));
          }
          return ListView.separated(
              itemBuilder: (context,index){
                return OrderCard(onTap: (){
                  Navigation.mainNavigator(context,  OrderDetailsScreen(order: provider.onproccessOrderModel!.data![index],));
                },status: "onproccess",vendorName: provider.onproccessOrderModel!.data![index].products![0].user!.name!, price: provider.onproccessOrderModel!.data![index].price.toString(), orderId: provider.onproccessOrderModel!.data![index].id.toString(), deliveryPrice: provider.onproccessOrderModel!.data![index].deliveryPrice.toString(),
                );
              },
              separatorBuilder: (context,index){
                return const SizedBox(height: 10,);
              },
              itemCount: provider.onproccessOrderModel!.data!.length
          );
        }
    );*/
  }
}
