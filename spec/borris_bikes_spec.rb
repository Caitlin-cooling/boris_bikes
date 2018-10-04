require 'borris_bikes'
  describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases a bike if one is avaiable' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
     end
     it 'raises error if no bikes are available' do
       expect { subject.release_bike }.to raise_error "Oops, there are no bikes here"
     end
 end

   it { is_expected.to respond_to(:dock).with(1).argument }
   it { is_expected.to respond_to(:bike) }


  describe '#dock' do
    it 'docks bike if station is not full' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end
    it 'raises an error if there is more than 20 bikes docked' do
      bike = Bike.new
      20.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error "Station full"
    end
  end
end
