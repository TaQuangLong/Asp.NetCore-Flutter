import 'package:flutter/material.dart';
import 'package:flutter_web_api/api_handler.dart';
import 'package:flutter_web_api/model.dart';

class FindCustomer extends StatefulWidget {
  const FindCustomer({super.key});

  @override
  State<FindCustomer> createState() => _FindCustomerState();
}

class _FindCustomerState extends State<FindCustomer> {
  ApiHandler apiHandler = ApiHandler();

  Customer customer = const Customer.empty();

  TextEditingController textEditingController = TextEditingController();

  void findCustomer(String id) async{
    customer = (await apiHandler.getCustomerById(id: id))!;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find customer"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.blue,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: (){
          findCustomer(textEditingController.text);
        },
        child: const Text('Find'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
            ),
            const SizedBox(height: 10,),
            ListTile(
              leading: Text(customer.phoneNumber ?? "phone number"),
              title: Text("${customer.firstName} ${customer.lastName}"),
              subtitle: Text(customer.email),
            )
          ],
        ),),
    );
  }
}