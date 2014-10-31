# Article.create(date:"" , title:"" , problem: "", language: "",runtime:"", content:"", code:""
# 	)

#< &lt;


Article.delete_all

Article.create(date:"October 28, 2014" , title:"Selling Stocks" , problem: "Given an array of stock prices over a period of time, what is the max profit you could have? Assume you can only buy and sell once.", language: "Ruby",runtime:"O(n)", content:"Remember, you can't go back in time and sell the stock before your bought it! We keep track of the latest minimum prices and the current reigning max profit.", code:"
  def profit(prices)
  i = 0
  max_profit = 0
  min = prices[i]

  buy_price = 0
  sell_price = 0
  while i &lt; prices.length
    curr = prices[i]
    # p curr-min
    if curr-min > max_profit
      max_profit = curr-min
      buy_price = min
      sell_price = curr
    end
    min = curr if curr &lt; min
    i +=1
  end
  return max_profit
end

# generate an array of random prices
prices = Array.new(30) { rand(100) }
profit(prices)")

Article.create(date:"October 27, 2014" , title:"Adding Indices to Database Tables" , problem: "When are indices in a table used? When and Why should you add indices to a table?", language: "none",runtime:"N/A", content:"
  Indices are used for quick lookups in a database. In relational databases, all rows in a table automatically have an index. This is a unique ID that can be queried to find that particular row. If there is no index for a query, then the search performs a table scan. This means it looks through all the rows.\n
  When you add an index to a table, that index entry contains a copy of . These indices are not necessarily unique.
Sources: http://odetocode.com/articles/70.aspx
  ", code:""
  )

Article.create(date:"October 27, 2014" , title:"URLs in the Browser" , problem: "What happens when you type a URL in the search bar?", language: "none",runtime:"N/A", content:"
  <ol>
    <li>Type the URL into your Browser</li>
    <li>DNS lookup for the correct IP address. Looks for the stored URL in your browser cache first, then looks recursively through the server.</li>
    <li>Browser sends HTTP Get request to Web Server</li>
    <li>Server sends back 301, permanent redirect</li>
    <li>Browser follows redirect</li>
    <li>Server sends down HTML</li>
    <li>Browser begins rendering. Sends requests for objects embedded in the HTML such as stylesheets and javascript</li>
    <li>Browser sends AJAX requests</li>
  </ol>
  Resources: http://igoro.com/archive/what-really-happens-when-you-navigate-to-a-url/", code:""
  )


Article.create(date:"October 25, 2014" , title:"Making Change" , problem: "Given a total and an array of denominations, count the number of ways to make change for the total.", language: "Ruby",runtime:"", content:"For each denominations, you can use it 0 to x times, where x is the how many times you can use it before you overshoot the total. Use that logic recursively to update the total and the denominations left to use.", code:"
def change(total, denominations)
  return 1 if total == 0

  return 0 if total &lt; 0

  return 0 if denominations.length == 0
  # choose next coin
  current_coin = denominations.first

  # we can use it as many times as it takes to overshoot the total.
  count = 0
  while total >=0
    count += change(total, denominations[1..-1])
    total -= current_coin
  end
  return count
end"
  )

Article.create(date:"October 23, 2014" , title:"Validate Parentheses" , problem: "Given a string, determine if the parentheses are valid", language: "Ruby",runtime:"O(n)", content:"Examples: )( => false, () => true and ()) => false", code:"
  def valid?(str)
  stack = []
  parens = {
    '(' => ['open', ')'],
    ')' => ['close', '(']
  }
  i= 0
  while i != str.length
    if parens.has_key?(str[i])
      if parens[str[i]][0] == 'close'
        if stack.last == parens[str[i]][1]
          stack.pop()
        else
          return false
        end
      else
        stack &lt;&lt; str[i]
      end
    end

    i+=1
  end

  return stack.empty?
end"
  )

Article.create(date:"October 22, 2014" , title:"Memoized Fibonacci" , problem: "Increase the running time of the recursive Fibonacci Solution", language: "Ruby",runtime:"O(n)", content:"I benchmarked both the classic fibonacci and the memoized fibonacci. Classic fibonacci(30) runs in 0.257136 seconds. fibonacciMemoized(30) runs in 5.4e-05 seconds. Memoized fibonacci takes advantage of the fact that fibonacci makes 2 recursive calls. The second recurive call recalculates all of the same values as the first call. Therefore, if we store all the calculated fibonacci numbers during the first call, any further calls can simply use the stored values. We use a hash to store calculated numbers.", code:"
require 'benchmark'


# Classic Recursive
def fibonacci(n)
  return n if n<2
  return fibonacci(n-1)+fibonacci(n-2)
end

p Benchmark.measure {fibonacci(20)}

# Memoized
def fibonacciMemoized(n, calculated)
  return n if n &lt; 2
  return calculated[n] if calculated.has_key?(n)
  calculated [n] = fibonacciMemoized(n-1, calculated)+fibonacciMemoized(n-2, calculated)
end



p Benchmark.measure {p fibonacciMemoized(20,{})}
"
  )


Article.create(date:"October 16, 2014" , title:"Encode a number string to alphabet" , problem: "Given a dictionary where a =>1, b=> 2 ... z=> 26 and given a string such as '112', determine how many ways that string could be encoded as letters", language: "Javascript",runtime:"O(n)", content:"There are two cases to consider: letters that decode in the range of 1-9 (single digits!) and letters that decode in the range of 10-26 (2 digits!). Note that there is also the case of 0. In this problem, 0 does not decode to any letter. \n We have O(n) time because we are storing strings that we have checked before with their count. This way, we don't have to redo the recursive calls on any string segments. Instead we have an O(1) lookup. For example the string '1120' could decode to '1 1 20' or '11 20'. But it is repetative to call encode on 20 twice. We should only have to call encode on 20 once to know that there is only 1 possible encoding.", code:"function encode(checked, s, dict, count){

  if (s.length &lt; 2){
    return 1;
  }

  if((s.substr(0, 2) in dict) && (s.length > 2)){
    if (s.substr(2) in checked){
      count += checked[s.substr(2)];
    }else{
      count += encode(checked, s.substr(2), dict, count);
      checked[s.substr(2)] = count;
    }
  }
  if(s[1]!=='0'){
    if (s.substr(1) in checked){
      count += checked[s.substr(1)];
    }else{
      count += encode(checked, s.substr(1), dict, count);
      checked[s.substr(1)] = count;
    }
  }
  return count;
}
"
  )

