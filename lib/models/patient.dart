import '../core/utils/app_util.dart';

class Patient {
  late String id;
 late String name;
 late String analysisData;
 late String signature;

  Patient({ this.id ='',
       this.name = '',
       this.analysisData = '' ,
       this.signature = ''});

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
    id = map['id'];
    name = map['name'];
    analysisData = map["analysis_data"];
    signature = map['signature'];
  }

  @override
  String toString() {
    return 'name : $name, id : $id';
  }
}
