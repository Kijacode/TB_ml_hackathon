import 'package:flutter/foundation.dart';
import 'package:tb_app/core/services/patient_service/patient_service.dart';
import 'package:tb_app/models/patient.dart';

class PatientState with ChangeNotifier {
//initilisation
  bool _isLoading = false;
  List<Patient> _patientList = [];
  Patient _currentPatient = Patient();

//selector
  bool get isLoading => _isLoading ?? false;
  List<Patient> get patientList => _patientList ?? [];
  Patient get currentPatient => _currentPatient;

  //reducer
  savePatient(Patient patient) {
    _isLoading = true;
    _currentPatient = patient;
    PatientService.onSavePatientToOffline(patient);
    _isLoading = false;
    notifyListeners();
  }

  Future getPatient() async {
    _isLoading = true;
    _patientList = await PatientService.onRetrievePatientFromOffline();
    _isLoading = false;
    notifyListeners();
  }
}
