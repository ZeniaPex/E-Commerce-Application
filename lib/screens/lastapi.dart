import 'package:flutter/material.dart';
import 'bloc/lastbloc.dart';
import 'category.dart';
import 'model/lastmodel.dart';
import 'model/category_section.dart';

class list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchalllast();
    return Scaffold(
      body: StreamBuilder(
        stream: bloc.alllastapi,
        builder: (context, AsyncSnapshot<LastModel> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) => CategoriesItem(
                categoryName: snapshot.data!.categories![index].pageDescription!.pageDefault.toString(),
                image: snapshot.data?.categories?[index].thumbnail,
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