Article.create(date:"October 13, 2014" , title:"Word Ladder" , problem: "Given two words (a starting and ending word) and a dictionary, count how many single letter changes you would need to make to go from the start word to the end word", language: "Javascript",runtime:"", content:"Keep track of the edit distance of each new word. For each new edited word, push it on to the word queue and store its edit distance. Pop words off of the queue, check if they are the end word. If not, edit them!", code:"function wordLadder(start,end, dict){
  var dist = {};
  var q = new Queue();
  var alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('');
  q.push(start);
  dist[start] = 0;

  while(!q.empty){
    word = q.peek();
    q.pop();
    if (word === end){
      return dist[word];
    }

    for (var i = 0; i &lt; word.length; i++){
      for(var letter = 0; letter &lt; alphabet.length; letter++ ){
        newWord = word.split('');
        newWord[i] = alphabet[letter];
        newWord = newWord.join('');
        // if we haven't seen the word before and if the word exists in the dictionary
        if(!(newWord in dist) && (newWord in dict)){
          q.push(newWord);
          dist[newWord] = dist[word]+1;
        }
      }
    }
  }

  return -1
}"
  )

Article.create(date:"October 12, 2014" , title:"Wordbreak" , problem: "Given a string and a dictionary, check if that string can be broken into words contained in the dictionary. Example: given 'ilikefood' and a dictionary containing the words 'i', 'like', and 'food', return true ", language: "Javascript",runtime:"O(n) ? ", content:" This is a recursive solution. for each new letter we add, we may need to call one more recursive call.", code:"function Wordbreak(str, dict){

  if( str in dict){
    return true;
  }

  for(var i = 0; i &lt; str.length; i++){
    var prefix = str.substr(0, i+1);
    console.log(prefix);
    if (!(prefix in dict)){
      // if the prefix doesn't exist, then we need to keep adding letters until we find a prefix.
      continue;
    }
    var remaining = str.substr(i+1);
    if (Wordbreak(remaining, dict)){
      return true;
    }
  }

  return false;

}
"
  )

