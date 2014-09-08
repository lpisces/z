class StatController < ApplicationController
  def index
    @apps = App.all
  end

  def app
    @params = params.permit(:app_id)
    @apps = App.all
    @index_names = ["日新增用户数", "日活跃用户数", "日平均单次使用时长", "日启动次数", "累计用户"]
    @app = App.where("app_id = ?", @params[:app_id]).first
    @today = Date.today.prev_day.strftime("%Y-%m-%d")
    @yesterday = Date.today.prev_day.prev_day.strftime("%Y-%m-%d")
	@today = "2014-08-24"
	@yesterday = "2014-08-23"
    @today_stat = day_report(@app.app_id, @today)
    @yesterday_stat = day_report(@app.app_id, @yesterday)
	@days = []
    @day_increase_user_nums, @day_active_user_nums, @day_increase_user_percents, @day_boot_nums, @day_avg_use_times, @day_total_user_nums = [], [], [], [], [], []
    cur_day = Date.strptime(@today, "%Y-%m-%d")
    while @days.size <= 30
      @days.push cur_day.strftime("%Y-%m-%d")
      tmp = day_report(@app.app_id, cur_day.strftime("%Y-%m-%d"))
      @day_increase_user_nums.push tmp[:day_increase_user_num]
      @day_active_user_nums.push tmp[:day_active_user_num]
      @day_increase_user_percents.push tmp[:day_increase_user_percent]
      @day_boot_nums.push tmp[:day_boot_num]
      @day_avg_use_times.push tmp[:day_avg_use_time_int]
      @day_total_user_nums.push tmp[:day_total_user_num]
      cur_day -= 1
    end
    @index_values = [@day_increase_user_nums, @day_active_user_nums, @day_avg_use_times, @day_boot_nums, @day_total_user_nums]
  end

  def day_report(app_id, date)
    @day_increase_user_num = RptAppIndexDm.day_index_value(app_id, "日新增用户数", "*", date)
    @day_active_user_num = RptAppIndexDm.day_index_value(app_id, "日活跃用户数", "*", date)
    @day_increase_user_percent = @day_active_user_num == 0 ? "-" :( (@day_increase_user_num / @day_active_user_num).round(2) * 100).to_s + "%"
    @day_boot_num = RptAppIndexDm.day_index_value(app_id, "日启动次数", "*", date)
    @day_total_user_num = RptAppIndexDm.day_index_value(app_id, "累计用户", "*", date)
    @day_7day_active_user_num = RptAppIndexDm.day_index_value(app_id, "过去7天活跃用户", "*", date)
    @day_30day_active_user_num = RptAppIndexDm.day_index_value(app_id, "过去30天活跃用户", "*", date)
    @day_avg_use_time = sec2str(RptAppIndexDm.day_index_value(app_id, "日平均单次使用时长", "*", date).to_i)
    @day_avg_use_time_int = RptAppIndexDm.day_index_value(app_id, "日平均单次使用时长", "*", date).to_i
    return {:day_increase_user_num => @day_increase_user_num, :day_active_user_num => @day_active_user_num, :day_increase_user_percent => @day_increase_user_percent, :day_boot_num => @day_boot_num, :day_avg_use_time => @day_avg_use_time, :day_avg_use_time_int => @day_avg_use_time_int, :day_total_user_num => @day_total_user_num, :day_7day_active_user_num => @day_7day_active_user_num, :day_30day_active_user_num => @day_30day_active_user_num}
  end

  def sec2str(sec)
    sec = sec.to_i
    h = (sec / 3600).to_i
    m = ((sec % 3600) / 60).to_i
    s = sec % 60
    return "#{h.to_s.rjust(2, '0')}:#{m.to_s.rjust(2, '0')}:#{s.to_s.rjust(2, '0')}"
  end
end
