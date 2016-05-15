#!/usr/bin/python -tt

# http://code.google.com/edu/languages/google-python-class/

import sys
import socket

def hostname_resolves(hostname):
    try:
        return socket.gethostbyname(hostname)
    except socket.error: 
        mensaje = 'no se puede resolver'
        return mensaje


def domresolver(filename):
  f = open(filename, 'rU')
  archivo = f.readlines()
  for linea in archivo:
       print linea +'resolves: '+hostname_resolves(linea)
  f.close()
  return

def main():
  if len(sys.argv) != 2:
    print 'Usage: ./mass-resolver.py file'
    sys.exit(1)

  filename = sys.argv[1]
  domresolver(filename)

if __name__ == '__main__':
  main()
