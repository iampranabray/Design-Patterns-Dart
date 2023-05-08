void main(){
  UPI sbi = Sbi();
  UPI hdfc = HDFC();
  print(sbi.bankUpi(upiId: "pranab@oksbi.com"));
  print("###########");
  print(hdfc.bankUpi(upiId: "pranab@hdfc.com"));
  
}


abstract class UPI{
  String? bankUpi({String? upiId});
  
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
