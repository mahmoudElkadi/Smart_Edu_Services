import 'package:smart/features/Statuses/data/model/status_model.dart';

import '../model/one_status.dart';

abstract class StatusRepo {
  Future<StatusModel> allStatus();
  Future<int> createStatus(String name, String role);
  Future<int> updateStatus(String id, String name, String role);
  Future<OneStatusModel> detailsStatus(String id);
  Future<int> deleteStatus(String id);
}
