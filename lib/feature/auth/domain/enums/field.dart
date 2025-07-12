enum AuthField {
  bio(name: 'Bio', value: 'bio'),
  birthDay(name: 'Birthday', value: 'birthday'),
  countryId(name: 'Country ID', value: 'country_id'),
  email(name: 'Email', value: 'email'),
  userName(name: 'UserName', value: 'username'),
  fcmToken(name: 'FCM Token', value: 'token'),
  firstName(name: 'First Name', value: 'first_name'),
  gender(name: 'Gender', value: 'gender'),
  lastName(name: 'Last Name', value: 'last_name'),
  otp(name: 'OTP', value: 'otp'),
  password(name: 'Password', value: 'password'),
  passwordConfirmation(
    name: 'Password Confirmation',
    value: 'password_confirmation',
  ),
  phone(name: 'Phone', value: 'phone'),
  role(name: 'Role', value: 'role'),
  socialMedia(name: 'Social Media', value: 'method_id'),
  token(name: 'Token', value: 'token');

  const AuthField({
    required this.name,
    required this.value,
  });

  final String name;
  final String value;
}
