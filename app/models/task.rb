class Task < ActiveRecord::Base
  attr_accessible :end_date, :milestone_id, :name, :start_date, :status, :user_id

  belongs_to :milestone 
  belongs_to :user 

  #validates :user_id, :numericality => true
  #validates :milestone_id, :numericality => true

  after_create :status_validation
 
  validates :name, :presence => true
    
  validate :end_date_less_than_start_date
  
  def end_date_less_than_start_date
    puts"dddd"
    if self.start_date > self.end_date
       self.errors.add(:end_date,"End date cannot be less than start date")
    end   
  end 
   
    def set_finish
      self.status="Finished"
    end
    
  protected
  def status_validation
    if end_date < Date.today
      self.status = "finished"
    end
  end

end
