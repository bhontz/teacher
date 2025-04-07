import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/comment_model.dart';

sealed class CommentListEvent {}

sealed class CommentListState {}

class CommentAddItem extends CommentListEvent {
  final Comment comment;
  CommentAddItem(this.comment);
}

class CommentRemoveItem extends CommentListEvent {
  final int index;
  CommentRemoveItem(this.index);
}

class CommentListLoaded extends CommentListState {
  final List<Comment> items;
  CommentListLoaded(this.items);
}

class CommentListBloc extends Bloc<CommentListEvent, CommentListState> {
  CommentListBloc() : super(CommentListLoaded([])) {
    on<CommentAddItem>((event, emit) {
      if (state is CommentListLoaded) {
        final currentState = state as CommentListLoaded;
        final updatedList = List<Comment>.from(currentState.items)
          ..add(event.comment);
        emit(CommentListLoaded(updatedList));
      }
    });

    on<CommentRemoveItem>((event, emit) {
      if (state is CommentListLoaded) {
        final currentState = state as CommentListLoaded;
        final updatedList = List<Comment>.from(currentState.items)
          ..removeAt(event.index);
        emit(CommentListLoaded(updatedList));
      }
    });
  }
}
