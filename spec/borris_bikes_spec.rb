require 'borris_bikes'
require 'pry'
  describe DockingStation do
  let(:bike) { double :bike }
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases a bike if one is avaiable' do
      bike = double(:bike, working?: true)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
     end
     it 'raises error if no bikes are available' do
       expect { subject.release_bike }.to raise_error "Oops, there are no bikes here"
     end
     it "should not release a broken bike" do
       bike = double(:bike, report_as_broken: false, working?: false)
       subject.dock(bike)
       bike.report_as_broken
       expect{ subject.release_bike }.to raise_error "This bike is broken"
     end
 end

   it { is_expected.to respond_to(:dock).with(1).argument }
   it { is_expected.to respond_to(:bike) }


  describe '#dock' do
    it 'docks bike if station is not full' do
      expect(subject.dock(bike)).to eq (bike)
    end
    it 'raises an error if there is more than default capacity bikes docked' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error "Station full"
    end
    it "checks if the bike is broken after the user docks the bike" do
      bike = double(:bike, report_as_broken: false)
      bike.report_as_broken
      expect(subject.dock(bike)).to eq bike
    end
  end

  describe '#initialize' do
    it 'allows the value of capacity to be changed' do
      station = DockingStation.new(50)
      expect(station.capacity).to eq 50
    end
    it 'uses the default capacity when done is provided' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
    it 'raises an error if there is more than capacity bikes docked' do
      station = DockingStation.new(50)
      50.times { station.dock(bike) }
      expect { station.dock(bike) }.to raise_error "Station full"
    end
  end
end
