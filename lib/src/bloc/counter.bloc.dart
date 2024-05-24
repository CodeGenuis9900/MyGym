// import 'package:bloc/bloc.dart';
//
// abstract class CounterEvent{}
//
// class IncrementCounterEvent extends CounterEvent{
//
// }
// class DecrementCounterEvent extends CounterEvent{
//
// }
//
// abstract class CounterState{
//   final int counter;
//
//   CounterState({required this.counter});
// }
// class CounterSuccessState extends CounterState{
//   CounterSuccessState({required super.counter});
//
// }
// class CounterErrorState extends CounterState{
//   final String errorMessage;
//   CounterErrorState(this.errorMessage, {required super.counter});
//
// }
// class InitialState extends CounterState{
//   InitialState():super(counter: 0)
// }
// class CounterBloc extends Bloc<CounterEvent,CounterState>{
//   CounterBloc():super(InitialState()){
//
//     on((IncrementCounterEvent event,emit){
//       if(state.counter<10) {
//         emit(CounterSuccessState(counter: state.counter+1));
//       }else{
//         emit(CounterErrorState("errorMessage", counter: state.counter))
//       }
//
//     });
//
//   }
//
// }