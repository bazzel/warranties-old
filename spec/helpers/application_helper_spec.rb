require 'spec_helper'

describe ApplicationHelper do
  describe "twitterized_type" do
    it "returns warning if type is alert" do
      helper.twitterized_type(:alert).should == "warning"
    end

    it "returns error if type is error" do
      helper.twitterized_type(:error).should == "error"
    end

    it "returns info if type is notice" do
      helper.twitterized_type(:notice).should == "info"
    end

    it "returns success if type is success" do
      helper.twitterized_type(:success).should == "success"
    end

    it "returns same value in other cases" do
      helper.twitterized_type(:foobar).should == "foobar"
    end
  end

  describe "locale_selection" do
    it "returns an array with elements consisting of language,locale pairs ordered by language" do
      I18n.stub(:available_locales).and_return([:en, :nl])
      helper.locale_selection.should eql([["English", "en"], ["Nederlands", "nl"]])
    end
  end
end
