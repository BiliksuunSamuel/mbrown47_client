import 'package:simple_moment/simple_moment.dart';

String formatMoment(dynamic datetime) {
  Moment rawDate = Moment.parse(datetime);
  return rawDate.format("dd/MM/yyyy");
}
