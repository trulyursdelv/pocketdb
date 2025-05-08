require "pocketdb"
require "navykit"
require "json"

app = NavyKit.new
Handler = Proc.new do |request, response|
  app.use(request, response)
end

def send(response, status, payload)
  result = { success: status }
  if success
    result["result"] = payload
  else
    result["error"] = payload
  end
  response.send(200, result.to_json)
end

app.post("/api/v1/write") do |request, response|
  begin
    token = request.query["token"]
    record = request.query["record"]
    if record.nil?
      next send(response, false, "INCOMPLETE_PARAMETERS")
    end
    pdb = PocketDatabase.new(token: token)
    pdb.write(record, request.json)
    next send(response, true, {
      token: pdb.token,
      list: pdb.records
    })
  rescue Exception => e
    next send(response, false, e.backtrace)
  end
end

app.get("/api/v1/read") do |request, response|
  begin
    token = request.query["token"]
    record = request.query["record"]
    if record.nil?
      next send(response, false, "INCOMPLETE_PARAMETERS")
    end
    pdb = PocketDatabase.new(token: token)
    result = pdb.read(record)
    next send(response, true, {
      token: pdb.token,
      list: pdb.records,
      data: result
    })
  rescue Exception => e
    next send(response, false, e.backtrace)
  end
end

app.get("/api/v1/has") do |request, response|
  begin
    token = request.query["token"]
    record = request.query["record"]
    if record.nil?
      next send(response, false, "INCOMPLETE_PARAMETERS")
    end
    pdb = PocketDatabase.new(token: token)
    result = pdb.has(record)
    next send(response, true, {
      token: pdb.token,
      list: pdb.records,
      exists: result
    })
  rescue Exception => e
    next send(response, false, e.backtrace)
  end
end

app.get("/api/v1/delete") do |request, response|
  begin
    token = request.query["token"]
    record = request.query["record"]
    if record.nil?
      next send(response, false, "INCOMPLETE_PARAMETERS")
    end
    pdb = PocketDatabase.new(token: token)
    pdb.delete(record)
    next send(response, true, {
      token: pdb.token,
      list: pdb.records
    })
  rescue Exception => e
    next send(response, false, e.backtrace)
  end
end