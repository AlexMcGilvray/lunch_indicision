local widget = require( "widget" )

-- The "onRowRender" function may go here (see example under "Inserting Rows", above)

-- Create the widget
local tableView = widget.newTableView
{
    left = 200,
    top = 200,
    height = 330,
    width = 300,
    onRowRender = onRowRender,
    onRowTouch = onRowTouch,
    listener = scrollListener
}

-- Insert 40 rows
for i = 1, 40 do

    local isCategory = false
    local rowHeight = 36
    local rowColor = { default={ 1, 1, 1 }, over={ 1, 0.5, 0, 0.2 } }
    local lineColor = { 0.5, 0.5, 0.5 }

    -- Make some rows categories
    if ( i == 1 or i == 21 ) then
        isCategory = true
        rowHeight = 40
        rowColor = { default={ 0.8, 0.8, 0.8, 0.8 } }
        lineColor = { 1, 0, 0 }
    end

    -- Insert a row into the tableView
    tableView:insertRow(
        {
            isCategory = isCategory,
            rowHeight = rowHeight,
            rowColor = rowColor,
            lineColor = lineColor
        }
    )
end