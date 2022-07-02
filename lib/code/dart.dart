class DART {
  static Map code = {
    "Depth_First_Search": """import 'dart:collection';
import 'package:test/test.dart';

/// Implementation of Depth First Search
/// https://en.wikipedia.org/wiki/Depth-first_search

class Graph {
  /// Adjacency List representation using dynamic list and HashMap
  HashMap graph = new HashMap<int, List<dynamic>>();
  List<int> nodes;

  void makeGraph() {
    /// initialise all nodes with empty lists.
    /// each node will have a list as value which stores
    /// the nodes to which it is connected to
    for (int i = 0; i < this.nodes.length; i++) {
      this.graph[nodes[i]] = List();
    }
  }

  Graph(this.nodes) {
    this.makeGraph();
  }

  int get numberOfNodesInGraph {
    return this.nodes.length;
  }

  HashMap get graphDataStructure {
    return this.graph;
  }

  void addNodes(int newNode) {
    this.nodes.add(newNode);
    this.graph[newNode] = List();
  }

  void addEdges(int start, int end) {
    this.graph[start].add(end);
  }
}

void depthFirstSearchHelper(graph, visitedNodes, node, answer) {
  if (visitedNodes[node]) {
    return null;
  }
  visitedNodes[node] = true;
  answer.add(node);
  if (graph.containsKey(node)) {
    for (int child in graph[node]) {
      if (!visitedNodes[child]) {
        depthFirstSearchHelper(graph, visitedNodes, child, answer);
      }
    }
  }
}

List<int> depthFirstSearch(Graph graph, int numberOfNodes, int startNode) {
  List<bool> visitedNodes =
      new List<bool>.generate(numberOfNodes, (index) => false);

  List<int> answer = List();
  depthFirstSearchHelper(graph.graph, visitedNodes, startNode, answer);
  return answer;
}

void main() {
  test(('Test case 1:'), () {
    List<int> nodes = [0, 1, 2, 3];
    int numberOfEdges = 3;

    List<List<int>> edges = [
      [0, 1],
      [1, 2],
      [0, 3]
    ];
    Graph graph = Graph(nodes);

    for (int i = 0; i < numberOfEdges; i++) {
      int start = edges[i][0];
      int end = edges[i][1];
      graph.addEdges(start, end);
    }
    int startNode = 0;
    List<int> answer =
        depthFirstSearch(graph, graph.numberOfNodesInGraph, startNode);
    expect(answer, equals([0, 1, 2, 3]));
  });

  test(('Test case 2:'), () {
    List<int> nodes = [0, 1, 2, 3, 4];
    int numberOfEdges = 4;

    List<List<int>> edges = [
      [0, 1],
      [0, 2],
      [0, 3],
      [2, 4]
    ];
    Graph graph = Graph(nodes);

    for (int i = 0; i < numberOfEdges; i++) {
      int start = edges[i][0];
      int end = edges[i][1];
      graph.addEdges(start, end);
    }
    int startNode = 0;
    List<int> answer =
        depthFirstSearch(graph, graph.numberOfNodesInGraph, startNode);
    expect(answer, equals([0, 1, 2, 4, 3]));
  });
}""",
    "Breadth_First_Search": """import 'dart:collection';
import 'package:test/test.dart';

/// Implementation of Breadth First Search
/// https://en.wikipedia.org/wiki/Breadth-first_search

class Graph {
  /// Adjacency List representation using dynamic list and HashMap
  HashMap graph = new HashMap<int, List<dynamic>>();
  List<int> nodes;

  void makeGraph() {
    /// initialise all nodes with empty lists.
    /// each node will have a list as value which stores
    /// the nodes to which it is connected to
    for (int i = 0; i < this.nodes.length; i++) {
      this.graph[nodes[i]] = List();
    }
  }

  Graph(this.nodes) {
    this.makeGraph();
  }

  int get numberOfNodesInGraph {
    return this.nodes.length;
  }

  HashMap get graphDataStructure {
    return this.graph;
  }

  void addNodes(int newNode) {
    this.nodes.add(newNode);
    this.graph[newNode] = List();
  }

  void addEdges(int start, int end) {
    this.graph[start].add(end);
  }
}

List<int> breadthFirstSearch(Graph graph, int numberOfNodes, int startNode) {
  Queue queue = new Queue<int>();
  List<int> answer = List();
  queue.add(startNode);
  while (queue.isNotEmpty) {
    int node = queue.removeFirst();
    answer.add(node);
    for (int child in graph.graph[node]) {
      queue.add(child);
    }
  }
  return answer;
}

void main() {
  test(('Test case 1:'), () {
    List<int> nodes = [0, 1, 2];
    int numberOfEdges = 2;

    List<List<int>> edges = [
      [0, 1],
      [0, 2]
    ];
    Graph graph = Graph(nodes);

    for (int i = 0; i < numberOfEdges; i++) {
      int start = edges[i][0];
      int end = edges[i][1];
      graph.addEdges(start, end);
    }
    int startNode = 0;
    List<int> answer =
        breadthFirstSearch(graph, graph.numberOfNodesInGraph, startNode);
    expect(answer, equals([0, 1, 2]));
  });

  test(('Test case 2:'), () {
    List<int> nodes = [0, 1, 2, 3, 4];
    int numberOfEdges = 4;

    List<List<int>> edges = [
      [0, 1],
      [0, 2],
      [0, 3],
      [2, 4]
    ];
    Graph graph = Graph(nodes);

    for (int i = 0; i < numberOfEdges; i++) {
      int start = edges[i][0];
      int end = edges[i][1];
      graph.addEdges(start, end);
    }
    int startNode = 0;
    List<int> answer =
        breadthFirstSearch(graph, graph.numberOfNodesInGraph, startNode);
    expect(answer, equals([0, 1, 2, 3, 4]));
  });
}""",
    "Nearest_Neighbour": """import 'dart:math';

/// Graph represented as adjacency matrix
/// [nodes] - node names preserved in order
/// [adjacencyMatrix] edge weights, distances between nodes
class Graph {
  List<String> nodes;
  List<List<double>> adjacencyMatrix;

  Graph(this.nodes, this.adjacencyMatrix);
}

/// Find path visiting all nodes in given [graph] using greedy approach
List<String> nearestNeighbourSearch(Graph graph) {
  List<String> path = [];
  Set<int> unvisitedNodes = Set.from(Iterable.generate(graph.nodes.length));

  int currentNode = 0;
  while (unvisitedNodes.isNotEmpty) {
    unvisitedNodes.remove(currentNode);
    int nearestNeighbour;
    double nearestNeighbourDistance;

    for (int neighbour in unvisitedNodes) {
      double neighbourDistance = graph.adjacencyMatrix[currentNode][neighbour];
      if (nearestNeighbour == null ||
          neighbourDistance < nearestNeighbourDistance) {
        nearestNeighbour = neighbour;
        nearestNeighbourDistance = neighbourDistance;
      }
    }

    path.add(graph.nodes[currentNode]);
    currentNode = nearestNeighbour;
  }

  return path;
}

class Point {
  double x;
  double y;

  @override
  String toString() => "P(\$x, \$y)";

  Point(this.x, this.y);
}

/// Euclidean distance between [p1] and [p2]
double distance(Point p1, Point p2) {
  return sqrt(pow(p2.x - p1.x, 2) + pow(p2.y - p1.y, 2));
}

/// Form graph using given [points].
/// Edge weights will correspond to distances
Graph fromPoints(List<Point> points) {
  List<String> nodes = [];
  List<List<double>> adjacencyMatrix = [];

  for (Point p1 in points) {
    List<double> neigbourDistances = [];
    for (Point p2 in points) {
      neigbourDistances.add(distance(p1, p2));
    }
    nodes.add(p1.toString());
    adjacencyMatrix.add(neigbourDistances);
  }

  return Graph(nodes, adjacencyMatrix);
}

void main() {
  Graph graph = Graph([
    "A",
    "B",
    "C",
    "D",
    "E"
  ], [
    [0, 12, 4, 54, 100],
    [3, 0, 5, 1, 1],
    [300, 20, 0, 433, 123],
    [32, 31, 54, 0, 3],
    [2, 65, 12, 32, 0]
  ]);

  print(nearestNeighbourSearch(graph));

  List<Point> points = [
    new Point(0, 0),
    new Point(0, 10),
    new Point(-10, 10),
    new Point(3.33, 8.11),
    new Point(12, 11),
    new Point(-1, 1),
    new Point(-2, 2)
  ];

  print(nearestNeighbourSearch(fromPoints(points)));
}""",
    "Binary_Search": """int binary_search(List a, int l, int r, int x) {
  if (r >= l) {
    int middle = (l + (r - l) / 2).toInt();
    if (a[middle] == x) {
      return middle;
    }
    if (a[middle] > x) {
      return binary_search(a, l, middle - 1, x);
    }

    return binary_search(a, middle + 1, r, x);
  }
  return -1;
}

void main() {
  var list = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  var x = 55;
  int n = list.length;
  var index = binary_search(list, 0, n - 1, x);
  print('list:');
  print(list);
  if (index != -1) {
    print(x.toString() + ' found at positions: ' + index.toString());
  } else {
    print(x.toString() + ' Not found');
  }
}""",
    "Linear_Search": """int linear_search(List a, number) {
  for (var i = 0; i < a.length; i++) {
    if (a[i] == number) {
      return i;
    }
  }
  return -1;
}

void main() {
  var list = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  var x = 15;
  var index = linear_search(list, x);
  print('list:');
  print(list);
  if (index != -1) {
    print(x.toString() + ' found at positions: ' + index.toString());
  } else {
    print(x.toString() + ' Not found');
  }
}""",
    "Bubble_Sort": """import 'dart:math' show Random;
void main() {
  final seed = 100, rnd = Random(), length = 100;
  var list =
      List<int>.generate(length, (i) => rnd.nextInt(seed), growable: false);
  print('before sorting:');
  print(list);
  print('---------------------------------------------');
  print('After sorting:');
  bubbleSort(list);
  print(list);
}

void bubbleSort(List<int> a) {
  for (var i = 0, length = a.length; i < length - 1; ++i) {
    bool swapped = false;
    for (var j = 0; j < length - 1 - i; ++j) {
      if (a[j] > a[j + 1]) {
        /* swap */
        var temp = a[j];
        a[j] = a[j + 1];
        a[j + 1] = temp;
        swapped = true;
      }
    }
    if (!swapped) {
      break;
    }
  }
}""",
    "Heap_Sort": """void sort(List arr){
  int n = arr.length;
  for(var i = n / 2 - 1; i >= 0; i--){
    heapify(arr,n,i);
  }
  for(var i = n - 1; i >= 0; i--){
    var temp = arr[0];
    arr[0] = arr[i];
    arr[i] = temp;
    heapify(arr,i,0);
  }
}

void heapify(List arr,var n,var i){
  var largest = i;
  var l = 2 * i + 1;
  var r = 2 * i + 2;
  
  if(l < n && arr[l] > arr[largest])
    largest = l;
  if(r < n && arr[r] > arr[largest])
    largest = r;
  if(largest != i){
    var swap = arr[i];
    arr[i] = arr[largest];
    arr[largest] = swap;
    heapify(arr,n,largest);
  }
}

void main(){
  List list = [19,48,5,7,99,10];
  sort(list);
  print(list);
}""",
    "Insertion_Sort": """import 'dart:math' show Random;

void main() {
  final seed = 100, rnd = Random(), length = 100;
  var list =
      List<int>.generate(length, (i) => rnd.nextInt(seed), growable: false);
  print('before sorting:');
  print(list);
  print('----------------------------------------------');
  print('After sorting:');
  insertSort(list);
  print(list);
}

void insertSort(List<int> a) {
  for (var i = 1; i < a.length; i++) {
    int j, t = a[i];
    for (j = i - 1; j >= 0 && t < a[j]; j--) {
      a[j + 1] = a[j];
    }
    if (j < i - 1) a[j + 1] = t;
  }
}""",
    "Merge_Sort": """import 'dart:math' show Random;

void merge(List list, int lIndex, int mIndex, int rIndex) {
  int lSize = mIndex - lIndex + 1;
  int rSize = rIndex - mIndex;

  List lList = new List(lSize);
  List rList = new List(rSize);

  for (int i = 0; i < lSize; i++) lList[i] = list[lIndex + i];
  for (int j = 0; j < rSize; j++) rList[j] = list[mIndex + j + 1];

  int i = 0, j = 0;
  int k = lIndex;

  while (i < lSize && j < rSize) {
    if (lList[i] <= rList[j]) {
      list[k] = lList[i];
      i++;
    } else {
      list[k] = rList[j];
      j++;
    }
    k++;
  }

  while (i < lSize) {
    list[k] = lList[i];
    i++;
    k++;
  }

  while (j < rSize) {
    list[k] = rList[j];
    j++;
    k++;
  }
}

void mergeSort(List list, int lIndex, int rIndex) {
  if (lIndex < rIndex) {
    int mIndex = (rIndex + lIndex) ~/ 2; // finds the middle index

    mergeSort(list, lIndex, mIndex); // sorts the first half of the list
    mergeSort(list, mIndex + 1, rIndex); // sorts the second half of the list

    merge(list, lIndex, mIndex, rIndex);
  }
}

void main() {
  final seed = 100, rnd = Random(), length = 100;
  var list =
      List<int>.generate(length, (i) => rnd.nextInt(seed), growable: false);
  print('before sorting:');
  print(list);
  print('--------------------------------------');
  print('After sorting:');
  mergeSort(list, 0, list.length - 1);
  print(list);
}""",
    "Quick_Sort": """import 'dart:math' show Random;
void main() {
  var list = List<int>();
  Random random = new Random();
  for (var i = 0; i < 100; i++) {
    list.add(random.nextInt(100));
  }
  print('before sorting:');
  print(list);
  print('---------------------------------------------');
  print('After sorting:');
  print(quickSort(list));
}

List<int> quickSort(List<int> a) {
  if (a.length < 2) {
    return a;
  } else {
    var pivot = a[0];
    var less = <int>[];
    var greater = <int>[];
    a.removeAt(0);
    for (var i in a) {
      if (i <= pivot) {
        less.add(i);
      } else {
        greater.add(i);
      }
    }
    return quickSort(less) + [pivot] + quickSort(greater);
  }
}""",
    "Selection_Sort": """import 'dart:math' show Random;
void main() {
  final seed = 100, rnd = Random(), length = 100;
  var list =
      List<int>.generate(length, (i) => rnd.nextInt(seed), growable: false);
  print('before sorting:');
  print(list);
  print('--------------------------------------');
  print('After sorting:');
  selectSort(list);
  print(list);
}

void selectSort(List<int> a) {
  for (var i = 0; i < a.length - 1; i++) {
    var mi = i;
    for (var j = i + 1; j < a.length; j++) {
      if (a[j] < a[mi]) mi = j;
    }
    if (i != mi) {
      var t = a[i];
      a[i] = a[mi];
      a[mi] = t;
    }
  }
}""",
    "Even_Odd": """""",
    "Factorial": """void main() {
  var n = 5;
  var fac = factorial(n);
  print(n.toString()+"! = "+fac.toString());
}
int factorial(var n) {
  var fac = 1;
  for (int i = 2; i <= n; ++i) {
    fac *= i;
  }
  return fac;
}""",
    "Fibonacci": """int fibonacci(int n) =>
    n == 1 || n == 2 ? 1 : fibonacci(n - 1) + fibonacci(n - 2);

void main() {
  fibonacci(7);
}""",
    "Greatest_Common_Divisor": """euclidean_gcd(var a, var b) {
  while (b != 0) {
    var t = b;
    b = a % b;
    a = t;
  }
  return a;
}

void main() {
  print('GCD(1, 4) = ' + euclidean_gcd(1, 4).toString());
  print('GCD(5, 3) = ' + euclidean_gcd(5, 3).toString());
  print('GCD(3, 6) = ' + euclidean_gcd(3, 6).toString());
  print('GCD(8, 4) = ' + euclidean_gcd(8, 4).toString());
}""",
    "Lowest_Common_Multiple": """double gcd(var a,var b){
  if(a == 0){
    return b;
  }
  return gcd(b % a,a);
}
double lcm(var a,var b){
  return (a * b) / gcd(a,b);
}

void main(){
  var a,b;
  a = 15;
  b = 20;
  print("LCM of " + a.toString() + " and " + b.toString() + " is " + lcm(a,b).toString());
  a = 12;
  b = 18;
  print("LCM of " + a.toString() + " and " + b.toString() + " is " + lcm(a,b).toString());
}""",
    "Max_Pairwise_Product": """""",
    "Prime_Numbers": """import 'dart:math';

void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 9, 13];
  for (int number in numbers) {
    if (isPrime(number)) {
      print("\$number is prime.");
    } else {
      print("\$number is not prime.");
    }
  }
}

/**
 *check out whether number is prime number or not.
 */
bool isPrime(int number) {
  if (number == 2) {
    return true;
  }
  if (number <= 1 || number % 2 == 0) {
    return false;
  }

  for (int i = 3, limit = sqrt(number).toInt(); i <= limit; i += 2) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}""",
    "Swap_Numbers": """""",
    "AVL_Tree": """""",
    "Array_Methods": """//Author: Shawn
//Email: stepfencurryxiao@gmail.com

class ArrayStack<T> {
  //stack
  List<T> stack;
  //element of the stack
  int count;
  //size of stack
  int n;

  //Init the array stack
  ArrayStack(var n) {
    this.n = n;
    this.stack = new List<T>(n);
    this.count = 0;
  }

  //Push a item to the stack
  void push(T item) {
    if (count == n) {
      print("The stack is full\n");
    }
    stack[count] = item;
    count++;
  }

  //Pop a item from the stack
  T pop() {
    if (count == 0) {
      print("No data in the stack!\n");
    }
    T pop_data = stack[count - 1];
    stack[count - 1] = null;
    count--;
    return pop_data;
  }

  void Display() {
    print("ArrayStack: \$stack\n");
  }
}

void main() {
  ArrayStack<String> array_stack = new ArrayStack<String>(6);

  array_stack.push('1');
  array_stack.push("2");
  array_stack.push('3');
  array_stack.push("4");
  array_stack.push('5');
  array_stack.push("6");

  array_stack.Display();

  var pop_data;
  pop_data = array_stack.pop();
  print("Pop \$pop_data from stack\n");
  pop_data = array_stack.pop();
  print("Pop \$pop_data from stack\n");
  print("Now the stock:");
  array_stack.Display();
}""",
    "Binary_Search_Tree": """class Node{
  var data;
  var left;
  var right;
  
  Node(var data){
    this.data = data;
    this.left = null;
    this.right = null;
  }  
}
void display(var tree){
  
  if(tree == null){
    return;
  }
  
  if(tree.left != null){
    display(tree.left);
  }
  
  print(tree.data);
  
  if(tree.right != null){
    display(tree.right);
  }
  
  return;
}
double depth_of_tree(var tree){
  
  if(tree == null){
    return 0;
  }
  else{
    var depth_l_tree = depth_of_tree(tree.left);
    var depth_r_tree = depth_of_tree(tree.right);
    
    if(depth_l_tree > depth_r_tree){
      return (1 + depth_l_tree);
    }
    else{
      return (1 + depth_r_tree);
    }
  }
}
bool is_full_binary_tree(var tree){
  if(tree == null){
    return true;
  }
  if(tree.left == null && tree.right == null){
    return true;
  }
  if(tree.left != null && tree.right != null){
    return (is_full_binary_tree(tree.left) && is_full_binary_tree(tree.right));
  }
  else{
    return false;
  }
}
void main(){
  var tree = Node(1);
  tree.left = Node(2);
  tree.right = Node(3);
  tree.left.left = Node(4);
  tree.left.right = Node(5);
  tree.left.right.left = Node(6);
  tree.right.left = Node(7);
  tree.right.left.left = Node(8);
  tree.right.left.left.right = Node(9);
  
  print(is_full_binary_tree(tree));
  print(depth_of_tree(tree));
  print("Tree is:\n");
  display(tree);
}""",
    "Huffman_Tree": """""",
    "Infix_to_Postfix": """""",
    "Infix_to_Prefix": """""",
    "Intersect_Arrays": """""",
    "Postfix_to_Infix": """""",
    "Prefix_to_Infix": """""",
    "Priority_Queue": """class PriorityQueue<T> {
  List<QueueItem<T>> _dataStore = <QueueItem<T>>[];

  int get size => _dataStore.length;

  bool get isEmpty => _dataStore.isEmpty;

  enqueue(T item, int priority) {
    QueueItem queueItem = new QueueItem<T>(item, priority);
    bool added = false;
    for (int i = 0; i < _dataStore.length; i++) {
      if (priority < _dataStore[i].priority) {
        added = true;
        _dataStore.insert(i, queueItem);
        break;
      }
    }
    if (!added) {
      _dataStore.add(queueItem);
    }
  }

  T dequeue() {
    if (_dataStore.isNotEmpty) {
      return _dataStore.removeAt(0).item;
    }
    return null;
  }

  T get front {
    if (_dataStore.isNotEmpty) {
      return _dataStore.first.item;
    }
    return null;
  }

  T get end {
    if (_dataStore.isNotEmpty) {
      return _dataStore.last.item;
    }
    return null;
  }

  clear() {
    _dataStore.clear();
  }

  String toString() {
    return _dataStore.toString();
  }
}

class QueueItem<T> {
  T item;
  int priority;

  QueueItem(this.item, this.priority);

  String toString() {
    return '\$item - \$priority';
  }
}

void main() {
  PriorityQueue<int> queue = new PriorityQueue();
  queue.enqueue(1, 2);
  queue.enqueue(2, 1);
  queue.enqueue(3, 3);
  queue.enqueue(4, 2);

  print(queue.dequeue());
  print(queue.dequeue());
  print(queue.dequeue());
  print(queue.dequeue());
}""",
    "Queue_using_Array": """const int MAX_SIZE = 10;

class ListQueue<T>{
  
  int count = 0;
  List<T> queue = new List<T>(MAX_SIZE);
  bool hasElements(){
    if(queue.length == 0){
      return false;
    }
    else{
      return true;
    }
  }
  void enque(T elment){
    if(count == MAX_SIZE){
      print("The queue is full!!!");
    }
    else{
      queue[count] = elment;
      count++;
    }
  }
  T deque(){
    T result = null;
    if(count == 0){
      print("The queue is empty!!!");
    }
    else{
      result = queue[0];
      for(int i = 0; i < queue.length - 1; i++){
        queue[i] = queue[i + 1];
      }
    }
    return result;
  }
}

void main(){
  ListQueue<int> Queue = new ListQueue<int>();
  Queue.enque(12);
  Queue.enque(2);
  Queue.enque(7);
  print(Queue.queue);
  print("Enque:");
  var returnData = Queue.deque();
  print(returnData.toString()+"\n");
  print("Enque:");
  returnData = Queue.deque();
  print(returnData.toString()+"\n");
  print("Enque:");
  returnData = Queue.deque();
  print(returnData.toString()+"\n");
  print("Now the queue is: " + (Queue.queue).toString());
}""",
    "Queue_using_Linked_List": """//Author:Shawn
//Email:stepfencurryxiao@gmail.com

const int MAX_SIZE = 10;

class ListQueue<T> {
  int count = 0;
  List<T> queue = new List<T>(MAX_SIZE);

  //Checks if the queue has elements (not empty)
  bool hasElements() {
    if (queue.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  //Add an element to the queue
  void enque(T element) {
    if (count == MAX_SIZE) {
      print("The queue is full!!!");
    } else {
      queue[count] = element;
      count++;
    }
  }

  //Takes the next element from the queue
  T deque() {
    T result = null;
    if (count == 0) {
      print("The queue is empty!!!");
    } else {
      result = queue[0];
      for (int i = 0; i < queue.length - 1; i++) {
        queue[i] = queue[i + 1];
      }
    }
    return result;
  }
}

void main() {
  ListQueue<int> Queue = new ListQueue<int>();
  Queue.enque(12);
  Queue.enque(2);
  Queue.enque(7);
  print(Queue.queue);
  print("Enqueue:");
  var returnData = Queue.deque();
  print("\$returnData\n");
  print("Enqueue:");
  returnData = Queue.deque();
  print("\$returnData\n");
  print("Enqueue:");
  returnData = Queue.deque();
  print("\$returnData\n");
  print("Now the queue is: " + (Queue.queue).toString());
}""",
    "Queue_using_Stacks": """""",
    "Reverse_Linked_List": """""",
    "Stack_using_Array": """class ArrayStack<T>{
  List<T> stack;
  int count;
  int n;

  ArrayStack(var n){
    this.n = n;
    this.stack = new List<T>(n);
    this.count = 0;
  }
  void push(T item){
    if(count == n){
      print("The stack is full\n");
    }
    stack[count] = item;
    count++;
  }
  T pop(){
    if(count == 0){
      print("No data in the stack!\n");
    }
    T pop_data = stack[count - 1];
    stack[count - 1] = null;
    count--;
    return pop_data;
  }
  
  void Display(){
    print("ArrayStack: "+stack.toString()+"\n");
  }
}

void main(){
  ArrayStack<String> array_stack = new ArrayStack<String>(6);
  
  array_stack.push('1');
  array_stack.push("2");
  array_stack.push('3');
  array_stack.push("4");
  array_stack.push('5');
  array_stack.push("6");
  
  array_stack.Display();
  
  var pop_data;
  pop_data = array_stack.pop();
  print("Pop "+pop_data.toString()+" from stack\n");
  pop_data = array_stack.pop();
  print("Pop "+pop_data.toString()+" from stack\n");
  print("Now the stock:");
   array_stack.Display();
}""",
    "Stack_using_Linked_List": """class Node<T>{
  T data;
  Node next;
  
  Node(T data){
    this.data = data;
    this.next = null;
  }
}

class LinkedListStack<T>{
  Node<T> head;
  int size;
  
  LinkedListStack(){
    this.head = null;
    this.size = 0;
  }
  void push(T element){
       Node<T> newNode = new Node<T>(element);
       newNode.next = this.head;
       this.head = newNode;
       this.size++;
  }
  T pop(){
    T returnData = null;
    if(size == 0){
      print("The stack is empty!!!");
    }
    else{
      Node<T> destroy = this.head;
      this.head = this.head.next;
      returnData = destroy.data;
      this.size--;
    }
    return returnData;
  }
  
  bool isEmpty(){
    return this.size == 0;
  }
  
  int getSize(){
    return this.size;
  }
}

int main(){
  LinkedListStack<String> Stack = new LinkedListStack<String>();
  var returnData;
  print("Push 2 5 9 7 to the stack\n");
  Stack.push("2");
  Stack.push("5");
  Stack.push("9");
  Stack.push("7");
  print("Successful push!\n");
  returnData = Stack.pop();
  print("Pop a data: "+returnData.toString()+"\n");
  returnData = Stack.pop();
  print("Pop a data: "+returnData.toString()+"\n");
  returnData = Stack.pop();
  print("Pop a data: "+returnData.toString()+"\n");
  return 0;
}""",
    "Stack_using_Queues": """""",
    "Union_Array": """""",
    "Union_Sorted_Array": """""",
    "Knapsack_Problem": """""",
  };
}
