fn main() {
    let first_aux = 'A';
    let second_aux = 'B';
    let third_aux = 'C';
    
    let n_diks = 3;
    hanoi(first_aux, third_aux, second_aux, n_diks);
}

fn hanoi(from_aux: char, to_aux: char, via_aux: char, n_diks: u32) {
    if n_diks == 1 {
        println!("Move disk 1 from {from_aux} to {to_aux}");
    }
    else {
        hanoi(from_aux, via_aux, to_aux, n_diks-1);
        println!("Move disk {n_diks} from {from_aux} to {to_aux}");
        hanoi(via_aux, to_aux, from_aux, n_diks-1);
    }
}
