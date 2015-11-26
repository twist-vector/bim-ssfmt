#
#                   Nim Simple String Formatting
#
# The *SSFmt* module is a very simple set functions for formatting numbers and
# strings making them suitable for printing (via echo).
#
# ----------------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 42):
# Twist_Vector wrote this module.  As long as you retain this notice you
# can do whatever you want with this stuff. If we meet some day, and you think
# this stuff is worth it, you can buy me a beer in return.
# ----------------------------------------------------------------------------
#
import
  strutils,
  unicode,
  math

type
  Align* = enum L, C, R



proc fmt*[T](value: T, wid: int=0, aln: Align=L, p: char=' '): string =
  result = $value
  if wid > 0  and  wid > runeLen(result):
    var padL, padR: string = ""
    case aln
    of L:
      padR = repeat( p, (wid-runeLen(result)) )
    of C:
      padL = repeat( p, round(floor((wid-runeLen(result))/2)) )
      padR = repeat( p, round(ceil((wid-runeLen(result))/2)) )
    of R:
      padL = repeat( p, (wid-runeLen(result)) )
    return padL & $result & padR


proc fmt*(value: float, wid: float=0.0, aln: Align=R, p: char=' '): string =
  var w = round(floor(wid))
  var prec = round( (wid-float(w))*10 )
  result = formatFloat(value, ffDecimal, prec)
  if w > 0:
    var padL, padR: string = ""
    case aln
    of L:
      padR = repeat( p, (w-len(result)) )
    of C:
      padL = repeat( p, round(floor((w-len(result))/2)) )
      padR = repeat( p, round(ceil((w-len(result))/2)) )
    of R:
      padL = repeat( p, (w-len(result)) )
    return padL & $result & padR


proc fmts*(value: float, wid: float=0.0, aln: Align=R, p: char=' '): string =
  var w = round(floor(wid))
  var prec = round( (wid-float(w))*10 )
  result = formatFloat(value, ffScientific, prec)
  if w > 0:
    var padL, padR: string = ""
    case aln
    of L:
      padR = repeat( p, (w-len(result)) )
    of C:
      padL = repeat( p, round(floor((w-len(result))/2)) )
      padR = repeat( p, round(ceil((w-len(result))/2)) )
    of R:
      padL = repeat( p, (w-len(result)) )
    return padL & $result & padR
