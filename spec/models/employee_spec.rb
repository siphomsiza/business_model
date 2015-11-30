require 'spec_helper'

describe Employee do
  let(:subject) {create(:employee)}
  it { expect(subject).to respond_to :company }
  it { expect(subject).to respond_to :appointments }
  it { expect(subject).to respond_to :contact_info }
  it { expect(subject).to respond_to :roles }

  context "attrs" do
    it { expect(subject).to respond_to :first_name }
    it { expect(subject).to respond_to :surname }
    it { expect(subject).to respond_to :company_id }
  end

  context "validations" do
    let(:normal_role) {create(:role)}
    let(:admin_role) {create(:admin_role)}

    it "validates user" do
      subject.username = nil
      expect(subject).not_to be_valid

      subject.password = ''
      expect(subject).not_to be_valid
    end

    it "add normal role user" do
      subject.roles << normal_role
      expect(subject.has_role?("Normal User")).to be(true)
    end

    it "add admin role" do
      subject.roles << admin_role
      expect(subject.has_role?("Admin User")).to be(true)
    end

  end

end
