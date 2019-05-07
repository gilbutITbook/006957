run:
	@echo '=========== trap = 1'
	./sugoroku.rb -t=1 1000 | ../count.rb
	@echo '=========== trap = 5'
	./sugoroku.rb -t=5 1000 | ../count.rb
	@echo '=========== trap = 10'
	./sugoroku.rb -t=10 1000 | ../count.rb

long:
	@echo '=========== trap = 1'
	./sugoroku.rb -t=1 10000 | ../count.rb
	@echo '=========== trap = 5'
	./sugoroku.rb -t=5 10000 | ../count.rb
	@echo '=========== trap = 10'
	./sugoroku.rb -t=10 10000 | ../count.rb

two:
	@echo '=========== trap = 10,20'
	./sugoroku.rb -t=10,20 1000 | ../count.rb
	@echo '=========== trap = 10,15'
	./sugoroku.rb -t=10,15 1000 | ../count.rb
	@echo '=========== trap = 10,11'
	./sugoroku.rb -t=10,11 1000 | ../count.rb

tlong:
	@echo '=========== trap = 10,20'
	./sugoroku.rb -t=10,20 10000 | ../count.rb
	@echo '=========== trap = 10,15'
	./sugoroku.rb -t=10,15 10000 | ../count.rb
	@echo '=========== trap = 10,11'
	./sugoroku.rb -t=10,11 10000 | ../count.rb
