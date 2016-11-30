local contacts = require ("plugin.contacts")
local json = require ("json")
local widget = require("widget")


local background = display.newRect(display.contentWidth * 0.5, display.contentHeight * 0.5, display.contentWidth, display.contentHeight * 1.2 )

    local background_gradient = {
        type="gradient",
        color1={ 1, 1, 1 }, color2={ 0.6, 0.6, 0.6 }, direction="down"
    }
    background:setFillColor( background_gradient )
    

    local function Button1Event( event )

        if ( "ended" == event.phase ) then
            contacts.get(function(event)
            print(json.prettify(event))
             --native.showAlert( "Status", tostring(event.status) , { "OK" })
                if event.status == "success" then
                    --native.showAlert( "Contacts", tostring(event.contacts) , { "OK" })
                end
            end)
  
        end
    end

    
    local Button1 = widget.newButton(
    {
        width = display.contentWidth * 0.8,
        height = display.contentHeight * 0.1,
        label = "Get Contracts",
        labelColor = { default={ 0,0,0 }, over={ 1,1,1, 0.5 } },
        onEvent = Button1Event
    }
)
    Button1.x = display.contentWidth * 0.5
    Button1.y = display.contentHeight * 0.1
    
    
    
    
    
     local function Button2Event( event )

        if ( "ended" == event.phase ) then
            print(contacts.canAccess())
            native.showAlert( "Can Access", contacts.canAccess(), { "OK" })
        end
    end

    
    local Button2 = widget.newButton(
    {
        width = display.contentWidth * 0.8,
        height = display.contentHeight * 0.1,
        label = "Access Contacts?",
        labelColor = { default={ 0,0,0 }, over={ 1,1,1, 0.5 } },
        onEvent = Button2Event
    }
)
    Button2.x = display.contentWidth * 0.5
    Button2.y = display.contentHeight * 0.3
    
    
    
    
     local function Button3Event( event )

        if ( "ended" == event.phase ) then
           contacts.requestAccess(function(event)
            print(json.prettify(event))
                --native.showAlert( "Request Access", tostring(event.status) , { "OK" })  
            end)
        end
    end

    
    local Button3 = widget.newButton(
    {
        width = display.contentWidth * 0.8,
        height = display.contentHeight * 0.1,
        label = "Request Access",
        labelColor = { default={ 0,0,0 }, over={ 1,1,1, 0.5 } },
        onEvent = Button3Event
    }
)
    Button3.x = display.contentWidth * 0.5
    Button3.y = display.contentHeight * 0.5