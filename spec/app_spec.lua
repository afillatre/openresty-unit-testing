local app = require("app/app")
local mock_ngx = require("spec/mock_ngx")

describe("Get the user's name", function()
  it("should return nil if name is not provided", function()
    local ngx = mock_ngx.mock_ngx("GET", "/", {}, {})
    app.set_ngx(ngx)
    assert.are.equal(nil, app.getName())
  end)
  
  it("should return the provided name", function()
    local ngx = mock_ngx.mock_ngx("GET", "/", {}, {name = "alex"})
    app.set_ngx(ngx)
    assert.are.equal("alex", app.getName())
  end)
end)