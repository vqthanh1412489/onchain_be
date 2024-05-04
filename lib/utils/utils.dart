List<String> insertZeroAfterAddress(
  List<String> originalArray,
  int dayNotFound,
  String address,
) {
  // Tìm vị trí của phần tử address trong mảng ban đầu
  int index = originalArray.indexOf(address);

  // Nếu không tìm thấy phần tử address trong mảng, trả về mảng ban đầu
  if (index == -1 || dayNotFound <= 0) {
    return originalArray;
  }

  // Tạo mảng mới bằng cách sao chép các phần tử trước và sau address,
  // và chèn "0" vào giữa
  List<String> newArray = [];
  newArray.addAll(originalArray.sublist(0, index + 1));
  newArray.addAll(List.filled(dayNotFound, "0"));
  newArray.addAll(originalArray.sublist(index + 1));

  return newArray;
}
