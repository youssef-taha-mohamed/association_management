import 'package:equatable/equatable.dart';

// import '../../../presentation/forget_password/view_model/forget_password.dart';

final class VerifyResetPasswordOTPViewParameters extends Equatable {
  const VerifyResetPasswordOTPViewParameters({
    required this.phone,
    required this.email,
   // required this.mode,
    required this.countryID,
  });

  final String? phone;
  final String? email;
  final int? countryID;
 // final ForgetPasswordMode mode;
  
  @override
  // TODO: implement props
  List<Object?> get props => [];

 
}
