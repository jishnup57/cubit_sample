import 'package:bloc_routing_sample/cubit/details_cubit.dart';
import 'package:bloc_routing_sample/cubit_model/details_cubit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_cubit.dart';
import '../cubit_model/login_cubit_model.dart';

class DetailsTrials extends StatefulWidget {
  const DetailsTrials({super.key, required this.trialId});
  final String trialId;
  @override
  State<DetailsTrials> createState() => _DetailsTrialsState();
}

class _DetailsTrialsState extends State<DetailsTrials> {
  @override
  void initState() {
    context.read<DetailsCubit>().fetchDetailsData(widget.trialId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [ BlocBuilder<LoginCubit, LoginCubitModel>(
          builder: (context, state) {
            return Text(state.count.toString());
          },
        ),
           IconButton(onPressed: ()=>context.read<LoginCubit>().increment(), icon: const Icon(Icons.add))],
      ),
      body: BlocBuilder<DetailsCubit, DetailsCubitModel>(
        builder: (context, state) {
          return state.isLoading?const Center(child: CircularProgressIndicator()): Container(child: Text(state.trial!.title.toString()),);
        },
      ),
    );
  }
}
