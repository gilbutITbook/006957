#!/usr/bin/ruby -s
# -*- coding: utf-8 -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 지정 문자의 출현 간격을 센다
(예)
  #{name} foo.dat
  echo '....o...o..oo...o.' | #{name}
(옵션 예)
  -t='o'  또는 -target='o'  → 문자 "o"의 출현 간격을 센다
  -help      또는 -h        → 이 메시지를 표시
EOU
end

#####################################

if ($help || $h)
  usage
  exit 0
end

$target ||= $t || 'o'

pat = /[#$target][^#$target]*(?=[#$target])/
dat = ARGF.readlines.map{|x| x.chomp}.join

dat.scan(pat){|s| puts s.length}
