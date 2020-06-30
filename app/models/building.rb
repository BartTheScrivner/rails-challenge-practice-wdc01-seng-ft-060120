class Building < ApplicationRecord
  has_many :offices
  has_many :companies, through: :offices

  def num_of_floors_available
    # Will not work until relationships and schema are corretly setup

    all_floors = Array(1..self.num_of_floors)
    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def empty_offices
    num_of_floors_available.map { |f| offices.build(floor: f) }
  end

  def total_rent_earned
    self.rent_per_floor * self.companies.count
  end

end
