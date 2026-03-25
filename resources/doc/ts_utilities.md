# Tree Sitter utilities

## Debug 

You might want to debug a tree sitter parser from Pharo.
Whereas we did not find _yet_ a way to use the pharo debugger.
You can create a logger attached to the parser.

```st
callback := (TSLogCallback on: [ :payload :log_type :buffer | Transcript crShow: buffer ]).
logger := TSLogger new log: callback .
parser logger: logger.
```

TODO

- TS Symbol visitor
- TS Node finder
- Finding all symbols