import 'package:flutter/material.dart';
import '../../services/inventory_service.dart';


class InventoryScreen extends StatefulWidget {

  const InventoryScreen({super.key});


  @override
  State<InventoryScreen> createState() => _InventoryScreenState();

}



class _InventoryScreenState extends State<InventoryScreen> {


  final service = InventoryService();



  @override
  Widget build(BuildContext context) {


    final items = service.getItems();



    return Scaffold(


      appBar: AppBar(

        title: const Text(
          "Food Inventory",
        ),

      ),




      body: Padding(

        padding: const EdgeInsets.all(16),



        child: Column(


          crossAxisAlignment: CrossAxisAlignment.start,



          children: [



            // HEADER CARD


            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(20),



              decoration: BoxDecoration(

                gradient: const LinearGradient(

                  colors: [

                    Color(0xff1565C0),

                    Color(0xff42A5F5),

                  ],

                ),

                borderRadius: BorderRadius.circular(24),

              ),



              child: Column(


                crossAxisAlignment: CrossAxisAlignment.start,



                children: [


                  const Text(

                    "📦 Kitchen Stock",

                    style: TextStyle(

                      color: Colors.white,

                      fontSize:24,

                      fontWeight:FontWeight.bold,

                    ),

                  ),



                  const SizedBox(height:8),



                  Text(

                    "${items.length} items available",

                    style: const TextStyle(

                      color:Colors.white70,

                      fontSize:15,

                    ),

                  ),



                ],


              ),

            ),




            const SizedBox(height:25),




            const Text(

              "Available Items",

              style:TextStyle(

                fontSize:22,

                fontWeight:FontWeight.bold,

              ),

            ),




            const SizedBox(height:12),





            Expanded(


              child: ListView.builder(


                itemCount: items.length,



                itemBuilder:(context,index){



                  final item = items[index];



                  bool lowStock = item.quantity < 20;



                  return Container(


                    margin: const EdgeInsets.only(bottom:14),



                    padding: const EdgeInsets.all(16),



                    decoration: BoxDecoration(


                      color:Colors.white,


                      borderRadius:BorderRadius.circular(22),



                      boxShadow:[


                        BoxShadow(

                          color:Colors.black.withOpacity(.06),

                          blurRadius:12,

                          offset:const Offset(0,5),

                        )


                      ],



                    ),




                    child: Row(


                      children:[



                        Container(

                          height:55,

                          width:55,

                          decoration:BoxDecoration(


                            color: lowStock

                                ? Colors.red.shade50

                                : Colors.green.shade50,


                            borderRadius:

                            BorderRadius.circular(18),


                          ),


                          child:Icon(

                            Icons.inventory_2,

                            color: lowStock

                                ? Colors.red

                                : Colors.green,

                          ),

                        ),




                        const SizedBox(width:15),




                        Expanded(


                          child:Column(


                            crossAxisAlignment:

                            CrossAxisAlignment.start,



                            children:[



                              Text(

                                item.name,

                                style:const TextStyle(

                                  fontSize:17,

                                  fontWeight:FontWeight.bold,

                                ),

                              ),



                              const SizedBox(height:5),




                              Text(

                                "${item.quantity} ${item.unit}",

                                style:TextStyle(

                                  color:Colors.grey.shade600,

                                ),

                              ),




                              if(lowStock)

                                const Text(

                                  "⚠ Low Stock",

                                  style:TextStyle(

                                    color:Colors.red,

                                    fontWeight:FontWeight.w600,

                                  ),

                                )



                            ],


                          ),



                        ),





                        IconButton(

                          onPressed:(){

                            setState((){

                              service.useStock(index,5);

                            });

                          },

                          icon:const CircleAvatar(

                            backgroundColor:Colors.redAccent,

                            child:Icon(

                              Icons.remove,

                              color:Colors.white,

                            ),

                          ),

                        ),





                        IconButton(

                          onPressed:(){

                            setState((){

                              service.addStock(index,5);

                            });

                          },

                          icon:const CircleAvatar(

                            backgroundColor:Colors.green,

                            child:Icon(

                              Icons.add,

                              color:Colors.white,

                            ),

                          ),

                        ),



                      ],


                    ),


                  );

                },


              ),

            )



          ],


        ),


      ),


    );

  }

}