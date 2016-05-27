require 'Van'

describe Van do 
  describe '#collect_broken_bikes' do
    it 'collects single broken bike from docking station' do
      station = DockingStation.new(1)
      bike = Bike.new
      bike.report_broken
      station.dock(bike)
      van = Van.new
      expect(van.collect_broken_bikes(station)).to eq [bike]
	end
    it 'collects multiple broken bikes from the docking station when all bikes are broken' do
      station = DockingStation.new(2)
      bike1 = Bike.new
      bike2 = Bike.new
      bike1.report_broken
      bike2.report_broken
      station.dock(bike1)
      station.dock(bike2)
      van = Van.new
      expect(van.collect_broken_bikes(station)).to eq [bike1, bike2]
    end
     it 'collects only broken bikes' do
      station = DockingStation.new(2)
      bike1 = Bike.new
      bike2 = Bike.new
      bike1.report_broken
      station.dock(bike1)
      station.dock(bike2)
      van = Van.new
      expect(van.collect_broken_bikes(station)).to eq [bike1]
    end


      
  end

end