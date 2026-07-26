import 'package:flutter/material.dart';


class QuickActionButton extends StatelessWidget {


  final String title;

  final IconData icon;

  final VoidCallback onTap;



  const QuickActionButton({

    super.key,

    required this.title,

    required this.icon,

    required this.onTap,

  });



  @override
  Widget build(BuildContext context) {


    return InkWell(

      onTap:onTap,

      borderRadius: BorderRadius.circular(22),


      child: Container(

        padding: const EdgeInsets.all(14),


        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius: BorderRadius.circular(22),


          boxShadow:[

            BoxShadow(

              color: Colors.black.withOpacity(.08),

              blurRadius:12,

              offset:const Offset(0,6),

            )

          ],

        ),



        child:Column(

          mainAxisAlignment: MainAxisAlignment.center,


          children:[


            Container(

              padding:const EdgeInsets.all(10 ),


              decoration:BoxDecoration(

                color:const Color(0xffE8F5E9),

                borderRadius:BorderRadius.circular(18),

              ),


              child:Icon(

                icon,

                size:26,

                color:Colors.green,

              ),

            ),


            const SizedBox(height:12),



            Text(

              title,

              style:const TextStyle(

                fontSize:16,

                fontWeight:FontWeight.w600,

              ),

            )

          ],

        ),

      ),

    );

  }
}