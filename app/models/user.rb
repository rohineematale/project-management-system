class User < ActiveRecord::Base
  attr_accessible :name, :project_ids

  #validates :name, :presence => true

  has_many :user_projects
  has_many :projects, :through => :user_projects
  
  has_many :tasks
  
  #validates :name, :format => { :with => /\A[a-zA-Z]+\z/,
   #u :message => "Only letters allowed" }

end
