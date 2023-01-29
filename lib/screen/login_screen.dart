import 'package:bloc_routing_sample/cubit/login_cubit.dart';
import 'package:bloc_routing_sample/cubit_model/login_cubit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          actions: [IconButton(onPressed: ()=>context.read<LoginCubit>().increment(), icon: const Icon(Icons.add))],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocBuilder<LoginCubit, LoginCubitModel>(
              builder: (context, state) {
                return Column(
                  children: [
                    TextFormField(
                     controller: emailController,
                      decoration:  const InputDecoration(
                       labelText: 'Email',
                        hintText: 'Enter your email',
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: passwordController,
                       obscureText: !state.passwordVisibility,
                      decoration:  InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                          suffixIcon: IconButton(onPressed: (){
                            context.read<LoginCubit>().changePasswordVisibility();
                          }, icon:state.passwordVisibility? const Icon(Icons.visibility): const Icon(Icons.visibility_off)),
                       
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<LoginCubit>().loginSubmit(
                             emailController.text,
                            passwordController.text,
                            context
                          );
                        },
                        child: state.isLoading? const CircularProgressIndicator(strokeWidth: 2,color:Colors.white,value: 5,): const Text('Login'),
                      ),
                    ),

                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(state.count.toString()),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
