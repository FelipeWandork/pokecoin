class HistoricController < ApplicationController
  def write(action, details)
    t = Time.now

    File.open('historic.txt', 'a') do |f|
      f.puts "#{t}: #{action} -> #{details.name} -> Base Experience: #{details.base_experience}"
    end
    

  end

  def read
    @content = []
    i = 0
    File.open('historic.txt', 'r') do |f|
      f.each_line do |linha|
        @content.push(linha)
        i = i + 1
      end

    end
  end
end
