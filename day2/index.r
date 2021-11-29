library("stringr")
input <- read.csv("./day2/input.txt")[,1]

passes <- 0

for(line in input) {
    parts <- str_split(line, " ")[[1]]
    bounds <- strtoi(str_split(line, "-")[[1]])
    c <- substr(parts[2], 1, 1)
    count <- 0
    for(i in str_split(parts[3], "")[[1]]) {
      if(i == c) {
        count <- count + 1
      }
    }
    if((count >= bounds[1]) && (count <= bounds[2])) {
      passes <- passes + 1
    }
}
print(passes)
