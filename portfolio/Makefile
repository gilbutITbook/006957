run:
	@echo '=========== p = 0.99'
	./portfolio.rb -p=0.99 100 | ../histogram.rb -w=5
	@echo '=========== p = 0.7'
	./portfolio.rb -p=0.7 100 | ../histogram.rb -w=1

long:
	@echo '=========== p = 0.99'
	./portfolio.rb -p=0.99 -t=500 500 | ../histogram.rb -w=10 -u=5
	@echo '=========== p = 0.7'
	./portfolio.rb -p=0.7 -t=500 500 | ../histogram.rb -w=2 -u=5