Article.create(date:"October 10, 2014" , title:"Regex" , problem: "Implement Regex with '*' and '.' " , language: "Javascript",runtime:"", content:" Read the comments", code:"
  function isMatch(s, p){

  if(p ===''){
    return true;
  }

  // contains *
  // search the through whole string for potential matches via recursion

  // if there are none, thats ok! because * means any or none. so do a recursive call to look for the rest of the pattern in the string
  if (p[1] == '*'){
    for (var i = 0; i &lt; s.length && (p[0]==='.' || p[0]===s[0]); i++){
      if (isMatch(s.substr(i+1), p.substr(2))){
        return true;
      }
    }
    return isMatch(s, p.substr(2));

  }

  // if string is not empty and if character match... then we need to match up the rest of the string! so make a recursive call

  if (s!=='' && (p[0]==='.' || p[0]===s[0])){
    return isMatch(s.substr(1), p.substr(1));
  }else{
    return false;
  }
}

function regex(s,p){
  for (var j = 0; j&lt; s.length; j++){
    if (isMatch(s.substr(j),p)){
      return true;
    }
  }
  return false;
}"
  )




Article.create(date:"October 6, 2014" , title:"Technical Questions" , problem: "Here is a series of technical but non-coding questions that I will be running through for the next few posts", language: "N/A",runtime:"N/A", content:"
  <ol>
    <li>What happens when you type into the browser search bar?</li>
    <li>Talk about indexing tables in a database. What are indices and when do you use them?</li>
    <li>What is the difference between Javascript and Ruby?</li>
    <li>Design a Chat App</li>
    <li>What is normalization? (we are talking about databases) </li>
  </ol>
  ", code:""
  )

Article.create(date:"October 6, 2014" , title:"Find the Least Common Ancestor" , problem: "Given two values, find their least common ancestor in a binary search tree.", language: "Ruby",runtime:"", content:"This builds upon the code from the binary search tree. A least common ancestor (LCA) is one where one value is in its right child and the other is in its left child. This solution assumes all values in the tree are unique and that the values exist.", code:"
def LCA(node, val1, val2)

  left = exists?(node.left, val1, val2)
  right = exists?(node.right, val1, val2)

  if left == true && right == true
    return node
  elsif left == true
    LCA(node.left, val1, val2)
  else
    LCA(node.right, val1, val2)
  end
end

def exists?(node, val1, val2)

  if node == nil
    return
  elsif node.value == val1 || node.value == val2
    return true
  else
    return true if exists?(node.left, val1, val2) == true
    return true if exists?(node.right, val1, val2) == true
  end

  return false

end")

Article.create(date:"October 5, 2014" , title:"Data Structure: Binary Search Tree" , problem: "Create the Binary search tree data structure in Ruby", language: " Ruby",runtime:"insert- O(logn)", content:"Binary Search Trees (BST)consist of nodes. It must have at least 1 node, the root. Each node in a binary search tree has two children. We call these left child and right child. Each node also has an integer value. In a BST, the left child value is less than the current node value and the right child valu is greater than the current node value.", code:"
class Node
  attr_accessor :left, :right, :value
  def initialize(value)
    @left = nil
    @right = nil
    @value = value
  end
end

class Tree
  attr_reader :root
  def initialize(node)
    @root = node
  end

  def insert(value)
    insertAt(@root, value)
  end

  def insertAt(node, value)
    if value > node.value
      if node.right == nil
        node.right = Node.new(value)
      else
        insertAt(node.right, value)
      end
    else
      if node.left == nil
        node.left = Node.new(value)
      else
        insertAt(node.left, value)
      end
    end
  end
end
"
  )


Article.create(date:"October 4, 2014" , title:"Iterator for Two Interators" , problem: "Given two iterators make a single iterator to iterate over those two", language: "Javascript",runtime:"O(n)", content:"Given iterators [1,2] and [3,4], create an interator class that can iterate over the two iterators such that when you call next() you will get 1,2,3,4. iterators all have a next()", code:"function BigIterator(iter1, iter2){
  this.iterators = [iter1, iter2];
  this.curr = 0;
}

BigIterator.prototype.next= function() {
  var dummy = iterators[curr].next();
  if ( dummy !==null){
    return dummy;
  }
  else{
    this.curr ++;
    if (curr&lt;this.iterators.length){
      return iterators[curr].next();
    }
    else{
      return null;
    }
  }
}"
  )

Article.create(date:"October 3, 2014" , title:"Generate Case Combinations" , problem: "generate all possible case cominations given a lower case string", language: "Javascript",runtime:"", content:"There should be a wrapper function to call this one.", code:"function generateCaseCombinations(sorted, left){
  if(left === ''){
    console.log(sorted);
  }
  else{
    for (var i = 0; i &lt; left.length; i++){
      upper = sorted+left[i].toUpperCase();
      lower = sorted+left[i].toLowerCase();
      remaining = left.substr(0,i)+left.substr(i+1);
      generateCaseCombinations(remaining, upper);
      generateCaseCombinations(remaining, lower);
    }
  }
}"
  )

