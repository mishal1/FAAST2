require 'person'

describe Person do

	let(:person)  {Person.new     }
	let(:station) {double :station}
	
	it "shouldn't be tapped into station on initialization" do
		expect(person.tapped_in?).to be false
	end

	it "should be able to tap into station" do
		allow(station).to receive(:hold).with(person)
		person.tap_in_to(station)
		expect(person.tapped_in?).to be true
	end

	it "should be able to tap out of the station" do
		allow(station).to receive(:hold).with(person)
		person.tap_in_to(station)
		allow(station).to receive(:release).with(person)
		person.tap_out_of(station)
		expect(person.tapped_in?).to be false
	end

	it "should move to station when tapped in" do
		expect(station).to receive(:hold).with(person)
		person.tap_in_to(station)
	end

	it "should move out of station when tapped out" do
		expect(station).to receive(:release).with(person)
		person.tap_out_of(station)
	end

end