In haskell, every expression's type is known at compile time, which leads to safer code. Haskell does have type inferenece, not all things need the type decalred because haskell can guess what type it needs to be.
To check what type an expression the command :t can be used in the ghci prompt, for example:
:t 'a'
'a' :: Char

When defining a function it is good practice to define it's type above the start of it. This done by defining the type of each input and the put put, for example:

> removeNonUppercase :: [Char] -> [Char]
> removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

For serveral parameters:

> addThree :: Int -> Int -> Int -> Int
> addThree x y z = x + y + z

If you are unsure of the type declaration to give to a function, it can be checked using the :t command.

There are several command type classed in haskell, they are Int, Integer, Float, Double, Bool, Char, Tuples. Lists are not a classed a specific type, but instead a format, in this way strings are also not a type, but a list of characters.

Int and Interger are very similar, they both express intergers. Interger has an infinite range, where as Int expresses only what is possible within a machine word on the computer, typically in 64-bit CPU this is [-2^63, 2^63 - 1]. It may seem odd to ever use Int, however it instead more efficent and it is rare that numbers ever exceed the range.
In a similar vain, Float and double both express real floating point numbers. Float uses single precision, double has double the precision, i.e. double the number of bits. This increase does however, ofcourse use up more memory. 
Bool are boolean values: true or false.
Char represents a unicode character.
Tuples are types dependent on there length, which can be upto 62. The empty tuple () does exist.

Sometimes a function logically needs to work variables of different types. For example, when manipulating lists it would silly to need different functions that did the same things for lists of numbers and lists of letters. To stop this necessity type variables exist.
:t head
head :: [a] -> a
Here a represent the type of what ever is being stored in the list. As long as what is returned is the same type as what is contained in the list then the function is type-safe. This means the same head function can be used for numbers, letters, strings, nested-lists, ect..
Functions that use type variables are called polymorphic functions.

A type class is an interface that defines some behavior. If a type is an instance of a type class, than it supports and implements the behavior the type class describes.
The equality type class is a good example, it is requried that any values inputted into the (==) operation can be compared for equality. This needs to be set out in the type declaration, as type variables are used so it needs to be explicity said, rather than it being assumed and drawn from the types being used.
:t (==)
(==) :: (Eq a) => a -> a -> Bool
Everything before the => is the class constraint, it states that type a, must be an instance of the Eq class.

There are several standard type classes built into haskell thesse include: Eq, Ord, Show, Read, Enum, Bounded, Num, Floating, Integral. These are all already connected to several of the types are instances.
- Eq: This checks if two values are same and works on all standard types. Is necessary for the (==) operator to be used.
- Ord: This allows for values to be compared with (<), (<=), (>), (>=) and the compare function.
- Show: This applys to types that can be converted to strings. It is necessary for the show function (similar to a print function) to work.
- Read: This is the opposite of show, it applies to types that can be read from a string. It works with the read function.
- Enum: This is for enumerated types, types that have a sequential order. The most common use of this type class is in list ranges.
- Bounded: This is for types that have a maximum and minimum bound to them. 
- Num: This type class applies to any types that are numbers.
- Floating: This accepts any floating point numbers, so types Float and Double.
- Integral: This accepts any interger numbers, so types Int and Integer.

A note on the read function: Sometimes, due to the nature of some types being very similar to other types the function does not know what type it needs to return. For example, read "8", is 8 suppose to be an Int, Integer, Float or Double there is not way for the computer to know. This is also because read uses type variables, in cases like this it can often be useful to explicity define the return type when calling the function, using the :: operator 
e.g. read "8" :: Int

From the range of different type classes it can be seen that a single type can be an instance of many type classes. In the same way a type class can apply to many different types. 
It is also the case that some type classes are prerequisites for being part of anouther class. For example, to be an instance of Ord, a type must first be an instance of Eq.