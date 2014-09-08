class RptAppIndexDm < ActiveRecord::Base
  establish_connection :bing
  self.table_name = "rpt_app_index_dm"

  def self.day_index_value(app_id, index_name, version_id, date)
    @row = RptAppIndexDm.select("app_id", "index_value", "statis_date", "index_name").where("app_id = ?", app_id).where("version_id = ?", version_id).where("index_name = ?", index_name).where("statis_date = ?", date).limit(1).order("statis_date desc")
    return @row[0].nil? ? 0 : @row[0][:index_value]
  end

  def self.days_index_value(app_id, index_name, version_id, days = 30)
    @rows = RptAppIndexDm.select("app_id", "index_value", "statis_date", "index_name").where("app_id = ?", app_id).where("version_id = ?", version_id).where("index_name = ?", index_name).limit(days).order("statis_date desc")
    return @rows
  end

end
