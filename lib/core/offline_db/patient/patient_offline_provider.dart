
import 'package:sqflite/sqflite.dart';
import 'package:tb_app/core/offline_db/offline_db_provider.dart';
import 'package:tb_app/models/patient.dart';

class ParinetOfflineProvider extends OfflineDbProvider {
  //columns
  String table = "patient";
  String id = "id";
  String name = "name";
  String analysisData = "analysis_data";
  String signature = "signature";

  addOrUpdateParients(Patient patient) async {
    var dbClient = await db;
    await dbClient.insert(table, patient.toOffline(patient) as Map<String, Object?>,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteOrganisation(String patientId) async {
    var dbClient = await db;
    return await dbClient
        .delete(table, where: '$id = ?', whereArgs: [patientId]);
  }

  Future<List<Patient>> getAllPatients() async {
    List<Patient> patientList = [];
    print("in database");
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        table,
        columns: [id, name, analysisData, signature],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          Patient patient = Patient.fromOffline(map as Map<String, dynamic>);
          patientList.add(patient);
        }
      }
    } catch (e) {}
    patientList.sort((a, b) => a.name.compareTo(b.name));
    return patientList;
  }
}
