import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {

  final String title;
  final String value;
  final IconData icon;
  final Color color;


  const DashboardCard({

    super.key,

    required this.title,
    required this.value,
    required this.icon,
    required this.color,

  });



  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(14),


      decoration: BoxDecoration(

        gradient: LinearGradient(

          colors: [

            color.withOpacity(0.85),

            color,

          ],

        ),

        borderRadius: BorderRadius.circular(18),

      ),



      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        mainAxisAlignment: MainAxisAlignment.center,


        children: [


          CircleAvatar(

            radius: 18,

            backgroundColor: Colors.white,

            child: Icon(

              icon,

              size: 20,

              color: color,

            ),

          ),



          const SizedBox(height: 12),



          Text(

            value,

            style: const TextStyle(

              color: Colors.white,

              fontSize: 22,

              fontWeight: FontWeight.bold,

            ),

          ),



          const SizedBox(height: 3),



          Text(

            title,

            style: const TextStyle(

              color: Colors.white,

              fontSize: 13,

            ),

          ),

        ],

      ),

    );

  }

}