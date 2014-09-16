require "spec_helper"

RSpec.describe "VERSION" do
  it "returns sting with 3 components" do
    expect(Urbanity::VERSION).to match(/\d+\.\d+\.\d+/)
  end
end
