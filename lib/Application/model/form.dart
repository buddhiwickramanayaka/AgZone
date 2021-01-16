class FeedbackForm {
  String _email;
  String _mobileNo;
  String _cropType;
  String _landarea;
  String _discription;

  FeedbackForm(
    this._email,
    this._mobileNo,
    this._cropType,
    this._landarea,
    this._discription,
  );

  // Method to make GET parameters.
  String toParams() =>
      "?email=$_email&mobileNo=$_mobileNo&cropType=$_cropType&landarea=$_landarea&discription=$_discription";
}
