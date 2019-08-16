class PersonController < ApplicationController
  def edit
    @people = Person.all
    @details = Person.columns
    Person.columns.each do | col | 
      p col
    end
    p Person.reflections['ready']
  end
end
