#!/usr/bin/ruby -s
# -*- coding: utf-8 -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 각 행의 길이를 센다
(예)
  cat foo.dat | #{name}
(옵션 예)
  -help      또는 -h        → 이 메시지를 표시
EOU
end

#####################################

if ($help || $h)
  usage
  exit 0
end

#####################################

ARGF.each_line{|s| puts(s.chomp.length)}
