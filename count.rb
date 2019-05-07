#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 어떤 내용의 줄이 몇번 나왔는지를 센다
(예)
  #{name} foo.dat
(옵션 예)
  -help      또는 -h     → 이 메시지를 표시
EOU
end

#####################################

if ($help || $h)
  usage
  exit 0
end

module Enumerable
  def frequency
    inject(Hash.new(0)){|h,k| h[k] += 1; h}
  end
  def sum
    inject(0){|x,y| x + y}
  end
end

h = ARGF.map{|s| s.chomp}.frequency
n = h.values.sum
h.keys.sort.each{|k|
  puts "#{k}: #{h[k]} (#{h[k] * 100.0 / n}%)"
}
