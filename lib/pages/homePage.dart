import 'package:flutter/material.dart';
import 'package:flutter_api/providers/api_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(),
      body: userData.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].username),
                subtitle: Text(data[index].email),
                leading: Text(data[index].id.toString()),
              );
            },
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
