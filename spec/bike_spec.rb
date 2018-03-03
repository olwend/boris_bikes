require 'docking_station'

describe Bike do
    it 'responds to report_broken' do
        expect(Bike.new).to respond_to :report_broken
    end

    it 'when reported broken changes working to false' do
        bike = Bike.new
        bike.report_broken
        expect(bike.working).to eq false
    end

    it 'when reorted fixed changes working to true' do
        bike = Bike.new
        bike.report_fixed
        expect(bike.working).to eq true
    end
end
