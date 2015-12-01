class Appointment < ActiveRecord::Base
  belongs_to :company,
  class_name: "Company",
  foreign_key: "company_id"
  #
  belongs_to :employee,
  class_name: "Employee",
  foreign_key: "employee_id"

  validates :company_id,:employee_id, :description, :start_time,:end_time,:info, :presence => true
  validate :start_must_be_before_end_time

  validate :overlapping_appointments

  # Check if a given interval overlaps this interval
  def overlaps?(other)
    (start_time - other.end_time) * (other.start_time - end_time) >= 0
  end

  def conflicting?
    @appointments = Appointment.where(employee_id: self.employee_id)
    @start_end_time = (self.start_time..self.end_time)
    # Enumerable#any? returns true or false for the collection,
    # so you dont have to specify a return value
    # since its the last evaluation in the method
    @appointments.any?{|apt| @start_end_time.overlaps? (apt.start_time..apt.end_time) unless self.id == apt.id } #=> takes each appointment in appointments assigns to apt and checks against the passed in appointment object
  end

  def overlapping_appointments
    if start_time.present? && end_time.present? && conflicting?
      errors[:base] << "This appointment overlaps with another one."
    end
  end

  def start_must_be_before_end_time
    if start_time.present? && end_time.present?
      errors.add(:start_time, "must be before end time") unless
          start_time < end_time
    end
  end
end
