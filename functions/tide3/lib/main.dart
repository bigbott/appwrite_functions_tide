import 'dart:async';
import 'dart:convert';

import 'package:starter_template/city_service.dart';
import 'package:starter_template/tide_service.dart';

// This Appwrite function will be executed every time your function is triggered
Future<dynamic> main(final context) async {
  // final cityName  = 'Panama'; //for test
  context.log(context.req.bodyJson['cityName']);
  final cityService = CityService();
  final tideService = TideService();
  final coordinates =
      await cityService.getCoordinates(context.req.bodyJson['cityName']);
  final data = await tideService.getTideData(
    coordinates['latitude']!,
    coordinates['longitude']!,
  );

  // return context.res.json(
  //   data, 200
  // );

  return context.res.text(jsonEncode(data));
}
