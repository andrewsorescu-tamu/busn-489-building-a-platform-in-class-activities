import UIKit

// OPERATORS

// operators in swift are unary, binary, or ternary:

// unary operators operate on a single target (ex: -a). unary *prefix* operators appear immediately before their target (ex: !b) and unary *postfix* operators appear
// immediately after their target (ex: c!)

// binary operators on two targets (such as 2+3) and are *infix* because they appear in between their two targets

// ternary operators operate on three targets. there is only one ternary operator in swift, which is the ternary conditional operator (a ? b : c)

// THE ASSIGNMENT OPERATOR

// if the right side of an assignment is a tuple with multiple values, its elements can be decomposed into multiple constants or variables at once:
let (x,y) = (1,2)
// x is equal to 1, while y is equal to 2

// the following if statement is invalid because unlike in C, the statement x=y doesn't return a value:

// if x=y {
//
// }

// the addition operator is in fact supported for string concatenation

let greeting = "hello, " + "world!"
print(greeting)

// REMAINDER OPERATOR

// the remainder operator works out how many multiples of b will fit inside a and returns the value that's *left over*

let remainder = 9%4
print(remainder)
