# Nim Simple String Formatting

The *SSFmt* module is a very simple set functions for formatting numbers and
strings making them suitable for printing (via echo).


## Examples

The SSFmt uses the generics capability of Nim to provide a 'fmt' function.  Any
type can passed to fmt.  The fmt function takes four parameter: the value to be
"printed", the field width, the alignment, and the character to use for padding.
Nim supports the "dot" notation so the first parameter (what is to be printed)
can be supplied as the prefix before the dot.  Named parameters, of course, are
supported so the order of parameters can be changed.
```nim
import ssfmt
echo fmt(1,5,L,'.')
echo fmt(1,5,C,'.')
echo fmt(1,5,R,'.')
echo ""
echo 2.fmt(5,L,'.')
echo 2.fmt(5,C,'.')
echo 2.fmt(5,R,'.')
echo ""
echo 3.fmt(wid=5, aln=L, p='.')
echo 3.fmt(aln=L, p='.', wid=5)
```

SSFmt pads the supplied value to the specified width (`wid` parameter) with the
supplied pad character (`p`).  Default values are provided to reduce the number
of parameters in the most common situations.  If the `wid` parameter is zero (or
negative) no padding will occur.  If all the parameters are defaulted, the
returned value is identical to the "stringifier" `$`.
```nim
import ssfmt
echo 4.fmt(6,L,' ')
echo 4.fmt(6,L)
echo 4.fmt(6)
echo 4.fmt()
```

In addition to integers strings and floats are supported.  Note that the
floating point version of `fmt`function uses a slightly different format for
the `wid` field.  Rather than an integer number of characters, a floating point
value is used.  The integer part specifies the width, the first digit of the
fractional part specifies the precision (number of digits to the right of the
decimal).
least the first d)
```nim
import ssfmt
echo "hello".fmt(12,L,'.')
echo "hello".fmt(12,C,'.')
echo "hello".fmt(12,R,'.')
echo ""
echo 1.234567.fmt(12.2,L,'.')
echo 1.234567.fmt(12.2,C,'.')
echo 1.234567.fmt(12.2,R,'.')
```

On final function is provided - `fmts`.  This function supports floating point
types only and returns a representation using scientific notation.  The `wid`
parameter is again a float with the first fractional digit specifying the
number of significant digits (not necessarily the number of digits after the
decimal).
```nim
import ssfmt
echo 123.4567.fmts(12.2,L,'.')
echo 123.4567.fmts(12.2,C,'.')
echo 123.4567.fmts(12.2,R,'.')
echo ""
echo 1234.567e-6.fmts(12.3,L,'.')
echo 1234.567e-6.fmts(12.3,C,'.')
echo 1234.567e-6.fmts(12.3,R,'.')
```

One final note, the `SSFmt` string `fmt` routine supports unicode.
```nim
echo "Καλημέρα κόσμε".fmt(20,L,'.')
echo "Καλημέρα κόσμε".fmt(20,C,'.')
echo "Καλημέρα κόσμε".fmt(20,R,'.')
```

# License
This module is released under the Beer-ware License

---
"THE BEER-WARE LICENSE" (Revision 42):
Twist_Vector wrote this module.  As long as you retain this notice you can do
whatever you want with this stuff. If we meet some day, and you think this stuff
is worth it, you can buy me a beer in return.

---
