class Person

	def initialize
		@tapped = false
	end

	def tapped_in?
		@tapped
	end

	def tap_in_to(station)
		station.hold(self)
		@tapped = true
	end

	def tap_out_of(station)
		station.release(self)
		@tapped = false
	end

end