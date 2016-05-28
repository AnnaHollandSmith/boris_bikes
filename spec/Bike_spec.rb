require 'Bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  describe '#report_bike' do
  	it 'responds report broken' do
  		expect(Bike.new).to respond_to :report_broken
  	end

    it 'allows user to report broken bikes' do
    	bike = Bike.new
    	bike.report_broken
    	expect(bike.broken?).to eq true
    end
  end 


end