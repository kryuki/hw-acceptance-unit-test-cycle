require 'rails_helper'

describe MoviesHelper do
  describe '#oddness' do
    before :each do 
      @odd_number = 3
      @even_number = 4
      @zero = 0
    end

    context 'When the count is odd' do
      it 'returns "odd" when count is odd' do
        expect(@odd_number.odd?).to equal(true)
      end
    end
    context 'When the count is even' do
      it 'returns "even" when count is even' do
        expect(@even_number.odd?).to equal(false)
        
      end
    end
    context 'When the count is zero' do
      it 'returns "even" when count is zero' do
        expect(@zero.odd?).to equal(false)
      end
    end
  end
end 