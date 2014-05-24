class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  before_filter :login_required
  before_filter :admin_required


  def new
    @article = Article.new
  end

  def edit
  end

  def update
    return redirect_to @article, notice: I18n.t('common.update_failed') if not @article.update(article_params)
    return redirect_to @article, notice: I18n.t('common.update_succeed')
  end

  def create
    @article = Article.where(:title => article_params[:title], :category_id => article_params[:category_id]).first
    if @article.nil?
      @article = Article.create(article_params)
    end
    return redirect_to @article, notice: I18n.t('common.create_failed') if not @article.save
    return redirect_to articles_path, notice: I18n.t('common.create_succeed')
  end

  def index
    @q = Article.search(params[:q])
    @articles = @q.result(distinct: true).order('id desc').page params[:page]
  end

  def show 
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: I18n.t('common.destroy_succeed')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :sub_title, :category_id, :summary, :content)
    end

end