Article.create(date:"October 2, 2014" , title:"Reverse all the words in sentence" , problem: "Reverse all the words in a sentence", language: "Javascript",runtime:"", content:"Given a string such as 'hello world' return 'olleh dlrow'", code:"function ReverseWords(sentence){
  arr = sentence.split(' ');
  return ReverseArray(arr);
}

function ReverseArray(arr){
  dummy = [];
  for (var i = arr.length-1; i >=0; i--){
    dummy.push(arr[i]);
  }
  return dummy;
}"
  )

Article.create(date:"October 1, 2014" , title:"Is it a Palindrome?" , problem: "Given a string, return whether it is a palindrome or not", language: "Javascript",runtime:"", content:"", code:"function palindrome(n){
  var copy = n;
  var reversed = 0;
  while (n!==0){
    reversed = reversed*10 + n%10;
    n /= 10;
  }
  return (copy === reversed);
}"
  )

Article.create(date:"September 30, 2014" , title:"Recursive Permutation" , problem: "Find all the possible permutations.", language: "Javascript",runtime:"", content:"I watched a very helpful video by a professor from somewhere. This is a very helpful solution to know because a lot of coding problems are based in being able to find all the possible combinations", code:"function RecPermute(soFar,rest){
  if(rest === ""){
    console.log(soFar);
  }
  else{
    for(var i = 0; i &lt; rest.length; i ++){
      var next = soFar+rest[i];
      var remaining = rest.substr(0,i)+ rest.substr(i+1);
      RecPermute(next, remaining);
    }
  }
}

function AllPermutations(s){
  RecPermute("",s);
}"
	)
Article.create(date:"September 29, 2014" , title:"Recursive Fibonacci" , problem: "Find the nth fibonacci where the 0th number is 1, the 1st number is 1 and the 2nd number is 2.", language: "Ruby",runtime:"", content:"In a recursive fibonacci sequence, we have two base cases. If n is 1 or if n is 0, we should return 1. Otherwise, we want to add the two previous fibonacci numbers.", code:"
def fibonacci(n)

	if n == 1 || n == 0
		1
	else
		fibonacci(n-1)+fibonacci(n-2)
	end
end"
	)

Article.create(title:"Reverse a Linked List", date: "September 28, 2014", language: "Ruby", runtime:"O(n)", problem:"Reverse a linked list. We are assuming there is only a head pointer, no tail pointer", content: "<p>Our linked list is defined as follows: </p>

<pre class='prettyprint lang-ruby'>
Class Node
  attr_accessor :next, :value
  def initialize(value)
    @value = value
    @next = nil
  end
end

Class List
  attr_accessor :head
  def initialize(node)
    @head = node
  end
end
</pre>",
code: "def reverse_list
  prev = nil
  curr = @head
  reversed_head = nil
  while curr.next != nil
    next = curr.next

    if curr.next == nil
      # we are at the end of the list
      reversed_head = curr
    end

    prev = curr
    curr.next = prev
    curr = next

  end
  reversed_head
end"

 )

Article.create(date: "September 27, 2014", title: "Remove Duplicates from an Array", problem: "Given a sorted array of numbers, remove the duplicates. Ex: given [1,2,2,3,4,5,5] method will return [1,2,3,4,5].", language: "Ruby",runtime:"O(n)", content:"<p>This solution assumes a we are given a sorted array. We will store the unique numbers we find in an array called unique. Loop through the whole array and keep track of the current value. When the current value changes, add that value to the array of unique numbers.</p>", code:"
	def removed_duplicates(arr)
  curr = nil
  unique = []
  arr.each do |num|
    if num != curr
      unique &lt;&lt; num
      curr = num
    end
  end
end"
	)

Article.create(date:"September 27, 2014" , title:"Binary Search: Recursive Solution" , problem: "Given an array of numbers and a target number, find the target number. If no number is found, return nil.", language: "Ruby",runtime:"O(logn)", content:"<p>This solution assumes that we have been given a sorted array. A binary search begins at the middle of the array. It compares the target number to the middle number.
	  If the target is greater than the middle, then it must exist in the upper half of the array. If the target is less than the middle, then it muse exist in the lower half.
	  Make a recursive call, passing in either the upper or lower half of the array. Once you have reached a single number (or an array of length 1), you have either found the number
	  or not.</p>", code:"def binary_search(n, arr)
  mid = arr.length/2-1
  if arr.length == 1
    arr[0] == n ? n : nil
  elsif arr[mid]< n
    binary_search(n, arr[mid+1..-1])
  else
    binary_search(n, arr[0..mid])
  end
end"
	)

