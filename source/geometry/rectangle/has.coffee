module.exports = (rectangle, point) ->
  if (rectangle?.length is 4) and (point?.length is 2)
    [rx,ry,rw,rh] = rectangle; [px, py] = point
    if (px >= rx) and (px <= rx + rw) and (py >= ry) and (py <= ry + rh)
      return true
  return false
