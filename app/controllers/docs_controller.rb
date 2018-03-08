class DocsController < ApplicationController
  before_action :find_doc, only: [:show, :edit, :update, :destroy]
#index for view
  def index
    @docs = Doc.all.order("created_at DESC")

  end
#show for view
  def show
  end
#for view
  def new
    @doc = Doc.new
  end
#method to create, but does not have view
  def create
    @doc = Doc.new(doc_params)

    if @doc.save
      redirect_to @doc
    else
      #render doesnt refresh the page - its stays where u r
      render 'new'
    end
  end
#edit is for view file
  def edit
  end
#does not have a view
  def update
    if @doc.update(doc_params)
      redirect_to @doc
    else
      render 'edit'
    end
  end

  def destroy
    @doc.destroy
    redirect_to docs_path
  end

#prive so they are applied above but are not shown? to reduce redundancy
  private

  def find_doc
    @doc = Doc.find(params[:id])

  end

  def doc_params
    params.require(:doc).permit(:title, :content)
  end

end
