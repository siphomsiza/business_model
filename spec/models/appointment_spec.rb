require 'spec_helper'

describe Appointment do
  let(:subject) {create(:appointment)}
  it { expect(subject).to respond_to :employee }
  it { expect(subject).to respond_to :company }

  context "attrs" do
    it { expect(subject).to respond_to :description }
    it { expect(subject).to respond_to :info }
    it { expect(subject).to respond_to :start_time }
    it { expect(subject).to respond_to :end_time }
    it { expect(subject).to respond_to :employee_id }
    it { expect(subject).to respond_to :company_id }
  end

  it "should have a valid factory" do
    expect(create(:appointment)).to be_valid
  end

  context "validations" do
    it "validates description" do
      subject.description = nil
      expect(subject).not_to be_valid
      expect(subject.errors.first).to eq([:description, "can't be blank"])
    end

    it "validates start time and end time" do
      subject.start_time = Faker::Time.forward(23, :morning)
      subject.end_time = Faker::Time.backward(14, :evening)
      expect(subject).not_to be_valid
      expect(subject.errors.first).to eq([:start_time, "must be before end time"])
    end

    it "validates overlapping appointments" do
      appointment = subject.employee.appointments.first
      appointment2 = create(:appointment)
      appointment2.employee = subject.employee
      appointment2.start_time = appointment.start_time
      appointment2.end_time = appointment.end_time
      expect(appointment2).not_to be_valid
      expect(appointment2.errors.first).to eq([:base, "This appointment overlaps with another one."])
    end

  end
end
