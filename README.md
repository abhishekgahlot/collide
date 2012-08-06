# Collide
## What is Collide?

**Collide is an open-source "collaborative IDE" demonstration.**

Run Collide on your local file system. Browse to (http://localhost:8080). Profit.

Requires:
* [Java 7](http://www.oracle.com/technetwork/java/javase/downloads/jdk-7u4-downloads-1591156.html)
* [Ant 1.8.4+](http://ant.apache.org/bindownload.cgi)
* All other dependencies are currently bundled in


## Build ##

    `ant dist`


## Running ##

From any folder, run:

    `[collide directory]/bin/deploy/collide`

Point a browser at (http://localhost:8080/).
By default Collide will only accept local connections. To accept remote
connection you must specify a password.


## Flags ##

-password=<string>    Specify a password to access the web UI.
-debug                Enable JVM debugging. See "Debug the server" section
                      below.


## Hints for USING COLLIDE ##

`Atl+enter` brings up the "Awesome Box" for fast file switching.

`Ctrl+space` does client side lexical completions and code snippets. 


## Eclipse setup ##

* First, run `ant build test` to make sure all generated files are created.
* Import the existing Eclipse project in the root directory.
* Java 7 must be your default JRE.

## Debug the server ##

  `[collide directory]/bin/deploy/collide -debug`
  
Remote attach to port 8001.  An Eclipse launch config is included.


## Contributing ##

* Create a personal clone of the main repository if you don't have one already
  (http://code.google.com/p/collide/source/clones)
* Push a change into your clone
* E-mail a link to your change to collide-project@googlegroups.com


## The "source of truth" repo ##
http://code.google.com/p/collide