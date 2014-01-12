local site = {}

local mail = require "src.mail"

function site.index(page)
    local stringVariable = 'this variable is being passed from a "controller" to a "view"!'
    local anotherVar = 2342

    --Testing models
    --[[
    local User = sailor.model("user")
    local u = User:new()

    u.name = "etiene"
    u.password = "1234"

    if u:save() then
        page:write("saved! "..u.id.."<br/>")
    end

    -- NOT ESCAPED, DONT USE IT UNLESS YOU WROTE THE WHERE STRING YOURSELF
    local u2 = User:find("name ='francisco'")

    if u2 then
        page:write(u2.id.." - "..u2.name.."<br/>")
    end

    local users = User:find_all()
    for _, user in pairs(users) do 
        page:write(user.id.." - "..user.name.."<br/>")
    end
   

   
    u.name = "catarina"
    if u:save() then
        page:write("saved! "..u.id.."<br/>")
    end
     
    local users = User:find_all()
    for _, user in pairs(users) do 
        page:write(user.id.." - "..user.name.."<br/>")
    end

    page:write("Finding user with id 1:<br/>")
    local some_user = User:find_by_id(1)
    if some_user then
        page:write(some_user.id.." - "..some_user.name.."<br/>")
    end

    page:write("Finding user with id 47:<br/>")
    local some_user = User:find_by_id(47)
    if some_user then
        page:write(some_user.id.." - "..some_user.name.."<br/>")
    else
        page:write("User not found!")
    end]]

    if page.POST['email'] ~= nil then
        mail.send_message("<test@example.com>","Yay! Somebody sent an email using your form!","This is the email: "..page.POST['email'])
    end 

    page:render('index',{stringVariable = stringVariable,anotherVar = anotherVar})
end

function site.people(page)
    page:write("hahaha")
end

function site.notindex(page)
    page:render('test/test')
end

return site
