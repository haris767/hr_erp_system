class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :father_name
      t.string :employee_number
      t.string :national_id
      t.date :dob
      t.string :gender
      t.string :grade
      t.string :phone
      t.string :email
      t.text :address
      t.string :personal_number
      t.string :company_number
      t.text :assets_details
      t.string :department
      t.string :job_title
      t.string :employment_type
      t.date :hire_date
      t.string :work_location
      t.string :manager
      t.string :job_status
      t.string :blood_group
      t.string :employees_service
      t.string :salary_structure
      t.string :payment_method
      t.string :bank_name
      t.string :bank_account_number
      t.string :erp_role

      t.timestamps
    end
  end
end
