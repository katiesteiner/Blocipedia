class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find(params[:user_id])
    @collaborator = Collaborator.new(wiki: @wiki, user: @user)
    
    if @collaborator.save
      flash[:notice] = "Collaborator was added to wiki."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error. Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find(params[:user_id])
    collaborator = Collaborator.find_by(user: @user, wiki: @wiki)

    if collaborator.destroy
      flash[:notice] = "Collaborator was deleted from wiki."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error. Please try again."
      redirect_to edit_wiki_path(@wiki)
    end

  end
end
