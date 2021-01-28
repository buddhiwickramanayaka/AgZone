class FeedbackForm {
  String _email;
  String _mobileno;
  String _cropType;
  String _landArea;
  String _discription;

  FeedbackForm(
    this._email,
    this._mobileno,
    this._cropType,
    this._landArea,
    this._discription,
  );

  // Method to make GET parameters.
  String toParams() =>
      "?email=$_email&mobileno=$_mobileno&cropType=$_cropType&landArea=$_landArea&discription=$_discription";
}
