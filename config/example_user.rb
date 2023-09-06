class User
    #creates attribute accessors => get info 
    #and assign it further
    attr_accessor :name, :first_name, :last_name, :email

    #1st method
    #to initialize the variables with given info
    #it is called when User.new is executed
    #'attributes' is initialized as an empty hash
    def initialize(attributes = {})
        #instance variables (always begin with '@')
        @name = attributes[:name]
        @email = attributes[:email]
        @first_name = attributes[:first_name]
        @last_name = attributes[:last_name]
    end

    #2nd method
    #to format the info
    def formatted_email
        "#{@name} <#{@email}>"
    end

    def full_name
        "#{@first_name} #{@last_name}"
    end

end