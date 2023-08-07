import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/controller/Cubits.dart';
import 'package:newsapp/controller/States.dart';
import 'package:newsapp/presentation/components/app_shimmer.dart';
import 'package:newsapp/presentation/components/newsItem.dart';
import 'package:newsapp/shared/theme/app_color.dart';

enum NewsTypes { business, science, sports }
class NewsList extends StatefulWidget {
  const NewsList({super.key,  this.type,  this.isSearch=false});
  final NewsTypes? type;
  final bool isSearch;
  @override
  State<NewsList> createState() => _NewsListState();
}
class _NewsListState extends State<NewsList> {
  List? setListValue(BuildContext context) {
    if(widget.isSearch){
      return AppCubit.i(context).searchResult?.articles;
    }
    if (widget.type == NewsTypes.business) {
      return AppCubit.i(context).businessNews?.articles;
    } else if (widget.type == NewsTypes.science) {
      return AppCubit.i(context).scienceNews?.articles;
    } else {
      return AppCubit.i(context).sportsNews?.articles;
    }
  }

  @override
  void initState() {
    super.initState();

    if (setListValue(context) == null) {
      if(widget.isSearch==false){
        AppCubit.i(context).getNews(widget.type!.name);

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, Appstates>(
      builder: (context, state) {
        final list = setListValue(context);
        return Scaffold(
          body:
              RefreshIndicator(
            onRefresh: () {
              if (widget.isSearch == false) {
                return AppCubit.i(context).getNews(widget.type!.name);
              }
              else {
                return Future.value(() {});
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.separated(
                itemBuilder: (context, index) => list != null?
                    NewsItem(article: list[index]):const AppShimmer(),
                separatorBuilder: (context, index) =>
                const SizedBox(height: 10),
                itemCount:list!= null? list.length:3,
              ),
            ),

    ),

              );

      },
    );
  }
}
