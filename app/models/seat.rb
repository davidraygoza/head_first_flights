class Seat < ActiveRecord::Base
  attr_accessible :baggage, :flight_id, :name
 
     validates :baggage, :numericality => { :less_than_or_equal_to => :baggage_allowance }, :presence => true 
     validate :seats_flight
 
  belongs_to :flight
 

  def seats_flight
    errors.add(:flight_id,"The flight is full") if (flight.seats.size >= flight.capacity )
  end 

  def baggage_allowance
    flight.baggage_allowance
  end  
  
end
