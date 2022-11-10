module Spec
  class MatchArrayExpectation(T)
    def initialize(@expected_value : T)
    end

    def match(actual_value) : Bool
      return false unless actual_value.size == @expected_value.size

      Set.new(actual_value) == (Set.new @expected_value)
    end

    def failure_message(actual_value)
      "Expected: value #{actual_value.inspect}\nto contain exactly: #{@expected_value.inspect}"
    end

    def negative_failure_message(actual_value)
      "Expected: value #{actual_value.inspect}\nto NOT contain exactly: #{@expected_value.inspect}"
    end
  end

  module Expectations
    def match_array(value)
      Spec::MatchArrayExpectation.new value
    end

    def contain_exactly(*elements)
      Spec::MatchArrayExpectation.new elements
    end
  end
end
