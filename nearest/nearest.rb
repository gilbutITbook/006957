#!/usr/bin/ruby -s
# -*- coding: utf-8 -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 무작위로 찍은 점의 최단 거리를 조사한다
(예)
  #{name} 10  → 10 회 시행
(옵션 예)
  -s=777     또는 -seed=777   → 난수의 시드를 지정
  -d=20      또는 -dim=20     → 20 차원 공간
  -p=100     또는 -points=100 → 점을 100 개 찍는다
  -help      또는 -h          → 이 메시지를 표시
EOU
end

#####################################

if ($help || $h || ARGV.empty?)
  usage
  exit 0
end

$seed ||= $s
srand($seed.to_i) if $seed

$dim ||= $d || 20
$dim = $dim.to_i

$points ||= $p || 100
$points = $points.to_i

$n = ARGV.shift.to_i

#####################################

def smaller(x, y)
  x < y ? x : y
end

module Enumerable
  def sum(&f)
    inject(0){|r, x| r + f.call(x)}
  end
  def minimum(&f)
    inf = 1.0/0
    inject(inf){|r, x| smaller r, f.call(x)}
  end
end

def distance(u, v)
  u.zip(v).sum{|x, y| (x - y)**2} ** 0.5
end

def random_point
    (1..$dim).map{rand}
end

def nearest
  u = random_point
  (2..$points).minimum{distance u, random_point}
end

$n.times{puts nearest}
