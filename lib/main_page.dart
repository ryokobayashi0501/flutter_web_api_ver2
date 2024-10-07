import 'package:flutter/material.dart';
import 'package:flutter_web_api/api_handler.dart';
import 'package:flutter_web_api/edit_page.dart';
import 'package:flutter_web_api/model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ApiHandler apiHandler = ApiHandler();
  late List<User> data = [];

  void getData() async{
    data = await apiHandler.getUserData();
    setState(() {});
  }

  @override
  void initState(){
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlutterApi"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: getData,
        child: const Text('Refresh'),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPage(
                          user: data[index],
                        ),
                      ),
                    );
                  },
                  leading: Text("${data[index].userId}"),
                  title: Text(data[index].name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("User Name: " + data[index].username),
                      Text("Email: " + data[index].email),
                      Text("Years of Experience: " + data[index].yearsOfExperience.toString()),
                      Text("Average Score: " + data[index].averageScore.toString()),
                      Text("Practice Frequency: " + data[index].practiceFrequency),
                      Text("Score Goal: " + data[index].scoreGoal.toString()),
                      Text("Putting Goal: " + data[index].puttingGoal.toString()),
                      Text("Approach Goal: " + data[index].approachGoal.toString()),
                      Text("Shot Goal: " + data[index].shotGoal.toString()),
                      Text("password: " + data[index].passwordHash),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}