import 'package:credixco_intern/data/models/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type,Params>{
  //Type -> What the UseCase returns (Output)
  //Params -> The parameters that have to be passed into the API Call
  Future <Either<AppError,Type>> call(Params params);
}