class HomeController < ApplicationController
  def index
    @index_names = ["日留存用户数", "日留存用户数", "日新增用户数", "日活跃用户数", "日请求用户数", "日平均单次使用时长", "日启动次数", "累计用户", "过去7天活跃用户", "过去30天活跃用户"]
    @index_values = {}
    @index_names.each do |i|
      @index_values[i] = RptAppIndexDm.day_index_value(i, 6)
    end 
  end
end
