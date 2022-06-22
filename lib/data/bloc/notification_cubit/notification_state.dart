part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  const NotificationState({required this.cardList});

  final List<VolunteeringModel> cardList;

  @override
  // TODO: implement props
  List<Object?> get props => [cardList];

  NotificationState copyWith({List<VolunteeringModel>? list}) {
    return NotificationState(cardList: list ?? cardList);
  }
}
