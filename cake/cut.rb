#!/usr/bin/ruby -s
# -*- coding: utf-8 -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 각 행의 지정 필드를 표시
(예)
  #{name} -f=2 foo.dat
(옵션 예)
  -field=1   또는 -f=1   → 첫번째 필드를 표시
  -help      또는 -h     → 이 메시지를 표시
EOU
end

#####################################

if ($help || $h)
  usage
  exit 0
end

$field ||= $f || 1
$field = $field.to_i

ARGF.each_line{|s| puts s.chomp.split(/\s+/)[$field - 1]}
