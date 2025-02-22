import 'package:flutter/material.dart';

class UIComponent {
  List<ViewType> viewTypeList;
  List<ThemeColor> themeColors;

  UIComponent({
    required this.viewTypeList,
    required this.themeColors
  });

  factory UIComponent.fromJson(Map<String, dynamic> json) {
    return UIComponent(
      viewTypeList: (json['ViewtypeList'] as List)
          .map((e) => ViewType.fromJson(e))
          .toList(),
      themeColors: (json['theme_colors'] as List)
          .map((e) => ThemeColor.fromJson(e))
          .toList(),
    );
  }
}

class ViewType {
  String viewtype;
  String datatype;
  String title;
  List<dynamic> filter;
  String designtype;
  List<Banners>? banners;
  List<Category>? categories;
  List<Product>? products;
  List<Seller>? sellers;

  ViewType({
    required this.viewtype,
    required this.datatype,
    required this.title,
    required this.filter,
    required this.designtype,
    this.banners,
    this.categories,
    this.products,
    this.sellers,
  });

  factory ViewType.fromJson(Map<String, dynamic> json) {
    return ViewType(
      viewtype: json['viewtype'],
      datatype: json['datatype'],
      title: json['title'],
      filter: json['filter'] != null ? json['filter'] : [],
      designtype: json['designtype'],
      banners: (json['data'] as List?)
          ?.where((item) => item['banner_name'] != null)
          .map((e) => Banners.fromJson(e))
          .toList(),
      categories: (json['data'] as List?)
          ?.where((item) => item['cat_name'] != null)
          .map((e) => Category.fromJson(e))
          .toList(),
      products: (json['data'] as List?)
          ?.where((item) => item['product_name'] != null)
          .map((e) => Product.fromJson(e))
          .toList(),
      sellers: (json['data'] as List?)
          ?.where((item) => item['seller_details'] != null)
          .map((e) => Seller.fromJson(e))
          .toList(),
    );
  }
}

class Banners {
  String bannerName;
  String imageUrl;
  String redirectTo;
  String redirectId;

  Banners({
    required this.bannerName,
    required this.imageUrl,
    required this.redirectTo,
    required this.redirectId,
  });

  factory Banners.fromJson(Map<String, dynamic> json) {
    return Banners(
      bannerName: json['banner_name'],
      imageUrl: json['appbanner_image'],
      redirectTo: json['redirect_to'],
      redirectId: json['redirect_id'],
    );
  }
}

class Category {
  int id;
  String catName;
  String catImage;

  Category({
    required this.id,
    required this.catName,
    required this.catImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      catName: json['cat_name'],
      catImage: json['cat_image'],
    );
  }
}

class Product {
  int id;
  double price;
  double discountedPrice;
  String discount;
  String imageUrl;
  String productName;
  String productDes;
  String? lastOrderDate;
  List<Weight> weight;
  int sizeId;
  String sellerName;
  int sellerId;
  String sellerImage;
  int vegType;
  String returnable;
  int favStatus;
  String? favIcon;
  String time;
  var distance;
  // var rating;
  var review;

  Product({
    required this.id,
    required this.price,
    required this.discountedPrice,
    required this.discount,
    required this.imageUrl,
    required this.productName,
    required this.productDes,
    this.lastOrderDate,
    required this.weight,
    required this.sizeId,
    required this.sellerName,
    required this.sellerId,
    required this.sellerImage,
    required this.vegType,
    required this.returnable,
    required this.favStatus,
    this.favIcon,
    required this.time,
    required this.distance,
    // required this.rating,
    required this.review,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      price: json['price'],
      discountedPrice: json['discounted_price'],
      discount: json['discount'],
      imageUrl: json['image'],
      productName: json['product_name'],
      productDes: json['product_des'],
      lastOrderDate: json['last_orderdate'],
      weight: json['weight'] != null
          ? (json['weight'] as List).map((e) => Weight.fromJson(e)).toList()
          : [],
      sizeId: json['sizeid'],
      sellerName: json['seller_name'],
      sellerId: json['seller_id'],
      sellerImage: json['seller_image'],
      vegType: json['veg_type'],
      returnable: json['returnable'] ?? "",
      favStatus: json['fav_status'],
      favIcon: json['fav_icon'] ?? "",
      time: json['time'] ?? "",
      distance: json['distance'],
      // rating: double.parse(json['rating']) ?? 0.0,
      review: json['review'] ?? '0',
    );
  }
}

