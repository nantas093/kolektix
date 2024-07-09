import 'package:intl/intl.dart';

class MyParseDate {
  static String parseGeneralDate(DateTime dateTime, String format){
    DateFormat dateFormat = DateFormat(format);
    return dateFormat.format(dateTime);
  }

  static String getCurrentTime(){
    DateTime dateTime = DateTime.now();
    int hour = dateTime.hour;

    if(hour >=5 && hour <=11){
      return "Good Morning!";
    }
    else if(hour >=11 && hour <= 15){
      return "Good Afternoon!";
    }
    else if(hour >=15 && hour <= 18){
      return "Good Evening!";
    }
    else{
      return "Good Night!";
    }
  }

  static String parseDate(String strDate){
    DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.Z");
    DateFormat dateFormat2 = DateFormat("yyyy-MM-dd");
    var date = dateFormat.parse(strDate);
    return dateFormat2.format(date);
  }

  static String parseBirthDate(String? strDate){
    if(strDate == null){
      return "";
    }
    else{
      DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.Z");
      DateFormat dateFormat2 = DateFormat("dd-MMM-yyyy");
      var date = dateFormat.parse(strDate);
      return dateFormat2.format(date);
    }
  }

  static String parseExperienceDate(String? strDate){
    if(strDate == null){
      return "";
    }
    else{
      DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.Z");
      DateFormat dateFormat2 = DateFormat("MMM-yyyy");
      var date = dateFormat.parse(strDate);
      return dateFormat2.format(date);
    }
  }

  static String parseGeneralDate2(String strDate, String pattern){
    DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.Z");
    DateFormat dateFormat2 = DateFormat(pattern);
    var date = dateFormat.parse(strDate);
    return dateFormat2.format(date);
  }

  static String parseGeneralDate3(String strDate, String firstPattern, String pattern){
    DateFormat dateFormat = DateFormat(firstPattern);
    DateFormat dateFormat2 = DateFormat(pattern);
    var date = dateFormat.parse(strDate);
    return dateFormat2.format(date);
  }

  static DateTime getDateTime(String strDate){
    DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.Z");
    var date = dateFormat.parse(strDate);
    return date;
  }
}