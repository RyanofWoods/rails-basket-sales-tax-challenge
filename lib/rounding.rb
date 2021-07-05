# frozen_string_literal: true

require 'bigdecimal/util'

module Rounding
  def self.up_to_nearest(nearest:, number:)
    remainder = number % nearest
    return number if remainder.zero?

    result = number + nearest - remainder
    result.round(2)
  end
end
