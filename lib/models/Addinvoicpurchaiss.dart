class Item {
  int itemId;
  String itemName;
  String itemDes;
  int groupId;
  int categoryId;
  int manufacturerId;
  int supplierId;
  int unitId;
  int locationId;
  String wefDate;
  double mrp;
  double ndp;
  double discount;
  double gst;
  double orderQty;
  double margin;
  double openingStock;
  double stockQty;
  String binNo;
  double salePrice;
  int hsnId;
  String hsnCode;
  String igst;
  String cgst;
  String sgst;
  String cess;
  String alternPartNo;
  double minStock;
  double maxStock;
  double moq;
  double roi;
  int partStatus;
  int status;
  String remarks;
  int createdBy;
  String createdDate;
  int updateBy;
  String updatedDate;

  Item({
    required this.itemId,
    required this.itemName,
    required this.itemDes,
    required this.groupId,
    required this.categoryId,
    required this.manufacturerId,
    required this.supplierId,
    required this.unitId,
    required this.locationId,
    required this.wefDate,
    required this.mrp,
    required this.ndp,
    required this.discount,
    required this.gst,
    required this.orderQty,
    required this.margin,
    required this.openingStock,
    required this.stockQty,
    required this.binNo,
    required this.salePrice,
    required this.hsnId,
    required this.hsnCode,
    required this.igst,
    required this.cgst,
    required this.sgst,
    required this.cess,
    required this.alternPartNo,
    required this.minStock,
    required this.maxStock,
    required this.moq,
    required this.roi,
    required this.partStatus,
    required this.status,
    required this.remarks,
    required this.createdBy,
    required this.createdDate,
    required this.updateBy,
    required this.updatedDate,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      itemId: json['item_Id'],
      itemName: json['item_Name'],
      itemDes: json['item_Des'],
      groupId: json['group_Id'],
      categoryId: json['categoryId'],
      manufacturerId: json['manufacturer_Id'],
      supplierId: json['supplier_Id'],
      unitId: json['unit_Id'],
      locationId: json['location_Id'],
      wefDate: json['wef_Date'],
      mrp: json['mrp'].toDouble(),
      ndp: json['ndp'].toDouble(),
      discount: json['discount'].toDouble(),
      gst: json['gst'].toDouble(),
      orderQty: json['order_Qty'].toDouble(),
      margin: json['margin'].toDouble(),
      openingStock: json['opening_Stock'].toDouble(),
      stockQty: json['stock_Qty'].toDouble(),
      binNo: json['bin_No'],
      salePrice: json['sale_Price'].toDouble(),
      hsnId: json['hsn_Id'],
      hsnCode: json['hsn_Code'],
      igst: json['igst'],
      cgst: json['cgst'],
      sgst: json['sgst'],
      cess: json['cess'],
      alternPartNo: json['alternPartNo'],
      minStock: json['min_Stock'].toDouble(),
      maxStock: json['max_Stock'].toDouble(),
      moq: json['moq'].toDouble(),
      roi: json['roi'].toDouble(),
      partStatus: json['partStatus'],
      status: json['status'],
      remarks: json['remarks'],
      createdBy: json['createdBy'],
      createdDate: json['createdDate'],
      updateBy: json['updateBy'],
      updatedDate: json['updatedDate'],
    );
  }
}