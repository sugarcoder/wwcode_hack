require 'rails_helper'

RSpec.describe Event, :type => :model do
  describe "Event time formate" do
    before(:each) do
      @event = build(:event, starting_time: Time.zone.local(2014,3,24,14,50,0), ending_time: Time.zone.local(2014,3,24,16,50,0) )
    end
    
    context "#starting_date" do
      it 'should returns event starting date with hour' do
        expect(@event.starting_date).to eq "03/24/2014  2:50 PM"
      end
    end

    context "#ending_date" do
      it 'should returns event starting date with hour' do
        expect(@event.ending_date).to eq "03/24/2014  4:50 PM"
      end
    end

    context "#starting hour" do
      it 'should returns starting hour' do
        expect(@event.starting_hour).to eq " 2:50 PM"
      end
    end

    context "#ending hour" do
      it 'should returns ending hour' do
        expect(@event.ending_hour).to eq " 4:50 PM"
      end
    end

    context "#starting_date_with_full_weekday_name" do
      it 'should returns starting date with full weekday name' do
        expect(@event.starting_date_with_full_weekday_name).to eq "Monday, March 24, 2014"
      end
    end

    context "#ending_date_with_full_weekday_name" do
      it 'should returns ending date with full weekday name' do
        expect(@event.ending_date_with_full_weekday_name).to eq "Monday, March 24, 2014"
      end
    end

  end

  describe ".waiting_list_slot" do
    it 'should be half of event slots if slots are even' do
      event = build(:event, slot: 4)
      expect(event.waiting_list_slot).to eq 2
    end

    it "should be half of event slots plus 1 if slots are odd" do
      event = build(:event, slot: 5)
      expect(event.waiting_list_slot).to eq 3
    end
  end

end
