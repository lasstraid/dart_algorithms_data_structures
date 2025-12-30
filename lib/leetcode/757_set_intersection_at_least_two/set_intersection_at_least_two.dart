/*
You are given a 2D integer array intervals where intervals[i] = [starti, endi] 
represents all the integers from starti to endi inclusively.

A containing set is an array nums where each interval from intervals has at 
least two integers in nums.

For example, if intervals = [[1,3], [3,7], [8,9]], then [1,2,4,7,8,9] and [2,3,4,8,9] 
are containing sets.

Return the minimum possible size of a containing set. 

Example 1:

Input: intervals = [[1,3],[3,7],[8,9]]
Output: 5
Explanation: let nums = [2, 3, 4, 8, 9].
It can be shown that there cannot be any containing array of size 4.

Example 2:

Input: intervals = [[1,3],[1,4],[2,5],[3,5]]
Output: 3
Explanation: let nums = [2, 3, 4].
It can be shown that there cannot be any containing array of size 2.

Example 3:

Input: intervals = [[1,2],[2,3],[2,4],[4,5]]
Output: 5
Explanation: let nums = [1, 2, 3, 4, 5].
It can be shown that there cannot be any containing array of size 4.

Constraints:

1 <= intervals.length <= 3000
intervals[i].length == 2
0 <= starti < endi <= 10
*/

class Solution {
  void swap(List arr, int right, int left) {
    final temp = arr[right];
    arr[right] = arr[left];
    arr[left] = temp;
  }

  bool compare(List<int> left, List<int> right) {
    if (left[1] != right[1]) return left[1] < right[1];
    return left[0] > right[0];
  }

  void quicksort(List<List<int>> arr, int i, int j) {
    if (i < j) {
      int index = partition(arr, i, j);
      quicksort(arr, i, index - 1);
      quicksort(arr, index + 1, j);
    }
  }

  int partition(List<List<int>> arr, int left, int right) {
    int low = left - 1;
    int high = right + 1;
    List<int> pivot = arr[(low + high) ~/ 2];  
    
    while (true) {
      do {
        low++;
      } while (compare(arr[low], pivot));
      
      do {
        high--;
      } while (compare(pivot, arr[high]));

      if (low >= high) return high;

      swap(arr, low, high);
    }
  }

  int solution(List<List<int>> intervals) {
      quicksort(intervals, 0, intervals.length - 1);
      
      int answer = 0;
      int x1 = -1;
      int x2 = -1;
      for (final interval in intervals) {
        if (x2 < interval[0]) {
          answer+= 2;
          x1 = interval[1] - 1;
          x2 = interval[1];
        } else if(x1 < interval[0]) {
          answer++;
          if (x2 == interval[1]) {
            x1 = x2 - 1;
          } else {
            x1 = x2;
            x2 = interval[1];
          }
        }
      }

      return answer;
    }
}