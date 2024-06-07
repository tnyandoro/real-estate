# lib/utf8_sanitizer.rb
class Utf8Sanitizer
    def initialize(app)
        @app = app
    end

    def call(env)
        status, headers, response = @app.call(env)
        response_body = response.body.map { |part| part.force_encoding("UTF-8").encode("UTF-8", invalid: :replace, undef: :replace, replace: "?") }
        [status, headers, response_body]
    end
end