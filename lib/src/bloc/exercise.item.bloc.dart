import 'package:bloc/bloc.dart';
import 'package:mygym/src/bloc/event/exercise.item.event.dart';
import 'package:mygym/src/bloc/state/exercise.item.state.dart';
import 'package:mygym/src/data/repositories/database.dart';

class ExerciseItemBloc extends Bloc<ExerciseItemEvent, ExerciseItemState> {
  final AppDatabase appDatabase;
  ExerciseItemBloc(this.appDatabase) : super(ExerciseItemLoading()) {
    on<LoadExerciseItems>(_onLoadExerciseItems);
  }

  Future<void> _onLoadExerciseItems(
      LoadExerciseItems event, Emitter<ExerciseItemState> emit) async {
    try {
      final exerciseItems = await appDatabase.allExerciseItems;
      emit(ExerciseItemLoaded(exerciseItems));
    } catch (_) {
      emit(ExerciseItemError());
    }
  }
}
