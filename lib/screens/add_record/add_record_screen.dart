import 'package:flutter/material.dart';

import '../../models/meal_record.dart';
import '../../services/meal_service.dart';


class AddRecordScreen extends StatefulWidget {

  const AddRecordScreen({super.key});


  @override
  State<AddRecordScreen> createState() => _AddRecordScreenState();

}



class _AddRecordScreenState extends State<AddRecordScreen> {


  final _formKey = GlobalKey<FormState>();


  final TextEditingController mealsController = TextEditingController();

  final TextEditingController volunteerController = TextEditingController();

  final TextEditingController notesController = TextEditingController();


  final MealService mealService = MealService();



  String mealType = "Breakfast";


  DateTime selectedDate = DateTime.now();



  Future<void> _pickDate() async {


    DateTime? picked = await showDatePicker(

      context: context,

      initialDate: selectedDate,

      firstDate: DateTime(2025),

      lastDate: DateTime(2035),

    );


    if (picked != null) {


      setState(() {

        selectedDate = picked;

      });

    }

  }




  Future<void> _saveRecord() async {


    if (!_formKey.currentState!.validate()) return;



    MealRecord meal = MealRecord(

      mealType: mealType,

      mealsServed: int.parse(mealsController.text),

      volunteer: volunteerController.text,

      notes: notesController.text,

      date:
          "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",

    );



    await mealService.insertMeal(meal);



    if (!mounted) return;



    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(

        behavior: SnackBarBehavior.floating,

        backgroundColor: Colors.green,

        content: const Text(

          "Meal Record Saved Successfully ✅",

        ),

      ),

    );



    Navigator.pop(context);

  }




  @override
  void dispose() {

    mealsController.dispose();

    volunteerController.dispose();

    notesController.dispose();

    super.dispose();

  }






  @override
  Widget build(BuildContext context) {


    return Scaffold(


      appBar: AppBar(

        title: const Text(

          "Add Meal Record",

        ),

      ),




      body: SingleChildScrollView(


        padding: const EdgeInsets.all(18),



        child: Form(


          key: _formKey,



          child: Column(


            crossAxisAlignment: CrossAxisAlignment.start,



            children: [




              // HEADER CARD


              Container(


                width: double.infinity,


                padding: const EdgeInsets.all(22),



                decoration: BoxDecoration(


                  gradient: const LinearGradient(


                    colors: [


                      Color(0xff2E7D32),

                      Color(0xff66BB6A),

                    ],


                  ),



                  borderRadius: BorderRadius.circular(24),



                ),



                child: const Column(


                  crossAxisAlignment: CrossAxisAlignment.start,



                  children: [


                    Text(


                      "🍲 Record Today's Meals",



                      style: TextStyle(


                        color: Colors.white,

                        fontSize: 23,

                        fontWeight: FontWeight.bold,


                      ),


                    ),



                    SizedBox(height: 8),




                    Text(


                      "Track food distribution and community impact",



                      style: TextStyle(


                        color: Colors.white70,

                        fontSize: 14,


                      ),


                    ),



                  ],


                ),



              ),




              const SizedBox(height: 28),





              const Text(


                "Meal Information",



                style: TextStyle(


                  fontSize: 22,

                  fontWeight: FontWeight.bold,


                ),



              ),





              const SizedBox(height: 15),






              // DATE PICKER



              Container(



                decoration: BoxDecoration(


                  color: Colors.white,

                  borderRadius: BorderRadius.circular(18),


                ),



                child: ListTile(


                  leading: const CircleAvatar(


                    backgroundColor: Color(0xffE8F5E9),


                    child: Icon(

                      Icons.calendar_month,

                      color: Colors.green,

                    ),

                  ),



                  title: const Text("Date"),



                  subtitle: Text(

                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",

                  ),



                  trailing: const Icon(Icons.arrow_forward_ios,size:16),



                  onTap: _pickDate,


                ),


              ),






              const SizedBox(height:18),





              DropdownButtonFormField<String>(


                value: mealType,



                decoration: const InputDecoration(


                  labelText: "Meal Type",

                  prefixIcon: Icon(Icons.restaurant),


                ),



                items: const [


                  DropdownMenuItem(

                    value: "Breakfast",

                    child: Text("Breakfast"),

                  ),



                  DropdownMenuItem(

                    value: "Lunch",

                    child: Text("Lunch"),

                  ),




                  DropdownMenuItem(

                    value: "Dinner",

                    child: Text("Dinner"),

                  ),



                ],



                onChanged: (value){


                  setState(() {


                    mealType = value!;


                  });


                },



              ),





              const SizedBox(height:18),





              TextFormField(


                controller: mealsController,


                keyboardType: TextInputType.number,



                decoration: const InputDecoration(


                  labelText: "Meals Served",


                  prefixIcon: Icon(Icons.people),


                ),




                validator: (value){


                  if(value == null || value.isEmpty){


                    return "Enter number of meals";


                  }



                  return null;


                },


              ),






              const SizedBox(height:18),






              TextFormField(


                controller: volunteerController,



                decoration: const InputDecoration(


                  labelText: "Volunteer Name",


                  prefixIcon: Icon(Icons.person),


                ),



              ),






              const SizedBox(height:18),






              TextFormField(


                controller: notesController,


                maxLines:4,



                decoration: const InputDecoration(


                  labelText: "Notes",


                  prefixIcon: Icon(Icons.notes),


                ),



              ),





              const SizedBox(height:30),





              SizedBox(


                width: double.infinity,


                height:55,



                child: ElevatedButton.icon(



                  onPressed: _saveRecord,



                  icon: const Icon(Icons.check_circle),



                  label: const Text(

                    "Save Meal Record",

                  ),



                ),



              )



            ],


          ),


        ),


      ),


    );


  }

}