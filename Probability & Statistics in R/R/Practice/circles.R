circle <- function(x, y, rad = 1.1, vertices = 500, ...) {
  rads <- seq(0, 2*pi, length.out = vertices)
  xcoords <- cos(rads) * rad + x
  ycoords <- sin(rads) * rad + y
  polygon(xcoords, ycoords, ...)
}

roots <- function(n) {
  lapply(
    seq(0, n - 1, 1),
    function(x)
      c(round(cos(2*x*pi/n), 4), round(sin(2*x*pi/n), 4))
  )
}

drawcircles <- function(n) {
  centres <- roots(n)
  plot(-2:2, type="n", xlim = c(-2,2), ylim = c(-2,2), asp = 1, xlab = "", ylab = "", axes = FALSE)
  lapply(centres, function (c) circle(c[[1]], c[[2]]))
}


drawcircles(600)
