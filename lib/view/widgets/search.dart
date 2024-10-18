import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tasks/providers/taskprovider.dart';
import 'package:provider/provider.dart';
import 'package:tasks/view/widgets/taskcard.dart';

// Task Search Delegate
class TaskSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    final results = taskProvider.searchTasks(query);
    if(results.isEmpty) {
      return Lottie.asset("assets/animations/empty-tasks.json");
    }
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return TaskCard(index: index);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}