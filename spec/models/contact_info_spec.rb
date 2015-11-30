require 'spec_helper'

describe ContactInfo do
  let(:subject) {create(:contact_info)}
  it { expect(subject).to respond_to :employee }

  context "attrs" do
    it { expect(subject).to respond_to :email }
    it { expect(subject).to respond_to :mobile_number }
    it { expect(subject).to respond_to :work_number }
  end

  it "should have a valid factory" do
    expect(create(:contact_info)).to be_valid
  end
end
