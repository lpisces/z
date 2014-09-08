class ChannelStatController < ApplicationController
  def index
    @apps = App.all
  end

  def app
    @params = params.permit(:app_id, :channel_id, :version_id, :channel_group, :statis_date)
    @apps = App.all
    @app = App.where("app_id = ?", @params[:app_id]).first
    @index_names = ["日新增用户数", "日留存用户数", "累计用户"]
    @today = params[:statis_date].nil? ? Date.today.prev_day.strftime("%Y-%m-%d") : params[:statis_date]
    @today_stat = day_report(@app.app_id, @today)

    @channels = ["全部", "积分墙", "非积分墙"]
    @q = RptAppChannelIndexDm.select("channel_id", "version_id", "index_value", "index_name", "statis_date").where("statis_date = ?", @today)
    case params[:channel_group].to_i
	when 1
	  @q = @q.where("channel_id like '%#%'")
    when 2
	  @q = @q.where("channel_id not like '%#%'")
    end
    @index_names2 = ["日新增用户数", "日活跃用户数", "日留存用户数", "累计用户"]
    @q = @q.where("channel_id like '%#{params[:channel_id]}%'") if !params[:channel_id].nil?
    @q = @q.where("version_id like '%#{params[:version_id]}%'") if !params[:version_id].nil?
    @rows = @q.where("index_name in (?)", @index_names2).order("index_value desc")
    @real_rows = {}
    @rows.each do |r|
	  channel_id = r[:channel_id]
	  version_id = r[:version_id]
	  index_name = r[:index_name]
	  index_value = r[:index_value]
      if @real_rows[channel_id + "\001" + version_id].nil?
        @real_rows[channel_id + "\001" + version_id] = {}
      end
      @real_rows[channel_id + "\001" + version_id][index_name] = index_value
    end
  end

  def day_report(app_id, date)
    @day_increase_user_num = RptAppChannelIndexDm.day_index_value(app_id, "日新增用户数", date)
    @day_increase_user_num_channel = RptAppChannelIndexDm.day_index_value(app_id, "日新增用户数", date, true)
    @day_remain_user_num = RptAppChannelIndexDm.day_index_value(app_id, "日留存用户数", date)
    @day_remain_user_num_channel = RptAppChannelIndexDm.day_index_value(app_id, "日留存用户数", date, true)
	@day_total_user_num = RptAppChannelIndexDm.day_index_value(app_id, "累计用户", date)
	@day_total_user_num_channel = RptAppChannelIndexDm.day_index_value(app_id, "累计用户", date, true)
    return {:day_increase_user_num => @day_increase_user_num, :day_increase_user_num_channel => @day_increase_user_num_channel, :day_remain_user_num => @day_remain_user_num, :day_remain_user_num_channel => @day_remain_user_num_channel, :day_total_user_num => @day_total_user_num, :day_total_user_num_channel => @day_total_user_num_channel}
  end

end
