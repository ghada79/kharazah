import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:kharazah/features/profile_screen/presentation/pages/profile_screen.dart';
import 'package:kharazah/features/settings_screen/presentation/pages/settings_screen.dart';
import '../../../../config/routes/routes.dart';
import '../../../../core/utils/shared_pref_utils.dart';
import '../../../home_screen/presentation/pages/home_screen.dart';

part 'main_layout_state.dart';

@injectable
class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutInitial()) {}

  final List<Widget> screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  int currentIndex = 0;


  void changeIndex(int index) {
    emit(MainLayoutLoadingState());
    currentIndex = index;
    emit(MainLayoutHideAppBarState());
  }

  void logout(BuildContext context) {
    SharedPrefUtils.removeData(key: 'token');
    currentIndex = 1;
    emit(MainLayoutInitial());
    context.go(Routes.loginRoute);
  }
}
