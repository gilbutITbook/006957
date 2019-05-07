#!/usr/bin/ruby -s
# -*- coding: euc-jp -*-
# -*- Ruby -*-

def usage
  name = File::basename $0
  print <<EOU
#{name}: 표준 입력을 표준 출력 및 표준 오류 출력으로 복사
(예)
  foo.rb | #{name} | bar.rb
(옵션 예)
  -help      또는 -h     → 이 메시지를 표시
EOU
end

#####################################

if ($help || $h)
  usage
  exit 0
end

ARGF.each_line{|line|
  puts line
  $stderr.puts line
}
