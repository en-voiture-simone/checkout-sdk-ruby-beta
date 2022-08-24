module CheckoutSdk
  class JsonSerializer

    #TODO implement keys transformation - example: 3ds

    def self.to_custom_hash(object)
      hash = Hash.new
      object.instance_variables.each do |v|
        value = object.instance_variable_get(v)
        value = serialize_by_type(value)
        hash[v.to_s.delete("@")] = value
      end
      return hash
    end

    private
    def self.serialize_array(input_array)
      aux_array = Array.new
      input_array.map do |value|
        value = serialize_by_type(value)
        aux_array.append(value)
      end
      return aux_array
    end

    private
    def self.serialize_hash(input_hash)
      aux_hash = Hash.new
      input_hash.map do |key, value|
        value = serialize_by_type(value)
        aux_hash[key] = value
      end
      return aux_hash
    end

    private
    def self.serialize_by_type(value)
      if value.is_a?(Array)
        value = self.serialize_array(value)
      end
      if value.is_a?(Hash)
        value = self.serialize_hash(value)
      end
      if value.class.name.start_with? CheckoutSdk.name
        value = self.to_custom_hash(value)
      end
      value
    end

  end
end
