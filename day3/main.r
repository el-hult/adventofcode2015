getwd() # day3 folder

fileName <- 'day3\\input.txt'
fileCon <- file(fileName,'rb')
input <- readChar(fileCon, file.info(fileName)$size)
close(fileCon)
# print(input)

nVisited <- function(input){
    xyMin = 100 # increased until the code dont give errors anymore
    map <- matrix(0, nrow = 2*xyMin, ncol = 2*xyMin)
    currX = 0
    currY = 0
    nInstructions = nchar(input)
    for (i in 1:nInstructions){
        instr = substr(input,i,i)
        if (instr == "<"){
            currX <- currX -1
        } else if (instr=="^"){
            currY <- currY+1
        }else if (instr=="v"){
            currY <- currY-1
        }else if (instr==">"){
            currX <- currX+1
        }
        map[currX+xyMin,currY+xyMin] <- map[currX+xyMin,currY+xyMin] + 1
    }
    return(sum(map>0))
}

stopifnot(nVisited(input)==2572) # solution A


solve.B <- function(input){
    stopifnot(nchar(input)%%2==0) # make sure sanda and RoboSanta get the same amount of presents
    

    xyMin = 100 # increased until the code dont give errors anymore
    map <- matrix(0, nrow = 2*xyMin, ncol = 2*xyMin)
    currX = 0
    currY = 0
    roboX = 0
    roboY = 0
    map[currX+xyMin,currY+xyMin] <- map[currX+xyMin,currY+xyMin] + 1
    
    nInstructions = nchar(input)
    for (i in 1:(nInstructions/2)){
        zerosIdxI = i-1
        instrIdx = 2*zerosIdxI +1 
        roboInstrIdx = instrIdx +1 
        # print(c(i,zerosIdxI,instrIdx,roboInstrIdx))
        instr = substr(input,instrIdx,instrIdx)
        roboInstr = substr(input,roboInstrIdx,roboInstrIdx)
        # print(c(instr,roboInstr))
        if (instr == "<"){
            currX <- currX -1
        } else if (instr=="^"){
            currY <- currY+1
        }else if (instr=="v"){
            currY <- currY-1
        }else if (instr==">"){
            currX <- currX+1
        }
        if (roboInstr == "<"){
            roboX <- roboX -1
        } else if (roboInstr=="^"){
            roboY <- roboY+1
        }else if (roboInstr=="v"){
            roboY <- roboY-1
        }else if (roboInstr==">"){
            roboX <- roboX+1
        }
        map[currX+xyMin,currY+xyMin] <- map[currX+xyMin,currY+xyMin] + 1
        map[roboX+xyMin,roboY+xyMin] <- map[roboX+xyMin,roboY+xyMin] + 1
    }
    ans <- sum(map>0)
    # print(c(currX,currY,roboX,roboY,ans))
    return(ans)
}

stopifnot(solve.B("^v")==3,solve.B("^>v<")==3,solve.B("^v^v^v^v^v")==11,
solve.B(input)==2631 # answer B
)