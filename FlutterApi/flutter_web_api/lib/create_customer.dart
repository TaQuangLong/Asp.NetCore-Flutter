import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_web_api/api_handler.dart';
import 'package:flutter_web_api/model.dart';
import 'package:flutter_web_api/utils.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CreateCustomer extends StatefulWidget {
  const CreateCustomer({super.key});

  @override
  State<CreateCustomer> createState() => _CreateCustomerState();
}

class _CreateCustomerState extends State<CreateCustomer> {
  final _formKey = GlobalKey<FormBuilderState>();

  ApiHandler apiHandler = ApiHandler();

  Future<bool> createCustomer() async {
    if (_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;

      final customer = Customer(
        id: '',
        firstName: data['firstName'],
        lastName: data['lastName'],
        email: data['email'],
        phoneNumber: data['phoneNumber'],
        zipCode: data['zipCode'],
      );

      await apiHandler.addCustomer(customer: customer);

      if (!mounted);
      return true;

    } else {
      setState(() {});
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create customer"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.blue,
        textColor: Colors.white,
        padding: const EdgeInsets.all(20),
        onPressed: () async {
          bool isCreated = await createCustomer();
          if (isCreated) {
            showSuccessDialog(context, 'Customer created successfully');
          }
        },
        child: const Text('Create'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'firstName',
                    decoration: const InputDecoration(labelText: 'FirstName'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormBuilderTextField(
                    name: 'lastName',
                    decoration: const InputDecoration(labelText: 'LastName'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  FormBuilderTextField(
                    name: 'email',
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  FormBuilderTextField(
                    name: 'phoneNumber',
                    decoration: const InputDecoration(labelText: 'PhoneNumber'),
                  ),
                  FormBuilderTextField(
                    name: 'zipCode',
                    decoration: const InputDecoration(labelText: 'ZipCode'),
                  ),
                ],
              ))),
    );
  }
}
