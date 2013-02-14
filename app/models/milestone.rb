class Milestone < ActiveRecord::Base
  attr_accessible :name, :start_date, :end_date, :project_id, :status

  belongs_to :project
  
  has_many :tasks

	validates :name, :presence => true
  validate :end_date_less_than_start_date
 
  def end_date_less_than_start_date
   	if self.start_date > self.end_date
  		self.errors.add(:end_date,"End date cannot be less than start date")
  	end  	
  end

  def set_finish
    self.status ="Finished"
  end      
end
