class Application

    @@items = ["Apples","Carrots","Pears"]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
    
        if req.path.match(/items/)
            item = req.path.split("/items/").last
            item_find = @@items.find{|i| i.name == item}
            if item_find == nil
                resp.write "Item not found"
                resp.status = 400
            else
                resp.write item_find.price
            end
        else
            resp.write "Route not found"
            resp.status = 404
          end
    
        resp.finish
      end
end