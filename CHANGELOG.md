hinotify
======

## 0.4.1

* TODO: fill in

## 0.4

* TODO: fill in

## 0.3.10

- Allow async-2.2.
- Use `RawFilePath` (`ByteString`) for filenames, from `unix` package.

  Changes the `Event` type and `addWatch` function.


## 0.3.9

Patches contributed by Simon Marlow marlowsd@gmail.com

- Don't run callbacks in `mask_`.

  It prevented the callback threads from receiving StackOverflow, amongst other things.

- Synchronous `killThread`.

  `killThread` will now wait for the callback dispatcher threads to finish.

- Bug fixes

  https://github.com/kolmodin/hinotify/pull/23

## 0.3.8

- Use file system encoding for file names.

  When run in a locale like LANG=C, this ensures that the filename is encoded
  as a filename, so that arbitrary bytes in it will round-trip correctly,
  rather than being stripped out.

  Fixes https://github.com/kolmodin/hinotify/issues/13

  Patch contributed by Joey Hess joeyh@joeyh.name

## 0.3.7

* Bug fix: When registerering a new watch on a path which is already watched,
  don't overwrite the event listener from the previous watch.

## 0.3.2

* Make each `WatchDescriptor` contain its `INotify`. Changes to the function types:

>      -removeWatch :: INotify -> WatchDescriptor -> IO ()
>      +removeWatch :: WatchDescriptor -> IO ()

* Fix typo in declaration of `Deleted` in `data Event`;

>      - { isDirecotry :: Bool
>      + { isDirectory :: Bool

## 0.3.1

* Use `inotify.h` from `glibc` rather than from the linux headers, as
      recommended upstream.

## 0.3

* Compiles with GHC 6.12, GHC 6.10.4, GHC 6.8.2 and GHC 6.6.1

## 0.2

* Updates to the API
    - Function names is now in semiCamelCase
    - Restructure event parameters to make it more consistent
* Small test suit in `tests/`
* Compiles with GHC 6.8.2 and GHC 6.6.1
* Requires Cabal 1.2

## 0.1
* Initial release
