class RptAppChannelIndexDm < ActiveRecord::Base
  establish_connection :bing
  self.table_name = "rpt_app_channel_index_dm"


  def self.day_index_value(app_id, index_name, date, channel_id = false)
    if channel_id == false
      @row = RptAppChannelIndexDm.select("sum(index_value) as s").where("app_id = ?", app_id).where("index_name = ?", index_name).where("statis_date = ?", date).limit(1).order("statis_date desc")
    else
      @row = RptAppChannelIndexDm.select("sum(index_value) as s").where("channel_id like '%#%'").where("app_id = ?", app_id).where("index_name = ?", index_name).where("statis_date = ?", date).limit(1).order("statis_date desc")
    end
    return @row[0].nil? ? 0 : @row[0][:s]
  end

end
