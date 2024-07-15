class MyFunctions {
  // static const DATE_FORMAT = 'dd/MM/yyyy';
  // static String formattedDate(DateTime? dateTime) {
  //   if (dateTime == null) {
  //     return 'xx.xx.xxxx';
  //   } else {
  //     return DateFormat(DATE_FORMAT).format(dateTime);
  //   }
  // }
  static bool validatePhoneNumber(String phoneNumber) {
    // O'zbekiston telefon raqami uchun regular ifoda
    const pattern = r'^\+998 \d{2} \d{3} \d{2} \d{2}$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(phoneNumber);
  }
  static String getShifrPhone(String string) {
    if (string.isNotEmpty) {
      return " **********${string.substring(string.length - 2)}";
    } else {
      return " **********";
    }
  }
  //
  // static int changeNegativeToPositive(int number) {
  //   if (number < 0) {
  //     return number * -1;
  //   } else {
  //     return number;
  //   }
  // }
  //
  // static int discountPrice(int discount, int price) {
  //   int eprice = 0;
  //   if (discount > 0) {
  //     eprice = price + price * discount ~/ 100;
  //   } else if (discount < 0) {
  //     eprice = price + price * discount ~/ 100;
  //   } else {
  //     eprice = price;
  //   }
  //   return price - eprice;
  // }
  //
  // static String discount(int discount, int price) {
  //   int eprice = 0;
  //   if (discount > 0) {
  //     eprice = price + price * discount ~/ 100;
  //   } else if (discount < 0) {
  //     eprice = price + price * discount ~/ 100;
  //   } else {
  //     eprice = price;
  //   }
  //   return getThousandsSeparatedPrice(eprice.toString());
  // }
  //
  // static String parseDate(String date) {
  //   var myDate = DateTime.parse(date);
  //   return DateFormat(DATE_FORMAT).format(myDate);
  // }
  //
  // static void showSheet(
  //     BuildContext context, {
  //       required Widget child,
  //       required VoidCallback onClicked,
  //     }) =>
  //     showCupertinoModalPopup(
  //       context: context,
  //       builder: (context) => CupertinoActionSheet(
  //         actions: [child],
  //         cancelButton: CupertinoActionSheetAction(
  //           onPressed: onClicked,
  //           child: const Text('Done'),
  //         ),
  //       ),
  //     );
  //
  // static String getFilter(int count) {
  //   switch (count) {
  //     case 3:
  //       return 'Tugallanmagan buyurtmalar';
  //     case 1:
  //       return 'Tugallangan buyurtmalar';
  //     default:
  //       return 'Hamma buyurtmalar keldi';
  //   }
  // }
  //
  // static ColorFilter? getColor(int i) {
  //   switch (i) {
  //     case 1:
  //       return null;
  //     case 2:
  //       return const ColorFilter.mode(Colors.orange, BlendMode.srcIn);
  //     default:
  //       return const ColorFilter.mode(greyText, BlendMode.srcIn);
  //   }
  // }
  //
  // static String getThousandsSeparatedPrice(String price) {
  //   var priceInText = '';
  //   price = price.replaceAll('.0', '');
  //   var counter = 0;
  //   for (var i = price.length - 1; i >= 0; i--) {
  //     counter++;
  //     var str = price[i];
  //     if ((counter % 3) != 0 && i != 0) {
  //       priceInText = '$str$priceInText';
  //     } else if (i == 0) {
  //       priceInText = '$str$priceInText';
  //     } else {
  //       priceInText = ' $str$priceInText';
  //     }
  //   }
  //   return priceInText.trim();
  // }
  //
  // static String getFormatCost(String cost) {
  //   if (cost.isEmpty) return '';
  //   var oldCost = cost;
  //   if (cost.contains('.')) {
  //     final arr = cost.split('.');
  //     oldCost = arr.first;
  //   }
  //   var newCost = '';
  //   for (var i = 0; i < oldCost.length; i++) {
  //     if ((oldCost.length - i) % 3 == 0) newCost += ' ';
  //     newCost += oldCost[i];
  //   }
  //   return newCost.trimLeft();
  // }
  //
  // static String getClockFormat(String date) {
  //   DateTime dateTime = DateTime.parse(date);
  //
  //   String formattedDateTime = DateFormat('dd-MM-yyyy HH:mm').format(dateTime);
  //
  //   return formattedDateTime;
  // }
  //
  // static String ageDate(DateTime dateTime) {
  //   String formattedDateTime = DateFormat('yyyy-MM-dd').format(dateTime);
  //
  //   return formattedDateTime;
  // }
  //
  // static String getClockFormat2(String date) {
  //   DateTime dateTime = DateTime.parse(date);
  //
  //   String formattedDateTime = DateFormat('HH:mm dd.MM.yyyy').format(dateTime);
  //
  //   return formattedDateTime;
  // }
  //
  // static String getformCloc(String date) {
  //   DateTime dateTime = DateTime.parse(date).toLocal();
  //
  //   String formattedDateTime = DateFormat('HH:mm').format(dateTime);
  //
  //   return formattedDateTime;
  // }
  //
  // static String getformDate(String date) {
  //   DateTime dateTime = DateTime.parse(date);
  //
  //   String formattedDateTime = DateFormat('HH:mm dd.MM.yyyy').format(dateTime);
  //
  //   return formattedDateTime;
  // }
  //
  // static String clockform(String date) {
  //   if (date.length > 6) {
  //     final a = date.substring(0, 5);
  //     return a;
  //   }
  //
  //   return date;
  // }
  //
  // static int weekday(String day) {
  //   switch (day) {
  //     case "mon":
  //       return 1;
  //     case "tue":
  //       return 2;
  //     case "wed":
  //       return 3;
  //     case "thu":
  //       return 4;
  //     case "fri":
  //       return 5;
  //     case "sat":
  //       return 6;
  //     case "sun":
  //       return 7;
  //     default:
  //       return 0;
  //   }
  // }
  //
  // static String payment(int id) {
  //   switch (id) {
  //     case 1:
  //       return "Cash";
  //     case 2:
  //       return "Terminal";
  //     case 3:
  //       return "Online";
  //     case 4:
  //       return "From debt";
  //     case 5:
  //       return "Payment Merchant";
  //     case 6:
  //       return "Transition";
  //     case 7:
  //       return "HUMO";
  //     case 8:
  //       return "UZCARD";
  //     case 9:
  //       return "VISA";
  //     case 10:
  //       return "MASTERCARD";
  //     case 11:
  //       return "ANORBANK";
  //     default:
  //       return "Cash";
  //   }
  // }
  //
  // static Color paymentColor(int id) {
  //   switch (id) {
  //     case 1:
  //       return lightBlue;
  //     case 2:
  //       return greyText;
  //     case 3:
  //       return green;
  //     case 4:
  //       return Colors.brown;
  //     case 5:
  //       return Colors.amber;
  //     case 6:
  //       return Colors.purple;
  //     case 7:
  //       return const Color(0xFF364652);
  //     case 8:
  //       return const Color(0xFF00397f);
  //     case 9:
  //       return blue;
  //     case 10:
  //       return orang;
  //     case 11:
  //       return const Color(0xFF98120D);
  //     default:
  //       return lightBlue;
  //   }
  // }
}
