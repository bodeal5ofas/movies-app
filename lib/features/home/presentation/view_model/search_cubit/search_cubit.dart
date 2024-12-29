import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies/features/home/data/models/popular_film_model.dart';
import 'package:movies/features/home/data/repo/search_repo.dart/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitialState());
  SearchRepo searchRepo;
  TextEditingController titleController = TextEditingController();
 // bool isSearced=false;
  search({required String title}) async {
    emit(SearchLoadingState());
    var result = await searchRepo.searchFilms(title: title);
    result.fold(
      (error) {
        emit(SearchFailureState(errMessage: error.errorMessage));
      },
      (films) {
        emit(SearchSucessState(films: films));
      },
    );
  }
}
