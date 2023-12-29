String getDayName(DateTime date) {
  int dayOfWeek = date.weekday;
  switch (dayOfWeek) {
    case 1:
      return 'Monday';
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thursday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    case 7:
      return 'Sunday';
    default:
      return 'Invalid day';
  }
}

class Month {
  final String name;
  final int index;

  Month({required this.name, required this.index});
}

List<Month> months = [
  Month(name: "January", index: 1),
  Month(name: "February", index: 2),
  Month(name: "March", index: 3),
  Month(name: "April", index: 4),
  Month(name: "May", index: 5),
  Month(name: "June", index: 6),
  Month(name: "July", index: 7),
  Month(name: "August", index: 8),
  Month(name: "September", index: 9),
  Month(name: "October", index: 10),
  Month(name: "November", index: 11),
  Month(name: "December", index: 12),
];
