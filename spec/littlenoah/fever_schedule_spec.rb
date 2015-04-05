require 'spec_helper'
require 'littlenoah/fever_schedule'

describe Littlenoah::FeverSchedule do
  subject {@schedule}

  describe :schedules do
    describe :sunday do
      it {expect(Littlenoah::FeverSchedule.sunday.periods).to match_array([8, 16, 21])}
    end
  end

  describe :next_period do
    before {
      @schedule = Littlenoah::FeverSchedule.sunday
    }
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

end
