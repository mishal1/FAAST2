class Station

	attr_reader :people
	attr_reader :trains

	def initialize
		@people = []
		@trains =[]
	end


	def hold(person)
		@people << person
	end

	def release(person)
		@people.delete(person)
	end

	def hold_a_train(a_train)
		trains << a_train
	end

	def release_a_train(a_train)
		trains.delete(a_train)
	end

end