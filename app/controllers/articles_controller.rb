class ArticlesController < ApplicationController

  before_filter :login_required
  before_filter :admin_required


  def new
    @article = Article.new
  end

  def edit
  end

  def update
  end

  def create
  end

  def index
    @q = Article.search(params[:q])
    @articles = @q.result(distinct: true).order('id desc').page params[:page]
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:article).permit(:title, :sub_title, :category_id, :summary, :contents)
    end

end
