require 'register'

require 'timecop'

describe Register do
  subject { described_class.new }

  describe 'Frozen Pizza' do
    it 'should be $5.00 each' do
      subject.ring_up('Frozen Pizza', quantity: 1)
      expect(subject.total).to eq 5.00
      subject.ring_up('Frozen Pizza', quantity: 1)
      expect(subject.total).to eq 10.00
    end
  end

  describe 'Corn' do
    it 'should be $0.50 each' do
      subject.ring_up('Corn', quantity: 1)
      expect(subject.total).to eq 0.50
    end
    it 'should be 5 for $2.00' do
      subject.ring_up('Corn', quantity: 5)
      expect(subject.total).to eq 2.00
      subject.ring_up('Corn', quantity: 1)
      expect(subject.total).to eq 2.50
    end
  end

  describe 'Ground Beef' do
    it 'should be $4.99/lb' do
      subject.ring_up('Ground Beef', quantity: 1)
      expect(subject.total).to eq 4.99
    end
    it 'should allow partial pounds' do
      subject.ring_up('Ground Beef', quantity: 0.5)
      expect(subject.total).to eq 2.50
    end
  end

  describe 'Chocolate Mayfield Ice Cream' do
    it 'should be $5.99' do
      subject.ring_up('Chocolate Mayfield Ice Cream', quantity: 1)
      expect(subject.total).to eq 5.99
    end
    context 'on Wednesdays' do
      before { Timecop.freeze(Time.parse('2014-06-18 13:00:00')) }
      after  { Timecop.return }

      it 'should be BOGO' do
        subject.ring_up('Chocolate Mayfield Ice Cream', quantity: 2)
        expect(subject.total).to eq 5.99
        subject.ring_up('Chocolate Mayfield Ice Cream', quantity: 1)
        expect(subject.total).to eq 11.98
      end
    end
    context 'on Non-Wednesdays' do
      before { Timecop.freeze(Time.parse('2014-06-19 13:00:00')) }
      after  { Timecop.return }

      it 'should be NOT be BOGO' do
        subject.ring_up('Chocolate Mayfield Ice Cream', quantity: 2)
        expect(subject.total).to eq 11.98
      end
    end
  end

  describe 'Vanilla Mayfield Ice Cream' do
    it 'should be $5.99' do
      subject.ring_up('Vanilla Mayfield Ice Cream', quantity: 1)
      expect(subject.total).to eq 5.99
      subject.ring_up('Vanilla Mayfield Ice Cream', quantity: 1)
      expect(subject.total).to eq 11.98
    end
  end

  describe 'Mango' do
    context 'on Mondays' do
      before { Timecop.freeze(Time.parse('2014-06-16 13:00:00')) }
      after  { Timecop.return }
      it 'should be $0.50 each' do
        subject.ring_up('Mango', quantity: 1)
        expect(subject.total).to eq 0.50
        subject.ring_up('Mango', quantity: 1)
        expect(subject.total).to eq 1.00
      end
    end

    context 'on Non-Mondays' do
      before { Timecop.freeze(Time.parse('2014-06-17 13:00:00')) }
      after  { Timecop.return }
      it 'should be $1.00 each' do
        subject.ring_up('Mango', quantity: 1)
        expect(subject.total).to eq 1.00
        subject.ring_up('Mango', quantity: 1)
        expect(subject.total).to eq 2.00
      end
    end
  end

end
