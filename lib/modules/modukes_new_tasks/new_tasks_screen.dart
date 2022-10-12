
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../modukes_components/componunts.dart';
import '../modukes_cubit/cubit.dart';
import '../modules_state/states.dart';

class NewTasksScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: ( context,state){},
      builder: (context,state){
        var tasks = AppCubit.get(context).newTasks;
        return  ListView.separated(
            itemBuilder: (context,index)=> buildTasksItem(tasks[index],context),
            separatorBuilder: (context,index) => Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            itemCount: tasks.length
        );
      },

    );
  }
}
