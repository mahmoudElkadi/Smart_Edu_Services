class Contacts{
  String name;
  String imageLink;

  Contacts(this.name,this.imageLink);
}

List<Contacts> contacts(){
  return [
    Contacts("Anne","assets/images/image6.webp"),
    Contacts("Kate","assets/images/image7.webp"),
    Contacts("Edwards","assets/images/image2.webp"),
    Contacts("Philip","assets/images/image1.jpg"),
    Contacts("Mark","assets/images/image5.webp"),
    Contacts("Scarlet","assets/images/image8.webp"),
    Contacts("Gary","assets/images/image9.webp"),
  ];
}


class PaymentMethod{
  String payment;
  String orders;
  String amount;

  PaymentMethod(this.payment,this.orders,this.amount);
}

List<PaymentMethod> paymentMethod(){
  return [
    PaymentMethod("Cash","500","600500 EGP"),
    PaymentMethod("Visa/Mastercard","500","600500 EGP"),
    PaymentMethod("Vodafone Cash","500","600500 EGP"),
    PaymentMethod("Cash","500","600500 EGP"),
    PaymentMethod("Cash","500","600500 EGP"),
  ];
}


class TopCashier{
  String cashierName;
  String orders;
  String totalSales;
  String image;

  TopCashier(this.cashierName,this.orders,this.totalSales,this.image);
}

List<TopCashier> topCashier(){
  return [
    TopCashier("Mahmoud Elkady","65","600500 EGP",""),
    TopCashier("Ahmed Elkady","40","600500 EGP",""),
    TopCashier("Mohamed ElHamzawy","30","600500 EGP",""),
    TopCashier("Ziad Gaafar","30","600500 EGP",""),
    TopCashier("Amr Badr","30","600500 EGP",""),

  ];
}


class TopProduct{
  String product;
  String amount;
  String price;
  String image;

  TopProduct(this.product,this.amount,this.price,this.image);
}

List<TopProduct> topProduct(){
  return [
    TopProduct("Toy","12","600500 EGP",""),
    TopProduct("Laptop","50","600500 EGP",""),
    TopProduct("Mobile","0","600500 EGP",""),
    TopProduct("Monitor","0","600500 EGP",""),
    TopProduct("Bike","14","600500 EGP",""),

  ];
}


class TopProductID{
  String id;
  String itemCount;
  String salesMan;
  String price;
  String profit;
  String commission;
  String date;

  TopProductID(this.id,this.itemCount,this.salesMan,this.price,this.profit,this.commission,this.date);
}

List<TopProductID> topProductID(){
  return [
    TopProductID("123456","4","Khaled Mohamed","6005 ","500","60","21-5-2023"),
    TopProductID("123457","1","Mohamed Elsayed","6000 ","200","70","22-5-2023"),
    TopProductID("123458","20","Yasser Ahmed","6500 ","230","20","25-5-2023"),
    TopProductID("123459","25","Mahmoud Elkady","6000 ","320","26","18-5-2023"),
    TopProductID("1234560","3","Ahmed Youssef","500 ","560","55","09-5-2023"),
    TopProductID("1234561","7","Youssef Elmahy","5050 ","120","95","14-5-2023"),
    TopProductID("1234562","12","Shehab Ahmed","6050 ","340","120","26-5-2023"),
    TopProductID("1234563","8","Amr Badr","6050 ","620","350","30-5-2023"),
    TopProductID("1234564","13","Ziad Gaafar","6600 ","410","75","05-5-2023"),

  ];
}

