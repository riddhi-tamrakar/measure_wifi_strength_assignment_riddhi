class HomeModel {
  final List<WidgetConfig> widgets;

  HomeModel({required this.widgets});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    List<WidgetConfig> widgetList = (json['widgets'] as List)
        .map((item) => WidgetConfig.fromJson(item))
        .toList();
    return HomeModel(widgets: widgetList);
  }
}

class WidgetConfig {
  final String type;
  final dynamic data;

  WidgetConfig({required this.type, required this.data});

  factory WidgetConfig.fromJson(Map<String, dynamic> json) {
    return WidgetConfig(
      type: json['type'],
      data: json['data'],
    );
  }
}
