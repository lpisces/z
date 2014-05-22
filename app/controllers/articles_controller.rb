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
    @article = Article.where(:title => params[:title], :sub_title => params[:sub_title], :category_id => params[:category_id], :summary => params[:summary]).first_or_create

    if not @article.save
        return redirect_to @article, notice: I18n.t('common.create_failed') 

      
  end

  def index
    @q = Article.search(params[:q])
    @articles = @q.result(distinct: true).order('id desc').page params[:page]
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_params
      params.require(:article).permit(:title, :sub_title, :category_id, :summary, :content)
    end

end
