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

  describe "brand_name" do
    subject do
      FactoryGirl.build(:warranty, :brand_name => "Philips")
    end

    let(:user) do
      subject.user
    end

    describe "new brand" do
      it "creates a new brand object" do
        lambda {
          subject.save
        }.should change(Brand, :count).by(1)
      end

      it "assigns newly created brand to user's collection" do
        lambda {
          subject.save
        }.should change(user.brands, :count).by(1)
      end

      it "assigns new brand to warranty" do
        subject.save
        subject.brand.should_not be_nil
        subject.brand.name.should == "Philips"
      end

      it "does not create a new brand in initialization" do
        lambda {
          subject
        }.should_not change(Brand, :count)
      end

      it "does not create a new brand object when validation for warranty fails" do
        lambda {
          subject.name = nil
          subject.save
        }.should_not change(Brand, :count)
      end

      describe "when created for a particular user" do
        # When using collection.create this should not raise an exception, so test explicitly.
        it "still works" do
          current_user = FactoryGirl.create(:user)
          params = FactoryGirl.attributes_for(:warranty, :user => nil)
          params[:brand_name] = "Foo bar"
          lambda {
            @warranty = current_user.warranties.create(params)
          }.should_not raise_error
        end

      end
    end

    describe "existing brand" do
      let!(:brand) do
        FactoryGirl.create(:brand, :name => "Some brandname", :user => user)
      end

      it "assigns existing brand to warranty" do
        lambda {
          subject.brand_name = brand.name
          subject.save
        }.should_not change(Brand, :count)
        subject.brand.name.should == brand.name
      end

      it "retrieves name of brand" do
        subject.brand_name = brand.name
        subject.save
        subject.brand_name.should == brand.name
      end
    end

    describe "no brand" do
      subject do
        FactoryGirl.build(:warranty)
      end

      it "returns nil when no brand assigned" do
        subject.brand_name = nil
        subject.save
        subject.brand_name.should be_nil
      end

      it "clears brand" do
        subject.brand_name = "Whatever"
        subject.save
        subject.brand.should_not be_nil

        subject.brand_name = ''
        subject.save
        subject.brand.should be_nil
      end

      it "does not create a new brand when brand_name is nil" do
        lambda {
          subject.brand_name = nil
          subject.save
        }.should_not change(Brand, :count)
      end

      it "does not create a new brand when brand_name is empty" do
        lambda {
          subject.brand_name = ""
          subject.save
        }.should_not change(Brand, :count)
      end

      it "does not create a new brand when brand_name contains only spaces" do
        lambda {
          subject.brand_name = "   "
          subject.save
        }.should_not change(Brand, :count)
      end

      it "does not change brand when not provided" do
        subject.brand_name = "Whatever"
        subject.save

        subject.name = 'Whenever'
        lambda {
          subject.save
        }.should_not change(subject, :brand)
      end
    end
  end
end
