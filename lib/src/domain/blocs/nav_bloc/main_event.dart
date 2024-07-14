import 'package:equatable/equatable.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class NavItemChangedEvent extends MainEvent {
  final int currentIndex;

  const NavItemChangedEvent({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];
}
