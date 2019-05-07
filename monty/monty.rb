#!/usr/bin/ruby -s
# -*- coding: utf-8 -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 몬티홀 문제를 시뮬레이션
(예)
  #{name} 10  → 10 회 시행
(옵션 예)
  -c         또는 -change   → 염소를 보고 문을 바꾼다
  -s=777     또는 -seed=777 → 난수의 시드를 지정
  -help      또는 -h        → 이 메시지를 표시
EOU
end

#####################################

if ($help || $h || ARGV.empty?)
  usage
  exit 0
end

$change ||= $c

$seed ||= $s
srand($seed.to_i) if $seed

$n = ARGV.shift.to_i

def choice(a)
  a[rand(a.length)]
end

#####################################

$doors = 'ABC'.split //
$n.times{
  car = choice $doors
  you = choice $doors
  goat = choice($doors - [car, you])
  you = choice($doors - [you, goat]) if $change
  result = (car == you) ? 'O' : 'X'
  puts result
}
