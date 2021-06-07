# adventofcode2015

A repo and diary for solving advent of code in R. https://adventofcode.com/2015

Since I am not an expert in R, I don't really know what versions this will go with. but anyways... I used 3.6.1


## Day 1
https://adventofcode.com/2015/day/1


Charater counting. I learned how to get the length of a `character` value, and how to extract a character from a string using `substr`. There was plenty of confusion at the start, though.

```r
a<-"hej"
```

in this snippet, `a` is an array of length 1 and type `character`. The single entry in this array is has the value `hej`. Thus, a charactter-array hols strings! Big confusion for the person more familiar with Haskell, where strings are by definition character arrays.

In part Two, we are supposed to do an early stopping, so the very procedural style I went for in part One was very suitable.