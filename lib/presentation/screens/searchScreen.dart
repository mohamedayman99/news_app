import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/controller/Cubits.dart';
import 'package:newsapp/controller/States.dart';
import 'package:newsapp/presentation/components/NewList.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
String?text;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,Appstates>(
        listener: (context, state) {},
      builder: (context, state) => Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                  onFieldSubmitted: (value){
                    text=value;
                    AppCubit.i(context).search(text!);
                  },
                  decoration:  InputDecoration(
                    border: OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
                    fillColor: Colors.white60,
                    filled: true,prefixIcon: const Icon(Icons.search),label:const Text("Search")
                  ),

                ),
                const SizedBox(height: 30,),
                const Expanded(child:NewsList(
                  isSearch:true,
                ))

              ],
            ),
          ),
        ),
        );
  }
}
