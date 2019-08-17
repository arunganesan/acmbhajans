class RagaController < ApplicationController
  def edit
    @schema = []
    Raga.columns.each do | col | 
      @schema << [col.name, col.sql_type]
    end
    
    @contents = Raga.all

    render :json => {
      'schema': @schema,
      'contents': @contents,
    }
  end
end
