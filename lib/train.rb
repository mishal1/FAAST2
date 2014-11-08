class Train
	
	attr_reader :people, :in_station

	def initialize
		@people = []
		@in_station = false
	end

	def hold(person)
		return people << person if in_station
		raise "A person cannot get on the train if it "
	end

	def release(person)
		people.delete(person)
	end

	def stop_at(station)
		station.hold_a_train(self)
		@in_station = true
	end

	def leave(station)
		station.release_a_train(self)
		@in_station = false
	end

end