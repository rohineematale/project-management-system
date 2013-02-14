class Project < ActiveRecord::Base
  attr_accessible :desc, :end_date, :name, :start_date, :user_ids, :status

	#validates :name, :presence => true

  has_many :user_projects
  has_many :users, :through => :user_projects

  has_many :milestones

  validates :name, :presence => true
  
 # validates :status, :inclusion => { :in => %w(Start Inprogress Finished),
  #  :message => "%{value} is not a valid status" }
  
  validate :end_date_less_than_start_date

  def set_finish
    self.status="Finished"
  end
  
  def end_date_less_than_start_date
  	if self.start_date > self.end_date
  		self.errors.add(:end_date,"End date cannot be less than start date")
  	end  	
  end  

end
