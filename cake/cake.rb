#!/usr/bin/ruby -s
# -*- coding: utf-8 -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 케이크의 분배를 시뮬레이션
(예)
  #{name} 10  → 10 회 시행
(옵션 예)
  -s=777     또는 -seed=777 → 난수의 시드를 지정
  -r=5       또는 -roll=5   → 롤 케이크를 5분할
  -help      또는 -h        → 이 메시지를 표시
EOU
end

#####################################

if ($help || $h || ARGV.empty?)
  usage
  exit 0
end

$seed ||= $s
srand($seed.to_i) if $seed

$roll ||= $r || 0
$roll = $roll.to_i

$n = ARGV.shift.to_i

#####################################

def whole()
  a, b = [rand, rand].sort
  you = b - a
  puts you
end

def roll(r)
  s = (1...r).map{rand}.sort
  puts ([0]+s).zip(s+[1]).map{|s,t| t - s}.join(' ')
end

if $roll > 0
  $n.times{roll($roll)}
else
  $n.times{whole}
end
