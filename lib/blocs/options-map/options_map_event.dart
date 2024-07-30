part of 'options_map_bloc.dart';

sealed class OptionsMapEvent extends Equatable {
  const OptionsMapEvent();

  @override
  List<Object> get props => [];
}

class OnChangeOptions extends OptionsMapEvent {
  final MapOptions options;
  const OnChangeOptions(this.options);
}

class OnChangeDetailView extends OptionsMapEvent {
  final DetailCC detailView;
  const OnChangeDetailView(this.detailView);
}

class OnChangeDetailMap extends OptionsMapEvent {
  final MapType detailMap;
  const OnChangeDetailMap(this.detailMap);
}

class OnChangeSearchPageMap extends OptionsMapEvent {
  final bool isSearchPageMap;
  const OnChangeSearchPageMap(this.isSearchPageMap);
}
