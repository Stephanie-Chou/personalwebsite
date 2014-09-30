# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Article.create(date:"" , title:"" , problem: "", language: "",runtime:"", content:"", code:""
# 	)

Article.create(date:"September 29, 2014" , title:"Recursive Fibonacci" , problem: "Find the nth fibonacci where the 0th number is 1, the 1st number is 1 and the 2nd number is 2.", language: "Ruby",runtime:"", content:"In a recursive fibonacci sequence, we have two base cases. If n is 1 or if n is 0, we should return 1. Otherwise, we want to add the two previous fibonacci numbers.", code:"def fibonacci(n)
	
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