require 'spec_helper'
require 'littlenoah/fever_schedule'

describe Littlenoah::FeverSchedule do
  subject {@schedule}
  before {
    @schedule = Littlenoah::FeverSchedule.sunday
  }

  describe :schedules do
    describe :sunday do
      it {expect(Littlenoah::FeverSchedule.sunday.periods).to match_array([8, 16, 21])}
    end
  end

  describe :next_period do
    describe :next_period_from do
      it {expect(@schedule.next_period_from(0)).to eq 8}
      it {expect(@schedule.next_period_from(9)).to eq 16}
      it {expect(@schedule.next_period_from(17)).to eq 21}
    end
    describe :next_period_from_with_same_time do
      it {expect(@schedule.next_period_from(8)).to eq 8}
      it {expect(@schedule.next_period_from(16)).to eq 16}
      it {expect(@schedule.next_period_from(21)).to eq 21}
    end
  end

  describe :fever? do
    describe :true do
      it {expect(@schedule.fever?(8)).to eq true}
      it {expect(@schedule.fever?(16)).to eq true}
      it {expect(@schedule.fever?(21)).to eq true}
    end

    describe :false do
      [0, 1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 22, 23].each do |n|
        it {expect(@schedule.fever?(n)).to eq false}
      end
    end
  end

end
