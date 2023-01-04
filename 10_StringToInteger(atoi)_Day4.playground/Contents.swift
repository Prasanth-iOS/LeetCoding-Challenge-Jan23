//MARK: - String to Integer (atoi)

// Link: https://leetcode.com/problems/string-to-integer-atoi/
// Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer (similar to C/C++'s atoi function).
// The algorithm for myAtoi(string s) is as follows:
// Read in and ignore any leading whitespace.
// Check if the next character (if not already at the end of the string) is '-' or '+'. Read this character in if it is either. This determines if the final result is negative or positive respectively. Assume the result is positive if neither is present.
// Read in next the characters until the next non-digit character or the end of the input is reached. The rest of the string is ignored.
// Convert these digits into an integer (i.e. "123" -> 123, "0032" -> 32). If no digits were read, then the integer is 0. Change the sign as necessary (from step 2).
// If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then clamp the integer so that it remains in the range. Specifically, integers less than -231 should be clamped to -231, and integers greater than 231 - 1 should be clamped to 231 - 1.
// Return the integer as the final result.


//MARK: - Approach

//1. Iterate the string. Remove whitespaces, set positive or negative, convert character to number, check overflow and return result multiplying the flag.


//MARK: - Complexity

//- Time complexity:
// O(n)
//
//- Space complexity:
// O(1)


//MARK: - Code

import Foundation

class Solution {
    func myAtoi(_ s: String) -> Int {
        var result = 0, flag = 1, index = 0
        var sChars = [Character](s)
        let intMax = Int(Int32.max), intMin = Int(Int32.min)

        //1. Remove whitespaces
        while index < sChars.count {
            guard sChars[index].isWhitespace else {
                break
            }
            index += 1
        }
        guard index < sChars.count else {
            return result
        }

        //2. Set Positive 0r Negative
        if sChars[index] == "-" {
            flag = -1
            index += 1
        } else if sChars[index] == "+" {
            index += 1
        }

        //3. Convert string to number
        while index < sChars.count {
            let currentChar = sChars[index]
            guard currentChar.isNumber else {
                break
            }
            result = (result * 10) + currentChar.wholeNumberValue!

            //4. Handle overflow
            if result > intMax {
                if flag == 1 {
                    return intMax
                } else if flag == -1 && result > intMax {
                    return intMin
                }
            }
            index += 1
        }

        return result * flag
    }
}


//MARK: - Testing Sample Data

let solution = Solution()

//1.
var input1 = "42"
solution.myAtoi(input1) // 42

//2.
var input2 = "   -42"
solution.myAtoi(input2) // -42

//3.
var input3 = "4193 with words"
solution.myAtoi(input3) // 4193

//4.
var input4 = "-91283472332"
solution.myAtoi(input4) // -2147483648

//5.
var input5 = "-2147483647"
solution.myAtoi(input5) // -2147483647
