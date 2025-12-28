void swap(List<int> arr, int i, int j) {
  int temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}

int partition(List<int> arr, int low, int high) {
  int i = low - 1;
  int j = high + 1;
  int pivot = arr[(low + high) ~/ 2];
  while (true) {
    do {
      i++;
    } while (arr[i] < pivot);

    do {
      j--;
    } while (arr[j] > pivot);

    if (i >= j) return j;

    swap(arr, i, j);
  }
}

void quicksort(List<int> arr, int low, int high) {
  if (low < high) {
    int index = partition(arr, low, high);
    quicksort(arr, low, index - 1);
    quicksort(arr, index + 1, high);
  }
}