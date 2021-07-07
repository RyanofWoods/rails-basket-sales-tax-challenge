# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Rounding module' do
  let(:dummy_class) { Class.new { include Rounding } }

  context 'round_up_to_nearest' do
    let(:nearest) { 0.05 }

    it 'returns correctly for 0.56' do
      number = 0.56

      result = Rounding.up_to_nearest(nearest: nearest, number: number)

      expect(result).to eq(0.60)
    end

    it 'returns correctly for 1.64' do
      number = 1.64

      result = Rounding.up_to_nearest(nearest: nearest, number: number)

      expect(result).to eq(1.65)
    end

    it 'returns correctly for 1.61' do
      number = 1.61

      result = Rounding.up_to_nearest(nearest: nearest, number: number)

      expect(result).to eq(1.65)
    end

    it 'returns correctly for 1.60' do
      number = 1.60

      result = Rounding.up_to_nearest(nearest: nearest, number: number)

      expect(result).to eq(1.60)
    end
  end
end
