open Ctypes
open PosixTypes
open Foreign

let zmq_version_stub = foreign "zmq_version" (ptr int @-> ptr int @-> ptr int @-> returning void)

let version () = 
  let major = allocate int 0 in
  let minor = allocate int 0 in
  let patch = allocate int 0 in
  zmq_version_stub major minor patch;
  (!@major,!@minor,!@patch)
   

module Socket = struct
(*
  type 'kind t = unit ptr
 
  type kind = Req | Rep | Dealer | Router | Pub | Sub | XPub | XSub |
              Push | Pull | Pair 
*)
  module Context = struct

    type t = unit ptr
 
    let create = foreign "zmq_ctx_new" (void @-> returning (ptr void))

  end

end

