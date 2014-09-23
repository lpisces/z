class Cpanel::GroupsController < CpanelController
  before_action :set_cpanel_group, only: [:show, :edit, :update, :destroy]

  # GET /cpanel/groups
  # GET /cpanel/groups.json
  def index
    @cpanel_groups = Cpanel::Group.all
  end

  # GET /cpanel/groups/1
  # GET /cpanel/groups/1.json
  def show
  end

  # GET /cpanel/groups/new
  def new
    @cpanel_group = Cpanel::Group.new
  end

  # GET /cpanel/groups/1/edit
  def edit
    @components = Component.all
	@components_groups = {}
    @components.each do |c| 
      @components_groups[c.component] = [] if @components_groups[c.component].nil?
	  @components_groups[c.component].push c
    end
  end

  # POST /cpanel/groups
  # POST /cpanel/groups.json
  def create
    @cpanel_group = Cpanel::Group.new(cpanel_group_params)

    respond_to do |format|
      if @cpanel_group.save
        format.html { redirect_to @cpanel_group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @cpanel_group }
      else
        format.html { render :new }
        format.json { render json: @cpanel_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cpanel/groups/1
  # PATCH/PUT /cpanel/groups/1.json
  def update
    respond_to do |format|
      if @cpanel_group.update(cpanel_group_params)
        @cpanel_group.components.delete_all
        params[:cpanel_group][:component_ids].each do |c|
          @cpanel_group.components.push Component.find(c) if !Component.find_by_id(c).nil?
        end
        @cpanel_group.save
        format.html { redirect_to @cpanel_group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @cpanel_group }
      else
        format.html { render :edit }
        format.json { render json: @cpanel_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cpanel/groups/1
  # DELETE /cpanel/groups/1.json
  def destroy
    @cpanel_group.destroy
    respond_to do |format|
      format.html { redirect_to cpanel_groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cpanel_group
      @cpanel_group = Cpanel::Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cpanel_group_params
      params.require(:cpanel_group).permit(:name, :description, :componnet_ids)
    end
end
