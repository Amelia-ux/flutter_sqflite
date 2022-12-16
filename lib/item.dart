class Item {
  late int id;
  late String _itemId;
  late String _name;
  late int _price;
  late int _stock;

  Item(this._itemId, this._name, this._price, this._stock);

  Item.map(dynamic obj) {
    this._itemId = obj['item_id'];
    this._name = obj['name'];
    this._price = obj['price'];
    this._stock = obj['stock'];
  }

  String get itemId => _itemId;
  String get name => _name;
  int get price => _price;
  int get stock => _stock;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    map['item_id'] = _itemId;
    map['name'] = _name;
    map['price'] = _price;
    map['stock'] = _stock;
    return map;
  }

  void setItemId(int id) {
    this.id = id;
  }
}