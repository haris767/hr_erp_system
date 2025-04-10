class Employee < ApplicationRecord
  before_create :generate_employee_number

  # Basic presence validations
  validates :full_name, :father_name, :national_id, :dob,
  :gender, :phone, :email, :department, :job_title,
  :employment_type, :hire_date, :work_location,
  :job_status, :erp_role, presence: true

# Uniqueness constraints
validates :employee_number, :national_id, :email, uniqueness: true

# Format validations
validates :email, presence: true

 # validates :phone, :personal_number, :company_number,
 #   format: { with: /\A\d{10,15}\z/, message: "must be 10 to 15 digits" },
 #   allow_blank: true

 # validates :national_id,
 #   format: { with: /\A\d{10,20}\z/, message: "must be numeric and 10 to 20 digits" }

 # Length validations (optional)
 validates :full_name, :father_name, length: { maximum: 100 }
validates :address, length: { maximum: 500 }

# Inclusion validations
validates :gender, inclusion: { in: %w[Male Female Other] }
validates :employment_type, inclusion: { in: %w[Permanent Contract Intern Temporary] }
validates :job_status, inclusion: { in: %w[Active Inactive On Leave Resigned Terminated] }, allow_blank: true
validates :blood_group, inclusion: { in: %w[A A+ A- B B+ B- AB AB+ AB- O O+ O-] }, allow_blank: true
validates :payment_method, inclusion: { in: %w[Bank Cash Cheque] }, allow_blank: true

# Optional: custom validations (e.g., future date check)
validate :dob_cannot_be_in_the_future
validate :hire_date_cannot_be_in_the_future


  private

  def generate_employee_number
    last_employee = Employee.order(:created_at).last
    last_number = last_employee&.employee_number&.gsub(/[^\d]/, "")&.to_i || 0
    new_number = last_number + 1
    self.employee_number = "EMP#{new_number.to_s.rjust(4, '0')}"  # => e.g., EMP0001
  end

  def dob_cannot_be_in_the_future
  errors.add(:dob, "can't be in the future") if dob.present? && dob > Date.today
  end

  def hire_date_cannot_be_in_the_future
  errors.add(:hire_date, "can't be in the future") if hire_date.present? && hire_date > Date.today
  end
end
