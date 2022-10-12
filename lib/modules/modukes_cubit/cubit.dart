import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';



import '../modukes_archive_tasks/archive_tasks_screen.dart';
import '../modukes_done_tasks/done_tasks_screen.dart';
import '../modukes_new_tasks/new_tasks_screen.dart';
import '../modules_state/states.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit ():super (AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScren(),
    ArchiveTasksSreen()
  ];
  List<String> titles = [
    "NewTasks",
    "DoneTasks",
    "ArchiveTasks",
  ];
  int currentIndex =0;

  void changeIndex(int index )
  {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  late Database  database ;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];



  void createDatabase()
  {
     openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database,version)async {
          print("database created");
          await database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY , title TEXT , date TEXT,time TEXT,status TEXT)');

        },
        onOpen: (database){
          getDataFromDatabase(database);
          print("database oppened");
        }
    ).then((value) {
      database = value;
      emit(AppCreatDatabaseState());
     });
  }

  insertToDatabase({
    required title,
    required time,
    required date,
  }) async
  {
     await  database.transaction((txn) {
      return txn.rawInsert('INSERT INTO tasks(title, date , time, status) VALUES ("$title" , "$date","$time","new")').then((value) {
        emit(AppInserDatabaseState());
        getDataFromDatabase(database);
        print("$value inserted saccssefully");
      }).catchError((error) {
        print("Error when Inserted new Record ${error.toString()}");

      });
    });
  }

  void getDataFromDatabase(database)
  {
    newTasks=[];
    doneTasks=[];
    archivedTasks=[];


    emit(AppGetDatabaseState());
    database.rawQuery("SELECT * FROM tasks").then((value) {

      value.forEach((element) {
       if(element['status'] == 'new')
         newTasks.add(element);
       else if(element['status'] == 'done')
         doneTasks.add(element);
        else archivedTasks.add(element);

      });



    });
  }
  void updateData({
  required String status,
  required int id
}) {
     database.rawUpdate(
        'UPDATE tasks SET status = ?  WHERE id = ?',
        ['${status}', id]).then((value) {
          emit(AppUpdateDatabaseState());
          getDataFromDatabase(database);
     });

  }


  void deleteData({

    required int id
  }) {
    database.rawUpdate('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      emit( AppDeleteDatabaseState());
      getDataFromDatabase(database);
    });

  }

  bool isShowBottomheet = false;
  IconData faicon = Icons.edit;


  void ChangeBottomSheetState({required bool isShow,required IconData icon})
  {
    isShowBottomheet = isShow;
    faicon  = icon;
    emit(AppChangeBottomSheetState());

  }
}


