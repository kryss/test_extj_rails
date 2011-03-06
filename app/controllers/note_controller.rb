class NoteController < ApplicationController
  # GET /notes/new.xml
  def new
    
  end

  def index
  end

  def delete
  end

  def update
  end

  def create
    @note = Note.new()
    
    @note.name = params["data"]["name"]
    @note.content = "Bite Content"
    respond_to do |format|
      if @note.save
        format.html { redirect_to(@note, :notice => 'note was successfully created.') }
        format.xml  { render :xml => @note, :status => :created, :location => @note }
        # format.json { render :json => @note }
        format.json { render :json => @note.id }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
       # format.json  { render :json => @note.errors, :status => :unprocessable_entity }
        format.json { render :json => @note.id }
      end
    end
  end
end
