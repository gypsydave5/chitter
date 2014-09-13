require 'spec_helper'

describe Chit do

  context "Demonstration of how datamapper works" do

    it 'should be created and then retrieved from the db' do
      expect(Chit.count).to eq(0)
      Chit.create(:content => "Makers Academy",
                  :tags => "http://www.makersacademy.com/")
      expect(Chit.count).to eq(1)
      link = Chit.first
      expect(link.tags).to eq("http://www.makersacademy.com/")
      expect(link.content).to eq("Makers Academy")
      link.destroy
      expect(Chit.count).to eq(0)
    end

  end

end