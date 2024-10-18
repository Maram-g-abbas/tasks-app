import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tasks/providers/taskprovider.dart';
import 'package:tasks/view/widgets/search.dart';
import 'package:tasks/view/widgets/taskcard.dart';
import 'package:provider/provider.dart';
import '../../core/utils/style.dart';
import '../../core/utils/thems.dart';
import 'addtask.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.person),),
              title: Text("maram abbas"),
            )),
            ListTile(
              title: const Text("mood"),
              trailing: IconButton(
                icon: const Icon(Icons.brightness_6),
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                },
              ),
            )

          ],
        ),
      ),
     appBar: AppBar(
       title: Text("hello maram",style: AppTextStyles.headline2(context),),
       actions: [
         IconButton(
           icon: const Icon(Icons.notification_add),
           onPressed: () {
             showSearch(context: context, delegate: TaskSearchDelegate());
           },
         ),
       ],
     ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: (){
                    showSearch(context: context, delegate: TaskSearchDelegate());
                  },
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: const Icon(Icons.search)
                    ),
                  ),
                ),
              ),
              if(taskProvider.tasks.isEmpty)
              Lottie.asset("assets/animations/empty-tasks.json"),
              ListView.builder(
                shrinkWrap: true,
              itemCount: taskProvider.tasks.length,
              itemBuilder: (context, index) {
                return TaskCard(index: index);
              },
            )
          ]
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}




//responsive
//importance
