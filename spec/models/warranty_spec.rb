require 'spec_helper'

describe Warranty do
  describe "validations" do
    it "fails validation with no name" do
      Warranty.new.should have(1).error_on(:name)
    end

    it "fails validation with no warranty (image)" do
      Warranty.new.should have(1).error_on(:warranty)
    end

    it "fails validation with no expires on" do
      Warranty.new.should have(1).error_on(:expires_on)
    end
  end
end
