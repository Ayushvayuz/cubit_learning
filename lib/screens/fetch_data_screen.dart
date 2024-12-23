import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_flutter_project/cubit/cubit/fetch_user_cubit.dart';

class FetchDataScreen extends StatefulWidget {
  const FetchDataScreen({super.key});

  @override
  State<FetchDataScreen> createState() => _FetchDataScreenState();
}

class _FetchDataScreenState extends State<FetchDataScreen> {
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text("Fetching data by cubit"),
    ),
    body: BlocBuilder<FetchUserCubit, FetchUserState>(
      builder: (context, state) {
        if (state is FetchUserInitial) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<FetchUserCubit>(context).getUserData();
              },
              child: const Text("Fetch UserData"),
            ),
          );
        } else if (state is FetchUserLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FetchUserLoadedState) {
         
        } else if (state is fetchUserErrorState) {
          return const Center(
            child: Text(
              "Something went wrong",
              style:  TextStyle(color: Colors.red),
            ),
          );
        }

        return const Center(child: Text("Unexpected state"));
      },
    ),
  );
}
}