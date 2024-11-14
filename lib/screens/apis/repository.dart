import 'package:ecommerce_app/screens/apis/productlistapi.dart';
import 'package:ecommerce_app/screens/apis/profuct.dart';
import 'package:ecommerce_app/screens/apis/subcatapi.dart';

import '../model/category_section.dart';
import '../model/lastmodel.dart';
import '../model/product.dart';
import '../model/productlist.dart';
import '../model/subcatmodel.dart';
import 'categoryapi.dart';
import 'lastapi.dart';

class Repository {
  final categoryprovider = CategoryProvider();
  Future<CategorySection> getallcategory() => categoryprovider.getcategory();

  final productprovider = ProductProvider();
  Future<ProductModel> getallproducts() => productprovider.product();

final subcatprovider = SUbcatProvider();
  Future<SubCatModel> getallsubcat() => subcatprovider.getsubcat();

  final lastprovider = LatProvider();
  Future<LastModel> getalllast() => lastprovider.getlastapi();

  final productlistprovider = ProductlistyProvider();
  Future<ProductListModel> getallproductlist() => productlistprovider.getallproductlist();

  
}

