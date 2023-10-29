import 'package:equatable/equatable.dart';

class RandomImageEntity extends Equatable {
  const RandomImageEntity({
    this.message,
  });
  final String? message;
  @override
  List<Object?> get props => [
        message,
      ];
}
