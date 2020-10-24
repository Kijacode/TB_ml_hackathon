import 'package:onsite/core/offline_db/offline_db_provider.dart';
import 'package:onsite/models/patient.dart';
import 'package:sqflite/sqflite.dart';

class OrganisationUnitOffline extends OfflineDbProvider {
  //columns
  String table = "patient";
  String id = "id";
  String name = "name";
  String analysisData = "analysis_data";

  addOrUpdateOrganisationUnits(Patient patient) async {
    var dbClient = await db;
    await dbClient.insert(table, patient.toOffline(patient),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteOrganisation(String patientId) async {
    var dbClient = await db;
    return await dbClient
        .delete(table, where: '$id = ?', whereArgs: [patientId]);
  }

  Future<List<Patient>> getAllPatients() async {
    List<Patient> patientList = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        table,
        columns: [id, name, analysisData],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          Patient patient = Patient.fromOffline(map);
          patientList.add(patient);
        }
      }
    } catch (e) {}
    patientList.sort((a, b) => a.name.compareTo(b.name));
    return patientList;
  }
}
