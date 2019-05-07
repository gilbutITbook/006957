#!/usr/bin/ruby -s
# -*- coding: utf-8 -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 동전 던지기를 시뮬레이션
(예)
  #{name} 10  → 10회 시행
(옵션 예)
  -p=0.3     또는 -prob=0.3 → 확률 0.3 로 ".", 확률 0.7로 "o"
  -s=777     또는 -seed=777 → 난수의 시드를 지정
  -help      또는 -h     → 이 메시지를 표시
EOU
end

#####################################

if ($help || $h || ARGV.empty?)
  usage
  exit 0
end

$seed ||= $s
srand($seed.to_i) if $seed

$prob ||= $p || 0.5
$prob = $prob.to_f

$n = ARGV.shift.to_i

#####################################

$n.times{print(rand < $prob ? 'o' : '.')}
puts
