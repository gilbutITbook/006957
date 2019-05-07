#!/usr/bin/ruby -s
# -*- coding: utf-8 -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 쌍육 주사위 게임
(예)
  #{name} 10  → 10 회 시행
(옵션 예)
  -t=2,3,7     또는 -trap=2,3,7 → 2, 3, 7 번째 말에 함정을 판다
  -s=777     또는 -seed=777 → 난수의 시드를 지정
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

$trap ||= $t || '2,5,8'
$trap = $trap.split(/,/).map{|s| s.to_i}

$n = ARGV.shift.to_i

#####################################

$goal = $trap.max

$n.times{
  escape = false
  x = 0
  x += rand(6) + 1 until $trap.member?(x) || (escape = (x > $goal))
  puts(escape ? 'X' : 'O')
}
