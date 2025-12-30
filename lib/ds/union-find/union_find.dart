class UnionFind {
  late List<int> rank;
  late List<int> parent;

  UnionFind(int n) {
    rank = List.generate(n, (_) => 0);
    parent = List.generate(n, (i) => i);
  }

  int find(int x) {
    if (parent[x] != x) {
      parent[x] = find(parent[x]);
    }
    return parent[x];
  }

  void union(int x, int y) {
    int rootX = find(x);
    int rootY = find(y);

    if (rootY == rootX) return;

    if (rank[rootX] < rank[rootY]) {
      parent[rootX] = rootY;
    } else if (rank[rootY] < rank[rootX]) {
      parent[rootY] = rootX;
    } else {
      parent[rootY] = rootX;
      rank[rootX]++;
    }
  }
}