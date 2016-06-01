To open a file -
```File.open("/usr/local/widgets/data").each { |line|
    puts line if line =~ /blue/
}```
Looks like this code will read it line by line too!
Could be good for one of the tasks later....

To convert a hash to an array you could use one of the methods on a hash, such as `each_pair`.
This would then iterate through the hash and copy each property into it's own array.
Converting an array to a hash should be even easier, iterate through the array and add a new property to the hash with the name of each array index?

Ah, answer to question 3 is in question 2: `each_pair`

Ruby arrays also support queues, lists, linked lists, I don't know if you could do trees. Actually, you possibly could by pushing the children into sub arrays, but I don't think it would be the best way.
