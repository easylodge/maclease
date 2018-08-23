class Maclease::Base

  def initialize(args={})
    super()
  end

  def to_hash
    hash = {}
    self.instance_variables.each do |var|
      value = self.instance_variable_get var
      if value.class.ancestors.include?(Maclease::Base)
        value.to_hash
      elsif value.is_a?(Array)
        converted = value.collect{|el|
          if el.class.ancestors.include?(Maclease::Base)
            el.to_hash
          else
            el
          end
        }
        hash[underscore(var.to_s)] = converted
      else
        hash[underscore(var.to_s)] = value
      end
    end
    return hash
  end

  # NOTE: we use this to save some work no repetitive field validations that take lists of terms as input.
  # This expects a field called `some_example` to validates against a constant in the same class called `SOME_EXAMPLE`
  def self.validate_reference_field(field)
    values = ['not defined']
    eval("values = #{self.name}::#{field.upcase}")
    define_method("#{field}=") do |value|
      unless values.include?(value)
        raise Maclease::ValidationError.new("The field (#{field}) must be one of #{values.join(', ')}")
      else
        eval("@#{field} = value")
      end
    end
  end


  private

  def underscore(str)
    str.tr('@','').gsub(/::/, '/').gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').gsub(/([a-z\d])([A-Z])/,'\1_\2').tr("-", "_").downcase
  end

end
