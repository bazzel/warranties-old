require 'spec_helper'

describe Warranty do
  describe "validations" do
    it "fails validation with no name" do
      Warranty.new.should have(1).error_on(:name)
    end

    it "passes validation with name" do
      Warranty.new(:name => 'foo').should have(:no).errors_on(:name)
    end

    it "fails validation with no warranty (image)" do
      Warranty.new.should have(1).error_on(:warranty)
    end
  end
end
