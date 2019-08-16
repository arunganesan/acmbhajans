class PersonController < ApplicationController
  def edit
    @people = Person.all
  end
end
