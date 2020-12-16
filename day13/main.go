package main

import "fmt"

func soonestDeparture(time int, id int) int {
	if mod := time % id; mod != 0 {
		return id - mod
	} else {
		return mod
	}
}

func departInLine(time int, ids []int) bool {
	for k, v := range ids {
		if v == -1 {
			continue
		}
		if soonestDeparture(time, v) != k {
			return false
		}
	}
	return true
}

func main() {
	time := 100000000000000
	input := []int{23, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 37, -1, -1, -1, -1, -1, 863, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 19, 13, -1, -1, -1, 17, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 29, -1, 571, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 41}
	time = soonestDeparture(time, input[0])
	
}
