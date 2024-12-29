import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/presentation/view/widgets/home_tap/detatils_view/custom_similar_list_view.dart';
import 'package:movies/features/home/presentation/view/widgets/home_tap/detatils_view/details_info.dart';
import 'package:movies/features/home/presentation/view_model/details_cubit/details_cubit.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      buildWhen: (previous, current) {
        if (current is DetailsSucessState) {
          return true;
        } else if (current is DetailsLoadingState) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        if (state is DetailsSucessState) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: const Color(0xff1D1E1D),
              title: Text(
                '${state.detailsModel.title}',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 20),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w500${state.detailsModel.backdropPath}',
                    height: 217,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  DetailsInfo(
                    detailsModel: state.detailsModel,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'More Like You',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  CustomSimilarListView(),
                ],
              ),
            ),
          );
        } else if (state is DetailsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container();
        }
      },
    );
  }
}
