class Solution {
  int count(List<List<int>> grid) {
    int islands = 0;
    
    int N = grid.length;
    int M = grid[0].length;
    
    List<List<bool>> visited = List.generate(
      N, 
      (_) => List.filled(M, false)
    );

    void bfs(int row, int column) {
      visited[row][column] = true;
      
      List<(int, int)> queue = [];
      queue.add((row, column));
      int index = 0;

      while (index < queue.length) {
        final (r0, c0) = queue[index];
        index++;
        for (int r = -1; r <= 1; r++) {
          for (int c = -1; c <= 1; c++) {
            int r1 = r0 + r;
            int c1 = c0 + c;
            if (r1 >= 0 && 
                r1 < N && 
                c1 >= 0 && 
                c1 < M && 
                grid[r1][c1] == 1 && 
                !visited[r1][c1]) {
                  visited[r1][c1] = true;
                  queue.add((r1, c1));
                }
          }
        }      
      }
    }

    for (int i = 0; i < N; i++) {
      for (int j = 0; j < M; j++) {
        if (grid[i][j] == 1 && !visited[i][j]) {
          bfs(i, j);
          islands++;
        }
      }
    }

    return islands;
  }
}