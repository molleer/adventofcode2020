input <- read.csv("./day1/input.txt")
size <- length(input[,1]) - 1

for(i in 1:size) {
    for(j in i:size) {
        for(k in j:size) {
            if(input[i,1] + input[j,1] + input[k,1] == 2020) {
                print(input[i,1] * input[j,1] * input[k,1])
                return()
            }
        }
    }
}
