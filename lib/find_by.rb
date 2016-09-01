class Module

  def create_finder_methods(*attributes)
    attributes.each do |attribute|
      method = %Q{
        def self.find_by_#{attribute}(id)
          self.all.find { |record| record.#{attribute} == id }
        end
      }
      class_eval(method)
    end
  end

end
