run:
	./cake.rb 100 | ../monitor.rb | ../histogram.rb -w=0.1

long:
	./cake.rb 10000 | ../histogram.rb -w=0.1 -u=100

roll:
	@echo '(1st piece)'
	./cake.rb -r=5 100 | ./cut.rb -f=1 | ../histogram.rb -w=0.1
	@echo '(3rd piece)'
	./cake.rb -r=5 100 | ./cut.rb -f=3 | ../histogram.rb -w=0.1

rlong:
	@echo '(1st piece)'
	./cake.rb -r=5 10000 | ./cut.rb -f=1 | ../histogram.rb -w=0.1 -u=100
	@echo '(3rd piece)'
	./cake.rb -r=5 10000 | ./cut.rb -f=3 | ../histogram.rb -w=0.1 -u=100
