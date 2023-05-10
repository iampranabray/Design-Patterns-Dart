import 'dart:convert';

import 'package:xml/xml.dart';

import 'UpiData_model.dart';
import 'adapter_data.dart';

main() {
  JsonData jsonData = JsonData();
  XmlData xmlData = XmlData();
  print(jsonData.json);
  print(xmlData.xml);

  InterfaceAdapter adapter = Adapter();
  adapter.getJsonUpiData(jsonData.json);
  adapter.getXmlUpiData(xmlData.xml);
}

abstract class InterfaceAdapter {
  UpiData getJsonUpiData(Map<String, dynamic> data);
  UpiData getXmlUpiData(String data);
}

class Adapter extends InterfaceAdapter {
  @override
  UpiData getJsonUpiData(Map<String, dynamic> data) {
    return UpiData.fromJson(data);
  }

  @override
  UpiData getXmlUpiData(String data) {
    // var jsonData = jsonDecode(data);
    //print(jsonData.runtimeType);
    // return UpiData(upi: ,id: );

    final xmlDocument = XmlDocument.parse(data);
    final upiDataList = <UpiData>[];

    return upiDataList;
  }
}

enum DataType { json, xml }
