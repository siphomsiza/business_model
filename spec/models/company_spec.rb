require 'spec_helper'

describe Company do
  let(:subject) {create(:company)}
  it { expect(subject).to respond_to :employees }
  it { expect(subject).to respond_to :appointments }

  context "attrs" do
    it { expect(subject).to respond_to :company_name }
  end

  it "should have a valid factory" do
    expect(create(:company)).to be_valid
  end

  context "validations" do
    it "validates .name" do
      subject.company_name = nil
      expect(subject).not_to be_valid

      subject.company_name = ''
      expect(subject).not_to be_valid

      subject.company_name = "Valid"
      expect(subject).to be_valid
    end
  end
end
