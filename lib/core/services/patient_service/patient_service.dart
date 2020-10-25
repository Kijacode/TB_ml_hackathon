import 'package:onsite/app_state/patient_state.dart';
import 'package:onsite/core/offline_db/patient/patient_offline_provider.dart';
import 'package:onsite/models/patient.dart';

class PatientService {
  static Future<List<Patient>> onRetrievePatientFromOffline() async {
    List<Patient> patientList = [];
    patientList = await ParinetOfflineProvider().getAllPatients();
    return patientList;
  }

  static void onSavePatientToOffline(Patient patient) async {
    ParinetOfflineProvider().addOrUpdateParients(patient);
  }

  static Future updatePatientAnalysisValue(
      Patient currentPatient, String analysisValue) {
    currentPatient.analysisData = analysisValue;
    PatientState().savePatient(currentPatient);
    return null;
  }
}
