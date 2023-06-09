// Flutter imports:

// Package imports:
import 'package:bloc/bloc.dart';

// Project imports:
import 'package:inshort_clone/model/news_model.dart';
import 'package:inshort_clone/services/news/news_service.dart';
import 'search_feed_event.dart';
import 'search_feed_state.dart';

class SearchFeedBloc extends Bloc<SearchFeedEvent, SearchFeedState> {
  NewsFeedRepository repository;
  SearchFeedBloc({required this.repository}) : super(SearchFeedInitialState());

  
  SearchFeedState get initialState => SearchFeedInitialState();

  Stream<SearchFeedState> mapEventToState(SearchFeedEvent event) async* {
    if (event is FetchNewsBySearchQueryEvent) {
      yield SearchFeedLoadingState();
      try {
        List<Articles> news =
            await repository.getNewsBySearchQuery(event.query);
        yield SearchFeedLoadedState(news: news);
      } catch (e) {
        yield SearchFeedErrorState(message: e.toString());
      }
    }
  }
}
