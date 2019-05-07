run:
	@echo '=========== pattern 01'
	./pattern.rb -p=01 20
	@echo '=========== pattern 11'
	./pattern.rb -p=11 20

long:
	@echo '=========== pattern 01'
	./pattern.rb -p=01 1000 | ./length.rb | ../histogram.rb -w=2 -u=10
	@echo '=========== pattern 11'
	./pattern.rb -p=11 1000 | ./length.rb | ../histogram.rb -w=2 -u=10

count:
	@echo '=========== pattern 01'
	./pattern.rb -v -p=01 -c=20 5
	@echo '=========== pattern 11'
	./pattern.rb -v -p=11 -c=20 5

clong:
	@echo '=========== pattern 01'
	./pattern.rb -p=01 -c=100 1000 | ../histogram.rb -w=2 -u=10
	@echo '=========== pattern 11'
	./pattern.rb -p=11 -c=100 1000 | ../histogram.rb -w=2 -u=10
