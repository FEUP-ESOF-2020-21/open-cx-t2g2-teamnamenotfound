int parseDateToInt(String date) {
  String ret = "";

  for(int i = 0; i < date.length; i++){
    if(date[i] != "-") ret += date[i];
  }

  return int.parse(ret);
}

String parseDateToString(DateTime dateTime) {
  return dateTime.year.toString() + "-" + dateTime.month.toString() + "-" + dateTime.day.toString();
}

String parseTimeToString(int hour, int minute) {
  return hour.toString() + ":" + minute.toString();
}

int parseHourToInt(String hour) {
  String ret = "";

  for(int i = 0; i < hour.length; i++){
    if(hour[i] != ":") ret += hour[i];
  }

  return int.parse(ret);
}