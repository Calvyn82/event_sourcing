module Todo
  class User
    def initialize(first_name: nil, last_name: nil)
      @first_name = first_name
      @last_name  = last_name
    end

    def first_name
      @first_name.capitalize if @first_name
    end

    def last_name
      @last_name.capitalize if @last_name
    end

    def validations
      errors = []
      errors << "First name can't be blank." unless @first_name =~ /\S/
      errors << "Last name can't be blank." unless @last_name =~ /\S/
      errors
    end
  end
end
