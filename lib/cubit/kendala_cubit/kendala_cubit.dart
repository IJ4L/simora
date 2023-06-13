import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simor/services/dosen_repository.dart';

import '../../models/kendala2_model.dart';

part 'kendala_state.dart';

class KendalaCubit extends Cubit<KendalaState> {
  DosenRepository dosenRepository;
  KendalaCubit({required this.dosenRepository}) : super(KendalaInitial());

  Future<void> getKendala() async {
    emit(KendalaLoading());
    final result = await dosenRepository.getKendala();
    result.fold(
      (erorr) => emit(KendalaFailure(message: erorr)),
      (success) => emit(KendalaLoaded(kendala: success)),
    );
  }
}
