import 'dart:async';
import 'dart:convert';

import 'package:flutter_web_api/customer_dto.dart';
import 'package:flutter_web_api/model.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiHandler {
  final String baseUri = "http://10.0.2.2:5212/api/customers";

  final logger = Logger();

  Future<List<Customer>> getCustomerData() async {
    List<Customer> data = [];

    final Uri uri = Uri.parse(baseUri);

    try {
      final response = await http.get(uri, headers: <String, String>{
        'Content-type': 'application/json; charset=UTF-8',
      });

      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final List<dynamic> jsonData = json.decode(response.body);
        data = jsonData.map((json) => Customer.fromJson(json)).toList();
      }
    } catch (e, stacktrace) {
      logger.e('HTTP request failed', e, stacktrace);

      return data;
    }
    return data;
  }

  Future<http.Response> updateCustomer(
      {required String id, required Customer customer}) async {
    final uri = Uri.parse("$baseUri/$id");
    final customerDto = CustomerMapper.toDto(customer);

    late http.Response response;

    try {
      response = await http.put(uri,
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8'
          },
          body: json.encode(customerDto.toJson()));

          if(response.statusCode != 200){
              logger.e('HTTP request failed', response);
          }
    } catch (e) {
      logger.e('HTTP request failed', e);

      return response;
    }
    return response;
  }

  Future<http.Response> addCustomer({required Customer customer}) async {
    final uri = Uri.parse(baseUri);
    final customerDto = CustomerMapper.toDto(customer);

    late http.Response response;

    try {
      response = await http.post(uri,
          headers: <String, String>{
            'Content-type': 'application/json; charset=UTF-8',
          },
          body: json.encode(customerDto.toJson()));
    } catch (e) {
      logger.e('HTTP request failed', e);

      return response;
    }
    return response;
  }

  Future<http.Response> deleteCustomer({required String id}) async {
    final uri = Uri.parse("$baseUri/$id");

    late http.Response response;

    try {
      response = await http.delete(
        uri,
        headers: <String, String>{
          'Content-type': 'apllication/json; charset=UTF-8',
        },
      );
    } catch (e) {
      logger.e('HTTP request failed', e);

      return response;
    }
    return response;
  }

  Future<Customer?> getCustomerById({required String id}) async {
    final uri = Uri.parse("$baseUri/$id");
    
    Customer? customer;
    
    late http.Response response;

    try {
      response = await http.get(
        uri,
        headers: <String, String>{
          'Content-type': 'apllication/json; charset=UTF-8',
        },
      );
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        customer = Customer.fromJson(jsonData);
      }
    } catch (e) {
      return customer;
    }
    return customer;
  }
}
