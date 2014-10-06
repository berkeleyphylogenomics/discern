#!/usr/bin/env python

import re, sys

def main ():
  if len(sys.argv) < 2:
    print "Usage: %s [original comparative model] [reformatted model]" % sys.argv[0]
    sys.exit(0)
  orig=sys.argv[1]
  new=sys.argv[2]
  f= open (orig,'r')
  o=open (new,'w')
  for read in f:
    line=list(read)
    if re.match('^ATOM',read):
      line[21]='A'
    #  print line
      new_line="".join(line)
      o.write (new_line)
    else:
      o.write (read)
  f.close()
  o.close()

if __name__ == '__main__':
  main()

