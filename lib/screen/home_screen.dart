import 'package:bloc_routing_sample/cubit/home_cubit.dart';
import 'package:bloc_routing_sample/cubit_model/home_cubit_model.dart';
import 'package:bloc_routing_sample/screen/splash.dart';
import 'package:bloc_routing_sample/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<HomeCubit>().fetchHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeCubitModel>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  ServiceManger.saveToSharePref('');
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const Splash()),
                    (route) => false,
                  );
                },
              ),
           
            ],
          ),
          body: state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  itemBuilder: (context, index) {
                    final item = state.trialList[index];
                    return ListTile(
                      title: Text(item.id),
                      onTap: () => Navigator.pushNamed(context, '/details',arguments: item.id),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: state.trialList.length,
                ),
        );
      },
    );
  }
}
