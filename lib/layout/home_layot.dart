
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter/material.dart';

import '../modules/modukes_components/componunts.dart';
import '../modules/modukes_cubit/cubit.dart';
import '../modules/modules_state/states.dart';


class HomeLayout extends StatelessWidget {


  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titlCotroller = TextEditingController();
  var timeCotroller = TextEditingController();
  var dateCotroller = TextEditingController();


  //@override
  //void initState() {
  // createDatabase();
  // super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if(state is AppInserDatabaseState)
            {
              return Navigator.pop(context);
            }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                  cubit.titles[cubit.currentIndex]),
            ),
            body: ConditionalBuilder(
              condition: true,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) =>
                  Center(child: CircularProgressIndicator(),),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isShowBottomheet) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatabase(title: titlCotroller.text, time: timeCotroller.text, date: dateCotroller.text);
                    // insertToDatabase(
                    // title: timeCotroller,
                    // time: timeCotroller,
                    // date: dateCotroller,
                    // ).then((value) {
                    //Navigator.pop(context);
                    //  isShowBottomheet = false;
                    // setState(() {
                    // faicon = Icons.edit;
                    //});
                    //  });


                  }
                } else {
                  scaffoldKey.currentState?.showBottomSheet((context) =>
                      Container(

                        width: double.infinity,
                        height: 260,
                        color: Colors.white,

                        padding: EdgeInsets.all(20),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defultForm(controller: titlCotroller,
                                  type: TextInputType.text,

                                  lable: 'task title',
                                  prefix: Icons.title,

                                  onTap: () {


                                  }

                              ),
                              SizedBox(height: 20,),
                              defultForm(
                                  controller: timeCotroller,
                                  type: TextInputType.datetime,
                                  lable: 'time title',
                                  prefix: Icons.watch_later_outlined,
                                  onPressed: () {},
                                  onTap: () {
                                    showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now()
                                    ).then((value) {
                                      timeCotroller.text =
                                          value!.format(context).toString();
                                    });
                                  }


                              ),
                              SizedBox(height: 20,),
                              defultForm(

                                  controller: dateCotroller,
                                  type: TextInputType.datetime,
                                  lable: 'date title',
                                  prefix: Icons.calendar_today,
                                  onPressed: () {

                                  },

                                  onTap: () {
                                    showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse("2022-10-20")
                                    ).then((value) {
                                      dateCotroller.text =
                                          DateFormat.yMMMd().format(value!);
                                    });
                                  }

                              ),
                            ],
                          ),
                        ),
                      ),
                      elevation: 20
                  ).closed.then((value) {
                    cubit.ChangeBottomSheetState(isShow: false, icon: Icons.edit);
                   // isShowBottomheet = false;
                    // setState(() {
                    // faicon = Icons.edit;
                    // });
                  });
                  cubit.ChangeBottomSheetState(isShow: true, icon: Icons.add);
                 // isShowBottomheet = true;
                  // setState(() {

                  //  faicon = Icons.add;
                  //  });

                }
              },
              child: Icon(cubit. faicon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: AppCubit
                  .get(context)
                  .currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
                //  currentIndex=index;
                //setState(() {
                //
                //});
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Task"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: "Done"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: "Archive"),
              ],
            ),
            //  body: screens[currentIndex],
          );
        },

      ),
    );
  }

  Future <String> getName() async
  {
    return "Osama Mekawy";
  }
}






