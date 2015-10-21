type t =
  {
    x : float ;
    y : float ;
  }

let make x y : t = {x; y}
 
let center {x;y} {x=a;y=b} = make ((a+.x) /. 2.) ((b+.y) /. 2.)

let determinant a b c =
  (b.x -. a.x) *. (c.y -. a.y) -. (b.y -. a.y) *. (c.x -. a.x)
    
let iso_barycenter pts =
  let rec aux pts sumx sumy nb = 
    match pts with 
    | [] -> make (sumx /. nb) (sumy /. nb)
    | h::tl -> aux tl (sumx +. h.x) (sumy +. h.y) (nb +. 1.)
  in aux pts 0. 0. 0.

let barycenter weighted_pts =
  let rec aux pts sumx sumy sumw =
    match pts with
    | [] -> make (sumx /. sumw) (sumy /. sumw)
    | (pt,w)::tl -> aux tl ((w*.pt.x) +. sumx) ((w*.pt.y) +. sumy) (w+.sumw)
  in aux weighted_pts 0. 0. 0.
  
let sq_distance ({x=a;y=b}: t) ({x=c;y=d}: t) = 
  let diffX = a -. c and diffY = b -. d in
  (diffX *. diffX +. diffY *. diffY)

let distance ({x=a;y=b}: t) ({x=c;y=d}: t) = sq_distance {x=a;y=b} {x=c;y=d} |> sqrt

let x_coord (p:t) = p.x

let y_coord (p:t) = p.y

let translate ({x;y}: t) dx dy : t= make (x+.dx) (y+.dy)

let rotate pivot p angle =
  let px = (cos angle) *. (p.x -. pivot.x) -. (sin angle) *. (p.y -. pivot.y) +. pivot.x  
  and py = (sin angle) *. (p.x -. pivot.x) +. (cos angle) *. (p.y -. pivot.y) +. pivot.y
  in make px py
