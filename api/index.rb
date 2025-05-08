require 'navykit'
require 'json'
require 'pocketdb'

app = NavyKit.new
Handler = Proc.new do |request, response|
  app.use(request, response)
end

def send(response, status, payload)
  response.header("Access-Control-Allow-Origin", "*")
  response.header("Content-Type", "application/json")
  result = { success: status }
  if status
    result["result"] = payload
  else
    result["error"] = payload
  end
  response.send(200, result.to_json)
end

app.post("/v1/api/write") do |request, response|
  begin
    token = request.query.fetch("token")
    record = request.query.fetch("record")
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

app.get("/v1/api/read") do |request, response|
  begin
    token = request.query.fetch("token")
    record = request.query.fetch("record")
    if record.nil? || token.nil?
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

app.get("/v1/api/has") do |request, response|
  begin
    token = request.query.fetch("token")
    record = request.query.fetch("record")
    if record.nil? || token.nil?
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

app.get("/v1/api/delete") do |request, response|
  begin
    token = request.query.fetch("token")
    record = request.query.fetch("record")
    if record.nil? || token.nil?
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

app.notfound do |request, response|
  send(response, false, "INVALID_ENDPOINT")
end
