class Scsession < ActiveRecord::Base
   belongs_to :counselling
   validates_presence_of :issue
   
  def to_key
    new_record? ? nil : [ self.send(self.class.primary_key) ]
  end

  def persisted?
    false
  end
  
end
