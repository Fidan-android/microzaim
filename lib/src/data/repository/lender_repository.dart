import 'package:microzaim/src/data/mock/lenders.dart';
import 'package:microzaim/src/domain/repository/i_lender_repository.dart';

class LenderRepository extends ILenderRepository {
  @override
  List<String> getLendersByQuery(String query) {
    return MOCK_LENDERS
        .where((lender) => lender.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
