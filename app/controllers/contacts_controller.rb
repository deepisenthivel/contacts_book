class ContactsController < ApplicationController
  #List all the contacts addded
 def index
  @contacts = Contact.all
 end

 def new
 end

  #creates a new contact and saves it to the database
 def create
  @contact = Contact.new(contact_params)
  name=params[:contact][:photo].original_filename
  @contact.photo=name
  if@contact.save
    redirect_to @contact, alert: 'contact added'
  else
    render 'new'
  end
 end
 
  #finds the id of the contact requested and shows it
 def show
  @contact = Contact.find(params[:id])
 end

  #edits the record by finding the id of the contact requested 
 def edit
  @contact = Contact.find(params[:id])
 end

  #updates the record that already exists
 def update
  @contact = Contact.find(params[:id])
  name=params[:contact][:photo].original_filename
  @contact.update(:photo => name)
   if @contact.update(contact_params)
   respond_to do |format|
    format.html{redirect_to @contact, notice: 'contact updated'}
    end
   else
    render 'edit'
   end
 end

  #deletes the record
 def destroy
  @contact= Contact.find(params[:id])
  @contact.destroy
  respond_to do |format|
  format.html { redirect_to contacts_path, notice: 'contact deleted'}
  end
 end

 def ph
  name=params[:contact][:photo].original_filename
    directory = "public/data"
   return path = File.join(directory, name) #returns the selected image path
 end

  #strong parameters
 def contact_params
  File.open(ph, "wb") { |f| f.write(params[:contact][:photo].read) }
    params.require(:contact).permit(:first_name, :last_name, :email_id, :mobile_no, :address)
  end
end
