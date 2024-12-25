import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_web_api/api_handler.dart';
import 'package:flutter_web_api/model.dart';
import 'package:flutter_web_api/utils.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EditPage extends StatefulWidget {
  final Customer customer;
  const EditPage({super.key, required this.customer});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  ApiHandler apiHandler = ApiHandler();

  final _formKey = GlobalKey<FormBuilderState>();

  Future<bool> updateCustomer() async {
    if (_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;

      final customer = Customer(
        id: widget.customer.id,
        firstName: data['firstName'],
        lastName: data['lastName'],
        email: data['email'],
        phoneNumber: data['phoneNumber'],
        zipCode: data['zipCode'],
      );

      await apiHandler.updateCustomer(
          id: widget.customer.id, customer: customer);

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
          title: const Text("Edit page"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        bottomNavigationBar: MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          padding: const EdgeInsets.all(20),
          onPressed: () async {
            bool isCreated = await updateCustomer();
            if (isCreated) {
              showSuccessDialog(context, 'Customer edited successfully');
            }
          },
          child: const Text('Update'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: FormBuilder(
                key: _formKey,
                initialValue: {
                  'firstName': widget.customer.firstName,
                  'lastName': widget.customer.lastName,
                  'email': widget.customer.email,
                  'phoneNumber': widget.customer.phoneNumber,
                  'zipCode': widget.customer.zipCode,
                },
                child: Column(
                  children: [
                    FormBuilderTextField(
                        name: 'firstName',
                        decoration:
                            const InputDecoration(labelText: 'FirstName'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ])),
                    const SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                        name: 'lastName',
                        decoration:
                            const InputDecoration(labelText: 'LastName'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ])),
                    FormBuilderTextField(
                        name: 'email',
                        decoration: const InputDecoration(labelText: 'Email'),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ])),
                    FormBuilderTextField(
                      name: 'phoneNumber',
                      decoration:
                          const InputDecoration(labelText: 'PhoneNumber'),
                    ),
                    FormBuilderTextField(
                      name: 'zipCode',
                      decoration: const InputDecoration(labelText: 'ZipCode'),
                    ),
                  ],
                ))));
  }
}
