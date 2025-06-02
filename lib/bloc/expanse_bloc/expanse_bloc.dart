import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'expanse_event.dart';
part 'expanse_state.dart';

class ExpanseBloc extends Bloc<ExpanseEvent, ExpanseState> {
  ExpanseBloc() : super(ExpanseInitial()) {
    on<ExpanseEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
