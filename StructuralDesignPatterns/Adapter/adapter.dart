import 'package:xml/xml.dart';

import 'UpiData_model.dart';
import 'adapter_data.dart';

main() {
  InterfaceAdapter adapter = Adapter();
  UpiData jsonAdapterData = adapter.getJsonUpiData(JsonData().json);
  UpiData jsonXmlData = adapter.getXmlUpiData(XmlData().xml);

  //json id data
  jsonAdapterData.id?.forEach((element) {
    print('####### json id data');
    print('auth id: ${element.id}');
    print('bank name: ${element.type}\n');
  });
  //json upi data
  jsonAdapterData.upi?.forEach((element) {
    print('####### json upi data');
    print("upi id: ${element.id}");
    print("bank name: ${element.bank}\n");
  });
  //xml id data
  jsonXmlData.id?.forEach((element) {
    print('####### xml id data');
    print('auth id: ${element.id}');
    print('bank name: ${element.type}\n');
  });
  //xml upi data
  jsonXmlData.upi?.forEach((element) {
    print('####### xml upi data');
    print('upi id: ${element.id}');
    print('bank name: ${element.bank}\n');
  });
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
    final xmlDocument = XmlDocument.parse(data);
    final upiIdList = <Upi>[];
    final idIDList = <Id>[];

    for (final UPI in xmlDocument.findAllElements('UPI')) {
      final id = UPI.findElements('id').single.innerText;
      final bank = UPI.findElements('bank').single.innerText;

      upiIdList.add(Upi(id: id, bank: bank));
    }
    for (final ID in xmlDocument.findAllElements('ID')) {
      final id = ID.findElements('id').single.innerText;
      final type = ID.findElements('type').single.innerText;
      idIDList.add(Id(id: id, type: type));
    }

    return UpiData(id: idIDList, upi: upiIdList);
  }
}

enum DataType { json, xml }
