#!/usr/bin/ruby -s
# -*- coding: utf-8 -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 지정한 비트 패턴이 나올 때까지 0,1 의 무작위 수열을 만든다
(예)
  #{name} 10  → 10 회 시행
(옵션 예)
  -p=1011    또는 -pattern=1011 → "...1011"이 나오면 찍기 중단
  -c=100     또는 -count=100
    → 찍기 중단 없이, 길이 100 까지 지정한 패턴이 몇번 나오는지를 센다
  -s=777     또는 -seed=777 → 난수의 시드를 지정
  -v         또는 -verbatim → -count 지정시에 무작위 수열을 표준 에러 출력으로
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

$n = ARGV.shift.to_i

$pattern ||= $p || '11'
$count ||= $c
$count &&= $count.to_i

$verbatim ||= $v

#####################################

$pat = $pattern.split(//).map{|s| s.to_i}
$k = $pattern.length

def trial
  a = []
  a.push(rand(2)) until a[(- $k)..-1] == $pat
  a.join
end

def count
  a = Array::new($count){rand(2)}
  $stderr.puts a.join if $verbatim
  (0...(a.length)).select{|i| a[i, $k] == $pat}.length
end

$n.times{
  puts($count ? count : trial)
}

