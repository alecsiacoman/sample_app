class ApplicationController < ActionController::Base
    def hello
        render html: "hello, Ale!"
    end
end
