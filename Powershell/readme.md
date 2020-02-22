# Recursion in Powershell utilizing piping and the begin block
Shows how the begin block can be accessed excessively if not careful with piping. Take note of the global counter printing in each sample output that is present at the beginning of each file.

## PSrecursionBeginLoopExample1.ps1
Utilizes a common method for parsing a collection of objects. When the for-each-object is called, it spawns a fresh child process. Each child process is independent of the pipe and will utilize the begin and process loop.

## PSrecursionBeginLoopExample2.ps1
Properly utilizes the piping ability in Powershell to leverage begin and process blocks. This method stores all of the values in an array so that we can properly pipe them recursively back into the function. You'll see that the begin function is called twice. This is to be expected as the begin loop runs once to process the .csv and then once again to initate the piping. 