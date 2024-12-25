import 'package:flutter/material.dart';
import 'package:flutter_web_api/api_handler.dart';
import 'package:flutter_web_api/create_customer.dart';
import 'package:flutter_web_api/edit_page.dart';
import 'package:flutter_web_api/find_customer.dart';
import 'package:flutter_web_api/model.dart';
import 'package:flutter_web_api/utils.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ApiHandler apiHandler = ApiHandler();

  late List<Customer> data = [];

  void getData() async {
    data = await apiHandler.getCustomerData();
    setState(() {});
  }

  void deleteCustomer(String id) async {
    await apiHandler.deleteCustomer(id: id);
    getData(); 
    }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlutterApi"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.blue,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: getData,
        child: const Text('Refresh'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 1,
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              child: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FindCustomer()));
              }),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              child: const Icon(Icons.add),
              onPressed: () async {
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateCustomer()));
                if (result != null) {
                  setState(() {
                    data = result;
                  });
                }
              }),
        ],
      ),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    onTap: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  EditPage(customer: data[index])));
                      if (result != null) {
                        setState(() {
                          data = result;
                        });
                      }
                    },
                    leading: Text((index + 1).toString()),
                    title: Text(
                        "${data[index].firstName} ${data[index].lastName}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data[index].phoneNumber ?? "phone number"),
                        Text(data[index].email),
                      ],
                    ),
                    trailing: IconButton(
                        onPressed: () async {
                          deleteCustomer(data[index].id);
                        },
                        icon: const Icon(Icons.delete_outline)),
                  ),
                ));
              })
        ],
      ),
    );
  }
}
