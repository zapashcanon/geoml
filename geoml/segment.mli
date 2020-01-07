open Arith

(** Segment manipulation *)

type t = Point.t * Point.t
val make : Point.t -> Point.t -> t

module Tbl: Hashtbl.S with type key = t

val extr1 : t -> Point.t

val extr2 : t -> Point.t

val center : t -> Point.t

val equation : t -> num -> Point.t

(** returns the square size of a segment *)
val sq_size : t -> num

(** returns the size of a segment *)
val size : t -> num

val scale_x : t -> num -> t

val scale_y : t -> num -> t

val translate : num -> num -> t -> t

val transform : Affine.t -> t -> t

val to_line : t -> Line.t

val contains : t -> Point.t -> bool

val proj_x : t -> num * num

val proj_y : t -> num * num

val intersects : t -> t -> bool
(** intersects a b, returns true if a and b intersect. false otherwise*)

val intersection : t -> t -> Point.t option
(** returns the intersection point of two segments.
    returns None if they don't intersect*)

val intersect_line : t -> Line.t -> Point.t option
(** returns the intersection point of a segment and a line.
    returns None if they don't intersect*)