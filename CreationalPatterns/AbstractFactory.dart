
void main(){
  
  
  List<PersonDgiIdFactory> bankAccount = [PersonSBIAccount(),PersonHDFCAccount()] ;
  
  
  bankAccount[0].upi().bankUpi(upiId: "pranab@oksbi.com");
  bankAccount[0].id(type: "aadhar").id(id:"2345 5666 8787");
  print("###########");
  bankAccount[1].upi().bankUpi(upiId: "pranab@hdfc.com");
  bankAccount[1].id(type: "PAN").id(id:"DWMAR23344k");
  
}
//abstract factory interface
abstract class  PersonDgiIdFactory {
  UPI upi();
  ID id({String? type});
}
//UPI abstract class...concentrated factory 1
abstract class UPI{
  String? bankUpi({String? upiId});
  
}

//ID abstract class ...concentrated factory 2
abstract class ID{
  String? id({String? id});
}



//eg. either or id is enough here in this example
class PanId extends ID{
  @override
  String? id({String? id}){
    print('pan***** $id');
    return id;
  }
}

class AAdharId extends ID{
  @override
  String? id({String? id}){
    print('aadharid***** $id');
    return id;
  }
}



class PersonSBIAccount extends PersonDgiIdFactory{
  @override
 UPI upi(){
    return Sbi();
  }
  @override
 ID id({String? type}){
   if(type=="aadhar"){
      return AAdharId();
   }
   else{
     return PanId();
   }
   
  }
}

class PersonHDFCAccount extends PersonDgiIdFactory{
  @override
 UPI upi(){
    return HDFC();
  }
  @override
 ID id({String? type}){
   if(type=="aadhar"){
      return AAdharId();
   }
   else{
     return PanId();
   }
   
  }
}


class Sbi extends UPI{
  @override
  String? bankUpi({String? upiId}){
    print("concentrated Upi from SBI Bank of UPI id $upiId *****");
    return "SBI UPI";
  }
}

class HDFC extends UPI{
  @override
  String? bankUpi({String? upiId}){
     print("concentrated Upi from HDFC Bank of UPI id $upiId *****");
    return "HDFC UPI";
  }
}
