require 'yaml'
require 'wordplay'

class Bot
  attr_reader :name

  def initialize(options)
    @name = options[:name] || 'Unnamed Bot'
    begin
      @data = YAML.load(File.(options[:data_file]))
    rescue
      raise "Can't load bot data"
    end
  end


  def greeting
    random_response :greeting
  end

  def farwell
    random_response :farwell
  end

  private

  def random_response(key)
    random_index = rand(@data[:response][key].length)
    @data[:response][key][random_index].gsub(/\[name\]/, @name)
  end
end
