include Float

type num = float

let ( *. ) = ( *. )
let ( /. ) = ( /. )
let ( +. ) = ( +. )
let ( -. ) = ( -. )


let rec pow a = function
  | 0 -> 1.
  | 1 -> a
  | n ->
    let b = pow a (n / 2) in
    b *. b *. (if n mod 2 = 0 then 1. else a)

let ( ** ) = pow

let ( ~-. ) = (~-.)

let random = Random.float

let print = Format.pp_print_float
