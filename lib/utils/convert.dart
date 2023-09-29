Map<String, dynamic> convertObjectMapToDynamicMap(
    Map<String, Object?> objectMap) {
  Map<String, dynamic> dynamicMap = {};

  objectMap.forEach((key, value) {
    if (value is Map<String, Object>) {
      dynamicMap[key] = convertObjectMapToDynamicMap(value);
    } else {
      dynamicMap[key] = value;
    }
  });

  return dynamicMap;
}
