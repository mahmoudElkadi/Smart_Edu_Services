import 'package:smart/features/Client/data/models/client_model.dart';
import 'package:smart/features/Client/data/models/one_client_model.dart';

abstract class ClientRepo {
  Future<ClientModel> allClient();
  Future<int> createClient(
    String clientName,
    String owner,
    String phone,
    String website,
    String country,
    String currency,
  );
  Future<int> updateClient(
    String id,
    String clientName,
    String owner,
    String phone,
    String website,
    String country,
    String currency,
  );
  Future<OneClientModel> detailsClient(String id);
  Future<int> deleteClient(String id);
  Future<ClientModel> filterClient({String? sort, String? country});
}
