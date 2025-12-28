class Solution {
  int countDominantSubstrings(String s) {
    int answer = 0;

    int N = 0;
    List<int> zeroesIndexes = List.filled(N, N);
    for (int i = N - 2; i >= 0; i--) {
      if (s[i + 1] == "0") {
        zeroesIndexes[i] = i + 1;
      } else {
        zeroesIndexes[i] = zeroesIndexes[i + 1];
      }
    }

    for (int left = 0; left < N; left++) {
      int right = left;
      int zeroes = s[right] == "0" ? 1 : 0;
      
      while (zeroes * zeroes <= N) {
        int nextZeroe = zeroesIndexes[right];
        int ones = (nextZeroe - 1) - left + 1 - zeroes;

        if (ones >= zeroes * zeroes) {
          int physicalLimit = nextZeroe - right;
          int mathLimit = ones - zeroes * zeroes + 1;
          answer += physicalLimit < mathLimit ? physicalLimit : mathLimit;
        }

        if (nextZeroe == N) break;
        right = nextZeroe;
        zeroes++;
      }
    }

    return answer;
  }
}