class JsonData {
  var json = {
    "UPI": [
      {"id": "pranabxx@hdfc.com", "bank": "hdfc"},
      {"id": "pranabxsd@oksbi.com", "bank": "sbi"},
    ],
    "ID": [
      {"id": "2345 5666 8787", "type": "aadhar"},
      {"id": "DWMAR23344k", "type": "pan"}
    ]
  };
}

class XmlData {
  var xml = '''<?xml version="1.0" encoding="UTF-8" ?>
<root>
  <UPI>
    <id>pranabxx@hdfc.com</id>
    <bank>hdfc</bank>
  </UPI>
  <UPI>
    <id>pranabxsd@oksbi.com</id>
    <bank>sbi</bank>
  </UPI>
  <ID>
    <id>2345 5666 8787</id>
    <type>aadhar</type>
  </ID>
  <ID>
    <id>DWMAR23344k</id>
    <type>pan</type>
  </ID>
</root>''';
}
