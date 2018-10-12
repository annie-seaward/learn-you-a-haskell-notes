Haskell is a purely functional language - you don't tell the computer what to do, you tell it what stuff is.
You do this in the form of functions.

The functions have no side effects, they calculate the thing, return and then nothing else.
It has referential transparency, meaning if a function is given the same parameters on two different equations the same result is guarenteed, meaning it can be proved to be correct.

Haskell is Lazy, so it only executes values when forced to do so.
Laziness allows seemingly infinte data structures to be created.

Is is statically typed, so the type of each piece of data is fixed and cannot change. This can help to catch lots of errors at the point of compliation.
It also uses type inference, meaning it can guess the type of some data without it being explicity stated.

Infix functions go between the two values they are operating on, like the traditional mathematical operators. Prefix functions go before what they are operating on. Unlike in many other languages haskell uses the space as the operation applicator compared with the use of brackets.
Prefix functions can be turned into infix functions by surrounding them with `.
div 100 9 = 100 `div` 9

Function operation has the highest order of application in haskell.
succ 9 * 10 /= succ (9 * 10)

> doubleMe x = x + x
> doubleUs x y = x * 2 + y * 2
> doubleUs' x y = doubleMe x + doubleMe y
> 
> doubleSmallNumber x = if x > 100
> 							then x
> 							else x*2
> doubleSmallNumber' x = (if x > 100 then x else x*2) + 1

Differently to other languages the 'else' statement is mandatory, as the function must always return a result. So in haskell 'if' is an expression not a statement.

If a function does not take in any parameters, it is simply a definition/name
helloWorld = 'Hello World!''

List are homogenous data structures, meaning they store several elements of the same data type.
exampleList = [1,2,3]
In haskell strings are just a list of characters.
'hello' = ['h','e','l','l','o']

Concatenation is an important operation on lists, which joins two lists into one, using ++.
[1,2,3] ++ [4,5,6] = [1,2,3,4,5,6]

The cons operator (:) adds a single element of the correct type to the start of a list of that type.
1:[2,3,4] = [1,2,3,4]
The reason that cons works in this way is because all lists are essentially just a sequence of elements cons-ed to the empty list, i.e. [1,2,3] = 1:2:3:[].

Every element in a list is sequentially index, starting at 0 and increasing consecatively. Elements can be accessed by there index using the operation (!!).
[1,2,3,4] !! 2 = 3

Lists can contain lists, but all lists must be of the same type.

Two lists can be compared if there elements can be compared. When using comparision operators, like < > <= >=, the comparision happens in lexographical order, meaning that the elements are compared with the corrosponing element sequentially until two non-equal elements are found.
i.e. [1,2,3] < [1,3,5] computes the following: 1<1 - equal, 2<3 - true.
A non-empty list is always considered greater than an empty list.
  
Lists can be cut up into different 'chunks', there are two common ways to do this. The first is the head and tail, the head in the first element of the list and the tails is every other element. Opposite to this the last element is the just the last element and the init is all other elements as a list.
head [1,2,3] = 1
tail [1,2,3] = [2,3]
init [1,2,3] = [1,2]
last [1,2,3] = 3

The length function returns the number of elements in the list.
list !! ((length list) -1) returns the last element of the list.

The null function checks if a given list is empty.
null [1] = false, null [] = true

Reverse is a function that reverses the order of all elements in a list.
reverse [1,2,3] = [3,2,1]

The function take, returns the first x number elements from the list, as specified.
take 2 [1,2,3] = [1,2]
take 0 [1,2,3] = []
take 5 [1,2,3] = [1,2,3]
In a similar way the drop function removes the first x elements from the list, as specified.
drop 2 [1,2,3] = [3]
drop 0 [1,2,3] = [1,2,3]
drop 5 [1,2,3] = []

The maximum function returns the largest element from a list, and minimum the smallest.
maximum [1,3,2] = 3
minimum [1,3,2] = 1

Sum adds up all elements in a list of numbers, in the same way product multiplies them all together.
sum [1,2,3] = 6
product [1,2,3] = 6

The element function returns wheather a particular item is in a given list of items.
elem 2 [1,2,3] = true
elem 4 [1,2,3] = false

Often when declaring lists it can be easier to use ranges, instead of writing out the entire list. This works for enumerated (ordered) lists, on types of data with a natural ordering.
[1..5] = [1,2,3,4,5]
[a..g] = [a,b,c,d,e,f,g]
[A..G] = [A,B,C,D,E,F,G]
 
Specified steps can also be added to skip through the range.
[2,4..10] = [2,4,6,8,10]

The function cycle works by repeating the same sequence repeatively.
take 10 (cycle ['a','b','c']) = ['a','b','c','a','b','c','a','b','c','a']
 
The repeat function takes a single element and creates a list where every element is the given one.
take 10 (repeat 5) = [5,5,5,5,5,5,5,5,5,5]
 
Replicate essentially does the same as combining the combine function and the repeat function

replicate 10 5 = take 10 (repeat 5)

List comprehensions are anouther, and much more advanced, way to filter, transform and combine lists.
It works very similar to set comprehension, where sets are 'built' from other sets and conditions.
[x*2 | x <- [1..5]] = [2,4,6,8,10]
This means that x takes on each value of the list [1..5] and then is operated on by the rule x*2.
[x*2 | x <- [1..5], x*2 >=6] = [2,4,6]
This adds anouther condition to the condition, which is passed on to the operation. Conditions are seperated by a comma and work as and statements with each other.

> onlyUppercase st = [ch | ch <-st, ch `elem` ['A'..'Z']]

Uses list comprehension to make a function which returns only letters in ['A'..'Z'], i.e. only uppercase letters.
The different conditions are called predicates, and more predicates are added to filter the list.

Within list comprehensions, if statements, multiple variables, and many others can all be used.
[if x < 10 then 'LESS' else 'More' | x <- [7..12]] = ['LESS', 'LESS', 'LESS', 'MORE', 'MORE', 'MORE']
[x+y | x <- [1,2,3], y <- [4,5,6]] = [5,6,7,6,7,8,7,8,9]

Underscore can server as a temporary variable, when we don't actually care about the values, for example when counting the length of a list the elements don't matter only the number of them.

> length' xs = sum [1 | _ <- xs]

Nested list comprehensions can be used to filter/make nested lists.

> nestedEvens xss = [ [x | x <- xs, even x] | xs <-xss]

This takes a nested list of numbers and returns in the same format but with only the even numbers.
nestedEvens [[1,2,3],[3,4,5],[5,6,7]] = [[2],[4],[6]]

Tuples are used to store heterogenous elements (can be of different types) as a single value. Tuples are always a fixed size.
(1,2) (1, 'a') (1,2,3,4,5) and ('hello', 4, 'g', true) are all tuples. 

One of the most useful features about tuples is that there size is part of there type, meaning it is fixed early on and can be used to prevent later errors. Due to tuple typing and the fact that all elements must be the same type the following are not possible:
[(1,2), (1,2,3), (1,2)]
[(1,2), (1,"one")]

Because tuples of different lengths are different types there can not be a universal function to add or remove elements from tuples, meaning different functions must be created for changing a pair, changing a triple, changing a 4-tuple, ect..

This also means that (a) = a, i.e. unlike with lists there is no single element tuple.

Pairs are the most used versions of tuples and so some functions designed for them are fst and snd.
fst (1,2) = 1
snd (1,2) = 2

The zip function takes two lists and matches there elements into pairs according to there index.
zip [1,2,3] ['a','b','c'] = [(1,'a'),(2,'b'),(3,'c')]
If one list is longer than the other then the end of the longer one is just left off. This is due to the lazy nature of haskell, it also allows for infinite lists to be zipped.


All of different concepts can be used together to solve different problems, for example:
We want to find a right angle triangle, fot which all the sides are integers, every side is less then 10, the perimeter is 24.

> rightTriangle = [ (a,b,c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2, a + b + c == 24]
