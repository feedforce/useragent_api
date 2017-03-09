require "spec_helper"

RSpec.describe UseragentApi do
  it "has a version number" do
    expect(UseragentApi::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
