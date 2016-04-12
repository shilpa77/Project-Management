module ApplicationHelper
  
   def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-error"
      when :alert
        "alert-block"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end
  
  def google_pie_chart(data, options = {})
    puts "###################################"
    puts data
    puts options
    p options[:width] ||= 250
    options[:height] ||= 100
    options[:colors] = %w(0DB2AC F5DD7E FC8D4D FC694D FABA32 704948 968144 C08FBC ADD97E)
    dt = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-."
    options[:divisor] ||= 1

    while (data.map { |k,v| v }.max / options[:divisor] >= 4096) do
      puts "$$$$$$$$$$$$$$$$$$$$$$$$$$4"
      p options[:divisor] *= 10
    end

    opts = {
      :cht => "p",
      :chd => "s:#{data.map{|k,v|v=v/options[:divisor];dt[v/64..v/64]+dt[v%64..v%64]}}",
      :chl => "#{data.map { |k,v| CGI::escape(k + " (#{v})")}.join('|')}",
      # :chl => "Rails|.Net|Java",
      :chs => "#{options[:width]}x#{options[:height]}",
      # :chco => options[:colors].slice(0, data.length).join(',')
    }
    # image_tag("http://chart.apis.google.com/chart?cht=p&chs=400x200&chd=s:YMSG9&chtt=SDRuby+Fu+level&chl=matt|rob|patrick|ryan|jordan")
    # image_tag("http://chart.apis.google.com/chart?cht=p&chs=400x200&chd=s:YMSG9&chtt=SDRuby+Fu+level&chl=matt|rob|patrick|ryan|jordan")
    image_tag("http://chart.apis.google.com/chart?#{opts.map{|k,v|"#{k}=#{v}"}.join('&amp;')}")
  rescue
  end
end