Article.create(date:"September 26, 2014" , title:"Roman Numerals" , problem: "Given an arabic number, convert it to a roman numeral. 4 = IV not VIIII", language: "Ruby",runtime:"", content:"", code:"# converts roman numerals up to 899
def to_roman(n)
  dict = {
    500 => 'D',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10=>'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }
  roman = ""
  dict.keys.each do |key|
      if n >= key
      roman+= dict[key]*(n/key)
      n -= (n/key)*key
    end
  end
  return roman
end"
	)

Article.create(date:"September 26, 2014" , title:"Insertion Sort" , problem: "Given an array of numbers, sort them in ascending order. This is an in place solution.", language: "Ruby",runtime:"O(n)", content:"<p>Begin at the beginning of the array. For each number in the array compare it to all the numbers to its left. These will be the sorted numbers.</p>", code:"# sort an array. prints the array at each sort.
def sort(arr)
  p arr
  i = 0
  while i&lt;arr.length
    i+=1
    temp = arr[i]
    unless temp.nil?
      j = i-1
      while j&gt;=0 && temp&lt;arr[j]
        arr[j+1] = arr[j]
        j-=1
      end
      arr[j+1] = temp
      p arr
    end
  end
end"
	)

Article.create(date:"June 30, 2014" , title:"Big O Notation" , problem: "", language: "",runtime:"", content:"<h4> What is Big O?</h4>
    				<p> Big O notation describes the runtime of an algorithm. Big O notation is usually used to refer to the runtimes of common data structure algorithms. These algorithms include searches, traversals, insertions, deletions and indexing.</p>
    				<p>There are 4 major Big O runtimes</p>
    				<li>O(1): This is the runtime of programs that run exactly the same regardless of the input. For example, finding the first element of an array.</li>
    				<li>O(N): The runtime is proportional to the length of the input data.</li>
    				<li>O(N<sup>2</sup>): The runtime is proportional to the square of the length of the input data. For example, nested loops often require O(N<sup>2</sup>) runtimes. For example, say you have two arrays of unique numbers of length N. You want to find out if they both contain the number 100. In the worst case, you would have to loop through the array N times. You should note that O(N)=2*O(N)=O(2N).</li>
    				<li>O(log N): As the data set gets larger, the runtimes get logarithmically larger. This occurs in binary searches. A binary search is a search that begins by splitting the data set in two at the median. You then continue to split those two halves of the data set into halves and so on and so forth. </li>
    				<p> The order of efficiency of runtimes in ascending order is as follows: O(1), O(log N), O(N), ON<sup>2</sup>)</p>
    				<table style='width:300px'>
    					<tr>
    						<th>Data Structure</th>
    						<th> Index</th>
    						<th> Search</th>
    						<th> Insert</th>
    						<th> Delete</th>
    					</tr>
    					<tr>
            				<td>Array</td>
            				<td>O(1)</td>
            				<td>O(n)</td>
            				<td>--</td>
                    <td></td>
    					</tr>
    					<tr>
        					<td>Hash</td>
        					<td>--</td>
        					<td>O(n)</td>
        					<td>O(n)</td>
                  <td>O(n)</td>
    					</tr>
    				</table>

    				<h4> Why is Big O important?</h4>
    				<p> Runtimes are how long a program or algorithm takes to run. They are important because they describe the efficiency of a program. In programming and in a company, time is money. If one program can run twice as fast as another- the company would rather use the faster code. The runtime of an algorithm always refers to the worst case scenario. Let's take a look at a search algorithm on an array of unique numbers. Assume you want to find one particular number. In the worst case scenario, you would have to go through the entire length of the array to find that number. Your runtime would be O(n).</p>
    				<h4> Job Hunting: The Big O Questions</h4>
    				<p> Recruiters often want to know if you know Big O notation and will ask you to give them the runtime of code you write. Or they will ask you how you could make the code run faster. So it is a good idea to commit the concept of Big O and the more common Big O notations to memory</p>
    				<p> References</p>
    				<a href='http://rob-bell.net/2009/06/a-beginners-guide-to-big-o-notation/'>Beginner's Guide to Big O</a>
    				<a href='http://bigocheatsheet.com/'>Big O Cheat Sheet</a> ", code:""
	)
