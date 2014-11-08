require 'station'

describe Station do

let(:person)  {double :person}
let(:station) {Station.new   }
let(:a_train) {double :train }

	it "should have no people when initialized" do
		expect(station.people).to eq([])
	end

	it "should hold people in the station" do
		station.hold(person)
		expect(station.people).to eq([person])
	end

	it "should allow people to move out of the station" do
		station.hold(person)
		station.release(person)
		expect(station.people).to eq([])
	end

	it "should hold no trains when initialized" do
		expect(station.trains).to eq([])
	end

	it "should allow a train to enter the station" do
		station.hold_a_train(a_train)
		expect(station.trains).to eq([a_train])
	end

	it "should allow a train to leave the station" do
		station.hold_a_train(a_train)
		station.release_a_train(a_train)
		expect(station.trains).to eq([])
	end

end




