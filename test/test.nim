#
#                   Nim Simple String Formatting
#
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# Twist_Vector wrote this module.  As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.
# ----------------------------------------------------------------------------
#
import
  unittest,
  ssfmt


suite "Formatting checks":

  test "simple integer formatting":
    check( fmt(1,5,L,'.') == "1...." )
    check( fmt(1,5,C,'.') == "..1.." )
    check( fmt(1,5,R,'.') == "....1" )

    check( 2.fmt(5,L,'.') == "2...." )
    check( 2.fmt(5,C,'.') == "..2.." )
    check( 2.fmt(5,R,'.') == "....2" )

    check(  3.fmt(wid=5, aln=L, p='.') == "3...." )
    check(  3.fmt(aln=L, p='.', wid=5) == "3...." )

    check(  4.fmt(6,L,' ') == "4     " )
    check(  4.fmt(6,L) == "4     " )
    check(  4.fmt(6) == "4     " )
    check(  4.fmt() == "4" )

    check( 12345.fmt(3,L,'.') == "12345" )
    check( 12345.fmt(0,L,'.') == "12345" )
    check( 12345.fmt(-3,L,'.') == "12345" )



  test "simple string formatting":
    check( "hello".fmt(12,L,'.') == "hello......." )
    check( "hello".fmt(12,C,'.') == "...hello...." )
    check( "hello".fmt(12,R,'.') == ".......hello" )


  test "simple float formatting":
    check( 1.234567.fmt(12.2,L,'.') == "1.23........" )
    check( 1.234567.fmt(12.2,C,'.') == "....1.23...." )
    check( 1.234567.fmt(12.2,R,'.') == "........1.23" )


  test "scientific float formatting":
    check( 123.4567.fmts(12.2,L,'.') == "1.23e+02...." )
    check( 123.4567.fmts(12.2,C,'.') == "..1.23e+02.." )
    check( 123.4567.fmts(12.2,R,'.') == "....1.23e+02" )

    check( 1234.567e-6.fmts(12.3,L,'.') == "1.235e-03..." )
    check( 1234.567e-6.fmts(12.3,C,'.') == ".1.235e-03.." )
    check( 1234.567e-6.fmts(12.3,R,'.') == "...1.235e-03" )


  test "unicode string formatting":
    check( "Καλημέρα κόσμε".fmt(20,L,'.') == "Καλημέρα κόσμε......" )
    check( "Καλημέρα κόσμε".fmt(20,C,'.') == "...Καλημέρα κόσμε..." )
    check( "Καλημέρα κόσμε".fmt(20,R,'.') == "......Καλημέρα κόσμε" )
