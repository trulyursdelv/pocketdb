require 'navykit'
require 'json'
require 'pocketdb'

app = NavyKit.new
Handler = Proc.new do |request, response|
  response["Access-Control-Allow-Origin"] = "*"
  response["Access-Control-Allow-Methods"] = "*"
  response["Access-Control-Allow-Headers"] = "*"
  response["Content-Type"] = "application/json"
  response.status = 200;
  next app.use(request, response)
end

def send_response(response, status, payload)
  result = { success: status }
  if status
    result[:result] = payload
  else
    result[:error] = payload
  end
  response.send(200, result.to_json)
end

app.post("/v1/api/write") do |request, response|
  begin
    token = request.query("token")
    record = request.query("record")
    if record.nil?
      next send_response(response, false, "INCOMPLETE_PARAMETERS")
    end
    pdb = PocketDatabase.new(token: token)
    # pdb.write(record, request.json)
    next send_response(response, true, {
      token: pdb.token,
      list: pdb.records
    })
  rescue Exception => e
    next send_response(response, false, {
      message: e.to_s,
      trace: e.backtrace
    })
  end
end

app.get("/v1/api/read") do |request, response|
  begin
    token = request.query("token")
    record = request.query("record")
    if record.nil? || token.nil?
      next send_response(response, false, "INCOMPLETE_PARAMETERS")
    end
    pdb = PocketDatabase.new(token: token)
    result = pdb.read(record)
    next send_response(response, true, {
      token: pdb.token,
      list: pdb.records,
      data: result
    })
  rescue Exception => e
    next send_response(response, false, {
      message: e.to_s,
      trace: e.backtrace
    })
  end
end

app.get("/v1/api/has") do |request, response|
  begin
    token = request.query("token")
    record = request.query("record")
    if record.nil? || token.nil?
      next send_response(response, false, "INCOMPLETE_PARAMETERS")
    end
    pdb = PocketDatabase.new(token: token)
    result = pdb.has(record)
    next send_response(response, true, {
      token: pdb.token,
      list: pdb.records,
      exists: result
    })
  rescue Exception => e
    next send_response(response, false, {
      message: e.to_s,
      trace: e.backtrace
    })
  end
end

app.get("/v1/api/delete") do |request, response|
  begin
    token = request.query("token")
    record = request.query("record")
    if record.nil? || token.nil?
      next send_response(response, false, "INCOMPLETE_PARAMETERS")
    end
    pdb = PocketDatabase.new(token: token)
    pdb.delete(record)
    next send_response(response, true, {
      token: pdb.token,
      list: pdb.records
    })
  rescue Exception => e
    next send_response(response, false, {
      message: e.to_s,
      trace: e.backtrace
    })
  end
end

app.notfound do |request, response|
  next send_response(response, false, "INVALID_ENDPOINT")
end