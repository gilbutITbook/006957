#!/usr/bin/ruby -s
# -*- coding: utf-8 -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 도모에 전
(예)
  #{name} 10  → 10 회 시행
(옵션 예)
  -p=60,40,70 또는 -prob=60,40,70
    → A 는 B 에 확률 60% 로 승리, B 는 C 에 확률 40% 로 승리,
       C 는 A 에 확률 70% 로 승리
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

$prob ||= $p || '50,50,50'
$prob = $prob.split(/,/).map{|s| s.to_f / 100}

$n = ARGV.shift.to_i

#####################################

ab, bc, ca = $prob
$p_table = {
  :A => {:B => ab, :C => 1 - ca},
  :B => {:C => bc, :A => 1 - ab},
  :C => {:A => ca, :B => 1 - bc},
}

def fight(x, y)
  rand < $p_table[x][y] ? [x, y] : [y, x]
end

def trial
  history = []
  x, y, z = [:A, :B, :C]
  begin
    winner, loser = fight x, y
    history.unshift winner
    x, y, z = [winner, z, loser]
  end until history[0] == history[1]
  history[0]
end

$n.times{puts trial}
