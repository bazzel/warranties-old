require 'spec_helper'

describe Settings do
  it "returns S3 credentials" do
    Settings.s3_credentials.access_key_id.should == 'mykey'
    Settings.s3_credentials.secret_access_key.should == 'mysecret'
  end
end
