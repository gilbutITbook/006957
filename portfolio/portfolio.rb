#!/usr/bin/ruby -s
# -*- coding: utf-8 -*-
# -*- Ruby -*-

include Math

def usage
  name = File::basename $0
  print <<EOU
#{name}: 포트 폴리오 놀이
(예)
  #{name} 10  → 10 회 시행
(옵션 예)
  -t=100     또는 -turn=100 → 1 시행 100 턴
  -q=0.7                      → 제비는 확률 0.7 로 1, 확률 0.3 로 0 이 나온다
  -p=0.7                      → 재산의 7 할을 1 에, 3 할을 0 에 건다
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

$turn ||= $t || 100
$turn = $turn.to_i

$q ||= 0.7
$p ||= 0.7
$q = $q.to_f
$p = $p.to_f

$n = ARGV.shift.to_i

module Enumerable
  def sum(&f)
    inject(0){|r, x| r + f.call(x)}
  end
end

#####################################

$rate = 2.0

def trial(t)
  (1..t).sum{
    (rand < $q) ? log10($p) + log10($rate) : log10(1 - $p) + log10($rate)
  }
end

$n.times{puts trial($turn)}
