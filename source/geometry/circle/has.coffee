module.exports = (circle, point) ->
  if (circle?.length is 3) and (point?.length is 2)
    [cx, cy, cr] = circle; [px, py] = point
    px -= cx; py -= cy
    if (Math.sqrt px*px + py*py) <= cr then return true
  return false
