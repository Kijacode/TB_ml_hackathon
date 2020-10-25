import 'package:onsite/core/utils/app_util.dart';

class Patient {
  String id;
  String name;
  String analysisData;
  String signature;

  Patient({this.id, this.name, this.analysisData, this.signature});

  Patient patientFactory(String name, String analysisData, String signature) {
    return Patient(
      id: AppUtil.getUid(),
      name: name,
      analysisData: analysisData ?? "0",
      signature: signature ?? "Agree",
    );
  }

  Map toOffline(Patient patient) {
    var map = Map<String, dynamic>();
    map['id'] = patient.id;
    map['name'] = patient.name;
    map['analysis_data'] = patient.analysisData;
    map['signature'] = patient.signature;
    return map;
  }

  Patient.fromOffline(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.analysisData = map["analysis_data"];
    this.signature = map['signature'];
  }

  @override
  String toString() {
    return 'name : $name, id : $id';
  }
}
