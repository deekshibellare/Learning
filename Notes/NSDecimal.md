#Why 0.1 + 0.2 != 0.3

Float and double are floating binary point types.. This representation is not accurate.

For example: A number '0.1' is  0.0001100110011.. where 0011 is recurring. A computer can't represent the infinite number. So it will choose to round of at some point.

This is similar to representing 1/3 in the Decimal system. 
Do you expect ```1/3 + 1/3 + 1/3 == 1``` ?

Now if you add 0.1 + 0.2 it won't be 0.3 because of rounding errors

- Floating point binary numbers are super fast.
- Floating point representation makes it easier with large and small numbers.

*Use NSDecimal or Integer to represent Money to avoid rounding errors*

DecimalNumber is an immutable subclass of NSNumber, provides an object-oriented wrapper for doing base-10 arithmetic. An instance can represent any number that can be expressed as mantissa x 10^exponent where mantissa is a decimal integer up to 38 digits long, and exponent is an integer from –128 through 127














