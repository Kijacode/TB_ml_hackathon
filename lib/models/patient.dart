class Patient {
  String id;
  String name;
  String password;
  String analysisData;
 
  Patient({
    this.id,
    this.name,
    String password,
    String analysisData
  });

 
  Map toOffline(Patient patient) {
    var map = Map<String, dynamic>();
    map['id'] = patient.id;
    map['name'] = patient.name;
    map['analysis_data'] = patient.analysisData;
    return map;
  }

  Patient.fromOffline(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.analysisData = map["analysis_data"];
  }

  @override
  String toString() {
    return 'name : $name, id : $id';
  }
}
