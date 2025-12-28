List<int> mergeSort(List<int> arr) {
  if (arr.length <= 1) return arr;

  int mid = arr.length ~/ 2;

  List<int> left = mergeSort(arr.sublist(0, mid));
  List<int> right = mergeSort(arr.sublist(mid));

  return merge(left, right);
}

List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];

  int i = 0, j = 0;

  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      result.add(left[i++]);
    } else {
      result.add(right[j++]);
    }
  }

  while (i < left.length) {
    result.add(left[i++]);
  }

  while (j < right.length) {
    result.add(right[j++]);
  }

  return result;
}