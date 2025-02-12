import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:whatsappclone/feature/home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());

  Future<void> signout() async {
    await homeRepo.signout();
  }

  Future<void> signoutwithgoole() async {
    await homeRepo.signoutwithgoogle();
  }
}
