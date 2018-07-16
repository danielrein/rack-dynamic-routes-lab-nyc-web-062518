class Application

  def call(env)

    req = Rack::Request.new(env)
    resp = Rack::Response.new

    term = req.path.split("/items/").last

    result = Item.all.find {|item| item.name == (term) }

    if !req.path.start_with?("/items/")
      resp.status = 404
      resp.write("Route not found")
    elsif !result
      resp.status = 400
      resp.write("Item not found")
    else
      resp.write(result.price)
    end

    # resp.write( result.price || "Route not found")

    resp.finish

  end

end
