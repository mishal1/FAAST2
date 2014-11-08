require 'train'

describe Train do

	let(:train)   {Train.new      }
	let(:person)  {double :person }
	let(:station) {double :station}

	def train_in_station
		allow(station).to receive(:hold_a_train).with(train)
		train.stop_at(station)
	end

	def train_leaves_station
		allow(station).to receive(:release_a_train).with(train)
		train.leave(station)
	end

	it "should have no people in the train when initialize" do
		expect(train.people).to eq([])
	end

	it "should be able to hold people" do
		train_in_station
		train.hold(person)
		expect(train.people).to eq([person])
	end

	it "should be able to allow people to leave the station" do
		train_in_station
		allow(station).to receive(:release)
		train.hold(person)
		train.release(person)
		expect(train.people).to eq([])
	end

	it "should stop at a station" do
		expect(station).to receive(:hold_a_train).with(train)
		train.stop_at(station)
	end

	it "should move away from the station" do
		expect(station).to receive(:release_a_train).with(train)
		train.leave(station)
	end

	it "should recognise that the train is not in the station initialized" do
		expect(train.in_station).to be false
	end

	it "should recognise when the train stops at a station" do
		train_in_station
		expect(train.in_station).to be true
	end

	it "should recognise when the train is not at a station" do
		train_in_station
		train_leaves_station
		expect(train.in_station).to be false
	end

	it "should not allow people to get on the train when it is not in the station" do
		expect{train.hold(person)}.to raise_error(RuntimeError)
	end

	it "should allow people to enter the train when it is in the station" do
		train_in_station
		train.hold(person)
		expect(train.people).to eq([person])
	end

	it "the train should not leave until all the passengers have moved onto the train" do
		train_in_station
		allow(station).
	end

	#the train can only leave when all the passengers have boarded the train
	
end

#Have a system which initializes a number of trains
#Train will travel from station to station
#Train will move at different intervals- use time
#A coach of a train will hold up to 40 people
#A train has a number of coaches
#Module - should not allow a person to enter a train when it is not at the station