import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:simor/models/cek_mahasiswa.dart';
import 'package:simor/services/pebimbing_repository.dart';

part 'pembimbing_state.dart';

class PembimbingCubit extends Cubit<PembimbingState> {
  final PembimbingRepository pembimbingRepository;
  PembimbingCubit(this.pembimbingRepository) : super(PembimbingInitial());

  Future<void> getMahasiswa() async {
    emit(PembimbingLoading());
    final result = await pembimbingRepository.getMhs();
    result.fold(
      (erorr) => emit(PembimbingFailure(erorr)),
      (success) => emit(PembimbingLoaded(success)),
    );
  }

  Future<void> cekMahasiswa(String nim) async {
    emit(PembimbingLoading());
    final result = await pembimbingRepository.cekMahasiswa(nim);
    result.fold(
      (erorr) => emit(PembimbingFailure(erorr)),
      (success) => emit(PembimbingCekMhs(success)),
    );
  }

  Future<void> konfirmasiMahasiswa(String nim) async {
    emit(PembimbingLoading());
    final result = await pembimbingRepository.konfirmasiAbsensi(nim);
    result.fold(
      (erorr) => emit(PembimbingFailure(erorr)),
      (succes) => null,
    );
  }

  @override
  void onChange(Change<PembimbingState> change) {
    super.onChange(change);
    if (kDebugMode) {
      print(change);
    }
  }
}