class Weight {
  int id;
  String weight;

  Weight({
    required this.id,
    required this.weight,
  });

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      id: json['id'],
      weight: json['weight'],
    );
  }
}

class Seller {
  SellerDetails sellerDetails;

  Seller({
    required this.sellerDetails,
  });

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      sellerDetails: SellerDetails.fromJson(json['seller_details']),
    );
  }
}

class SellerDetails {
  String sellerName;
  int sellerId;
  // double sellerRating;
  String sellerAddress;
  String sellerImage;
  String sellerOneLineDescription;
  String sellerLongDescription;
  int vegType;
  List<PopularProduct> sellerPopularProducts;

  SellerDetails({
    required this.sellerName,
    required this.sellerId,
    // required this.sellerRating,
    required this.sellerAddress,
    required this.sellerImage,
    required this.sellerOneLineDescription,
    required this.sellerLongDescription,
    required this.vegType,
    required this.sellerPopularProducts,
  });

  factory SellerDetails.fromJson(Map<String, dynamic> json) {
    return SellerDetails(
      sellerName: json['seller_name'],
      sellerId: json['seller_id'],
      // sellerRating: json['seller_rating'] != null
      //     ? double.parse(json['seller_rating'])
      //     : 0.0,
        sellerAddress: json['seller_address'],
        sellerImage: json['seller_image'],
        sellerOneLineDescription: json['seller_one_line_description'],
        sellerLongDescription: json['seller_long_description'] ?? '',
        vegType: json['veg_type'],
        sellerPopularProducts: (json['seller_popular_products'] as List)
            .map((e) => PopularProduct.fromJson(e))
            .toList(),
    );
  }
}

class PopularProduct {
  int prodId;
  String prodName;
  String prodDescription;
  double prodPrice;
  String prodImage;

  PopularProduct({
    required this.prodId,
    required this.prodName,
    required this.prodDescription,
    required this.prodPrice,
    required this.prodImage,
  });

  factory PopularProduct.fromJson(Map<String, dynamic> json) {
    return PopularProduct(
      prodId: json['prod_id'],
      prodName: json['prod_name'],
      prodDescription: json['prod_description'],
      prodPrice: json['prod_price'],
      prodImage: json['prod_image'],
    );
  }
}

class ThemeColor {
  final List<Color> bgColor;
  final String serviceId;
  final List<Color> txtTitleColor;
  final List<Color> txtColor;
  final List<Color> prdColor;
  final List<Color> catColor;

  ThemeColor({
    required this.bgColor,
    required this.serviceId,
    required this.txtTitleColor,
    required this.txtColor,
    required this.prdColor,
    required this.catColor,
  });

  // Helper function to convert comma-separated hex values into a List<Color>
  static List<Color> _parseColorList(String colorString) {
    return colorString
        .split(',')
        .map((hex) => Color(int.parse(hex.trim().replaceFirst('#', '0xff'))))
        .toList();
  }

  factory ThemeColor.fromJson(Map<String, dynamic> json) {
    return ThemeColor(
      bgColor: _parseColorList(json['bg_clr']),
      serviceId: json['service_id'],
      txtTitleColor: _parseColorList(json['txt_title_clr']),
      txtColor: _parseColorList(json['txt_clr']),
      prdColor: _parseColorList(json['prd_clr']),
      catColor: _parseColorList(json['cat_clr']),
    );
  }
}

