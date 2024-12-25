class Customer{
  final String  id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phoneNumber;
  final String? zipCode;

  const Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber, 
    required this.zipCode, 
  });

  const Customer.empty({
    this.id = '',
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.phoneNumber = '',
    this.zipCode = '',
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      zipCode: json['zipCode'],
  );

  Map<String, dynamic>  toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
    "zipCode": zipCode,
  };
}