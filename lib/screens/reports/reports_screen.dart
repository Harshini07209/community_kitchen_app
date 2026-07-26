import 'package:flutter/material.dart';
import '../../services/meal_service.dart';


class ReportsScreen extends StatelessWidget {

  const ReportsScreen({super.key});


  @override
  Widget build(BuildContext context) {


    final service = MealService();



    return FutureBuilder(

      future: service.getMeals(),


      builder: (context, snapshot) {


        if (!snapshot.hasData) {


          return const Scaffold(

            body: Center(

              child: CircularProgressIndicator(),

            ),

          );

        }



        final meals = snapshot.data!;



        int totalMeals = 0;

        int breakfast = 0;

        int lunch = 0;

        int dinner = 0;




        for (var meal in meals) {


          totalMeals += meal.mealsServed;



          if (meal.mealType == "Breakfast") {

            breakfast++;

          }


          if (meal.mealType == "Lunch") {

            lunch++;

          }


          if (meal.mealType == "Dinner") {

            dinner++;

          }

        }





        return Scaffold(



          appBar: AppBar(

            title: const Text(

              "Kitchen Reports",

            ),

          ),





          body: SingleChildScrollView(


            padding: const EdgeInsets.all(16),



            child: Column(


              crossAxisAlignment: CrossAxisAlignment.start,



              children: [




                // IMPACT CARD


                Container(


                  width: double.infinity,


                  padding: const EdgeInsets.all(22),



                  decoration: BoxDecoration(


                    gradient: const LinearGradient(


                      colors: [


                        Color(0xff6A1B9A),

                        Color(0xffAB47BC),

                      ],


                    ),



                    borderRadius: BorderRadius.circular(25),



                  ),




                  child: Column(


                    crossAxisAlignment: CrossAxisAlignment.start,



                    children: [



                      const Text(


                        "🌍 Community Impact",



                        style: TextStyle(


                          color: Colors.white,

                          fontSize:22,

                          fontWeight:FontWeight.bold,


                        ),



                      ),




                      const SizedBox(height:12),




                      Text(


                        "$totalMeals Meals Served",



                        style: const TextStyle(


                          color:Colors.white,

                          fontSize:32,

                          fontWeight:FontWeight.bold,


                        ),



                      ),





                      const SizedBox(height:5),





                      const Text(


                        "Helping the community every day ❤️",



                        style: TextStyle(


                          color:Colors.white70,


                        ),



                      ),


                    ],


                  ),


                ),





                const SizedBox(height:30),






                const Text(


                  "Meal Distribution",



                  style:TextStyle(


                    fontSize:22,

                    fontWeight:FontWeight.bold,


                  ),



                ),






                const SizedBox(height:15),






                _reportCard(

                  title:"Breakfast",

                  count:breakfast,

                  icon:Icons.free_breakfast,

                  color:Colors.orange,

                ),




                _reportCard(

                  title:"Lunch",

                  count:lunch,

                  icon:Icons.lunch_dining,

                  color:Colors.green,

                ),




                _reportCard(

                  title:"Dinner",

                  count:dinner,

                  icon:Icons.dinner_dining,

                  color:Colors.blue,

                ),





              ],


            ),


          ),



        );

      },


    );


  }





  Widget _reportCard({

    required String title,

    required int count,

    required IconData icon,

    required Color color,


  }) {


    return Container(


      margin: const EdgeInsets.only(bottom:15),



      padding: const EdgeInsets.all(18),



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


        children: [



          CircleAvatar(


            radius:28,


            backgroundColor:color.withOpacity(.15),



            child:Icon(

              icon,

              color:color,

              size:30,

            ),


          ),





          const SizedBox(width:18),





          Expanded(


            child:Column(


              crossAxisAlignment:CrossAxisAlignment.start,



              children:[



                Text(


                  title,


                  style:const TextStyle(


                    fontSize:17,

                    fontWeight:FontWeight.bold,


                  ),


                ),




                const SizedBox(height:6),




                Text(


                  "$count records",



                  style:TextStyle(


                    color:Colors.grey.shade600,


                  ),



                ),


              ],


            ),



          ),





          Text(


            "$count",



            style:TextStyle(


              fontSize:26,

              fontWeight:FontWeight.bold,

              color:color,


            ),



          )


        ],


      ),


    );

  }

}