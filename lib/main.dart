import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uena_community_flutter/features/app/cubits/uena_community_cubit.dart';
import 'package:uena_community_flutter/features/app/uena_community_app.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => UenaCommunityCubit(),
    child: const UenaCommunityApp(),
  ));
}
