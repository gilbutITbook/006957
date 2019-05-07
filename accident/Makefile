run:
	./toss.rb -p=0.1 1000 | ../monitor.rb | ./interval.rb | ../histogram.rb -w=5

long:
	./toss.rb -p=0.1 100000 | ./interval.rb | ../histogram.rb -w=5 -u=100
