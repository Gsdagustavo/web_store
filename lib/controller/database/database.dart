import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String databaseName = 'shop.db';
const int databaseVersion = 1;

/// Returns an instance of the database
Future<Database> getDatabase() async {
  final path = join(await getDatabasesPath(), databaseName);

  return openDatabase(
    path,
    version: databaseVersion,
    onCreate: (db, version) async {
      await db.execute(CartTable.createTable);
    },
  );
}

/// Represents a shopping cart of a specific user
class CartTable {
  static const String tableName = 'cart';

  static const String cartId = 'cartId';
  static const String userId = 'userId';
  static const String products = 'products';

  static const createTable = '''
  create table $tableName (
    $cartId integer primary key autoincrement,
    $userId integer not null,
    $products text not null
  );
  ''';
}

/// Represents a product
///
/// [productId] is the only attribute because this just needs to reference
/// the product that a shopping cart will contain
///
/// All the other info about the product, such as [title], [description], [image], etc
/// are all handled in the [ProductsProvider] by calling the API
class ProductTable {
  static const String tableName = 'product';

  static const String productId = 'productId';

  static const createTable = '''
  create table $tableName (
    $productId integer primary key
  );
  ''';
}
