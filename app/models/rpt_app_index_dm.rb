class RptAppIndexDm < ActiveRecord::Base
  establish_connection :bing
  self.table_name = "rpt_app_index_dm"

  def self.day_index_value(index_name, days = 30)
    return RptAppIndexDm.select("app_id", "index_value", "statis_date").where("version_id = ?", "*").where("index_name = ?", index_name).limit(days).order("statis_date desc")
  end
end
