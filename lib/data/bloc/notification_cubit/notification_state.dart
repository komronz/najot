part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  NotificationState({this.cardList=const [], this.isRead=true});

  final List<VolunteeringModel> cardList;
  late final bool isRead;


  @override
  // TODO: implement props
  List<Object?> get props => [cardList,isRead];


  NotificationState copyWith({
    List<VolunteeringModel>? list,
    bool? isRead
  }) {
    return NotificationState(
        cardList: list ?? this.cardList,
        isRead: isRead ?? this.isRead
    );
  }
}
