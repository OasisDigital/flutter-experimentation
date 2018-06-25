import 'package:scoped_model/scoped_model.dart';
import 'order_class.dart';

class OrderModel extends Model {
  Order activeOrder;

  void changeActiveOrder(name) {
    activeOrder = name;
    notifyListeners();
  }

  void resetActiveOrder() {
    activeOrder = null;
    notifyListeners();
  }
}