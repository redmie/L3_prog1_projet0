open Printf

let movement origin destination = print_string ("I move a disc from rod "^origin^" to rod "^destination^"\n");;

let hanoi3_rec start inter goal n =
  let count = ref 0 in
  let rec aux start inter goal n =
    match n with
    | 0 ->  print_string "No discs... no move required\n"
    | 1 ->  movement start goal;
            incr count;
    | _ ->  aux start goal inter (n-1);
            aux start inter goal 1;
            aux inter start goal (n-1);
  in aux start inter goal n;
  !count;;

let add_result file n t = fprintf file "%d,%d\n" n t;;

let store_hanoi3_results f k =
  let file = open_out "times.data" in
  for n = 1 to k do
    add_result file n (f "A" "B" "C" n);
  done;
  close_out file;;

store_hanoi3_results hanoi3_rec (int_of_string Sys.argv.(1));;
