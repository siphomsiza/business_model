require 'spec_helper'

describe Role do
  let(:subject) {create(:role)}

  context "attrs" do
    it { expect(subject).to respond_to :role }
  end

  it "should have a valid factory" do
    expect(create(:role)).to be_valid
  end

  it "should have a role normal user" do
    subject.role = "Normal User"
    expect(subject).to be_valid
    expect(subject.role).to eq("Normal User")
  end

  it "should have a role admin user" do
    subject.role = "Admin User"
    expect(subject).to be_valid
    expect(subject.role).to eq("Admin User")
  end

end
