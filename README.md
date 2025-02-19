hinotify: inotify for Haskell
=============================

[![CI](https://github.com/haskell-fswatch/hinotify/actions/workflows/ci.yml/badge.svg)](https://github.com/haskell-fswatch/hinotify/actions/workflows/ci.yml)

About
-----

This package provides bindings to [inotify](http://www.kernel.org/pub/linux/kernel/people/rml/inotify/), which has been part of the Linux kernel since 2.6.13.

The `inotify` subsystem provides file system event notifications. Simply add a watcher to a file or directory and you get events when it is accessed, modified, etc.

News
----

See [CHANGELOG.md](./CHANGELOG.md).

API
---

The API basically consists of:

```haskell
initINotify :: IO INotify

addWatch :: INotify
         -> [EventVariety]   -- different events to listen on
         -> RawFilePath      -- file/directory to watch
         -> (Event -> IO ()) -- event handler callback
         -> IO WatchDescriptor

removeWatch :: WatchDescriptor -> IO ()
```

See this [example](./examples/simple/simple.hs) or the [docs](https://hackage.haskell.org/package/hinotify/docs/System-INotify.html).

Author
------

Lennart Kolmodin

`kolmodin at gmail.com`

Legal
-----

This software is released under a BSD-style license. See LICENSE for more details.

Copyright &copy; 2007-2012 Lennart Kolmodin
