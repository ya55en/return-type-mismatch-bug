require "spec"
require "../src/spec_extention"

describe Spec::Expectations do

  describe "#contain_exactly" do
    it "does NOT confirm containment for non-empty array against empty expected values" do
      [1].should_not contain_exactly()
    end
  end
end
