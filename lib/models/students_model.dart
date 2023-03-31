import 'classes_model.dart';
import 'phone_model.dart';
import 'address_model.dart';

class StudentsModel {
  StudentsModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.courseName,
    required this.classes,
    this.age,
  });

  int id;
  String name;
  PhoneModel phone;
  AddressModel address;
  List<String> courseName;
  List<ClassesModel> classes;
  int? age;
}
