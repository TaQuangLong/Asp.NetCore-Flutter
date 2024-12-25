import 'package:flutter_web_api/model.dart';

class CustomerDto {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phoneNumber;
  final String? zipCode;

  CustomerDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.zipCode,
  });

  // Convert CustomerDto to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'zipCode': zipCode,
    };
  }
}

class CustomerMapper {
  static CustomerDto toDto(Customer customer) {
    return CustomerDto(
      id: customer.id,
      firstName: customer.firstName,
      lastName: customer.lastName,
      email: customer.email,
      phoneNumber: customer.phoneNumber,
      zipCode: customer.zipCode,
    );
  }
}