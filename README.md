# adventofcode2015

A repo and diary for solving advent of code in R. https://adventofcode.com/2015

Since I am not an expert in R, I don't really know what versions this will go with. but anyways... I used 3.6.1 as installed with `conda install rbase`

When solcing problems in Python, I think the standard library is fine to use, but I avoid installing custom libraries. In R, there is no proper official Standard lib, so I use this list: https://stackoverflow.com/questions/50725261/is-there-such-a-thing-as-a-standard-library-in-r
```r
> i <- installed.packages() 
> i[ i[,"Priority"] %in% c("base","recommended"), c("Package", "Priority")] 
          Package     Priority
base      "base"      "base"
compiler  "compiler"  "base"
datasets  "datasets"  "base"
graphics  "graphics"  "base"
grDevices "grDevices" "base"  
grid      "grid"      "base"
methods   "methods"   "base"
parallel  "parallel"  "base"
splines   "splines"   "base"  
stats     "stats"     "base"
stats4    "stats4"    "base"
tcltk     "tcltk"     "base"  
tools     "tools"     "base"
utils     "utils"     "base"
```
Unfortunately, whis is quite meager, and in my environment no `Recommennded` packages were installed. Tough luck!


## Day 1
https://adventofcode.com/2015/day/1

Charater counting. I learned how to get the length of a `character` value, and how to extract a character from a string using `substr`. There was plenty of confusion at the start, though.

```r
a<-"hej"
```

in this snippet, `a` is an array of length 1 and type `character`. The single entry in this array is has the value `hej`. Thus, a charactter-array hols strings! Big confusion for the person more familiar with Haskell, where strings are by definition character arrays.

In part Two, we are supposed to do an early stopping, so the very procedural style I went for in part One was very suitable.

# Day 2
https://adventofcode.com/2015/day/2

This was boring. Once again, I realized how strange the string manipulation in R is. Also, the distinction between array and list came to bite me a few times. That `strsplit` returns lists, and that `myList[1]` does not return the first element in a list, or that `for(a in strsplit(myStr,delim)){...}` iterates **once**is also *very strange*. And `a` is the whole list. :/

Anyways. After figuring that out, all went smoothly. No complexity to bother about.

# Day 3
The first part is traversing a grid world with unspecified max size, and keeping track of where you have been. A classic AoC challenge.  In Python, my favorite implementation is using a default-dict indexed by int-tuples. This is fast for lookups and can deal with arbitraily lare maps. But R dont have support for dicts/hashmaps. They have environments.

One good thing I learned by this was `Extract` and `objects`
```r
?"$"
?"ls"
```

For part B, I could copy-paste a lot, since the solution is so similar. But it changed in ways that I could not reuse the old code so easily. Too bad.
I spent quite a lot of time on a bug. I did not provide parenthesis for a ange definition, so suddenly I had a range of floats instead of a shorter range.
But then, that error was silent, since I passed these floats to `substr`, and `substr` happily casted the floats to ints by flooring.
Some type safety with informative error messages would have been golden here!

```r
print(1: 10/2 ) # [1] 0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0
print(1:(10/2)) # [1] 1 2 3 4 5
```
and 
```r
a<- "abcdefghijklmnop";
substr(a,1.5,1.5) # [1] "a"
```

