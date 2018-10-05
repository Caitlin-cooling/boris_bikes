require 'borris_bikes'
describe Bike do
    it { is_expected.to respond_to :working? }

    it "should let me report my bike as broken" do
      bike = Bike.new
      expect(bike.working?(false)).to eq(false)
    end

    it "should default to working bike" do
      bike = Bike.new
      expect(bike.working?()).to eq(true)
    end

end
