class Contact{
  int id;
  String name;
  String village;
  String phone;
  String qty;
  String rate;
  String total;
  String collection;
  String due;

  Contact(
  {
    this.id,
    this.name,
    this.village,
    this.phone,
    this.qty,
    this.rate,
    this.total,
    this.collection,
    this.due,
  }
  );

  int get contactId  => id;

  String get contactName=> name;

  String get contactVillage=> village;

  String get contactPhone=> phone;

  String get contactQty=> qty;

  String get contactRate=> rate;

  String get contactTotal=> total;

  String get contactCollection=> collection;

  String get contactDue=> due;

  factory Contact.fromJson(Map<String, dynamic> data) => new Contact(
    id: data["id"],
    name: data["name"],
    village: data["village"],
    phone: data["phone"],
    qty: data["qty"],
    rate: data["rate"],
    total: data["total"],
    collection: data["collection"],
    due: data["due"],
  );

  Map<String, dynamic> toMap() => {
    "id":id,
    "name":name,
    "Village":village,
    "phone":phone,
    "qty":qty,
    "rate":rate,
    "total":total,
    "collection":collection,
    "due":due,
  };
}