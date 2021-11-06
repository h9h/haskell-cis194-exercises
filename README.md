# haskell-cis194-exercises

Project containing answers to the homework exercises of [Lecture CIS 194](https://www.seas.upenn.edu/~cis194/spring13/lectures.html)

## Setup Homeworks

Start each homework in a fresh project by running

```
stack new homeworkxx
```

in the root directory of this repository.

## Workflow (section copied from https://docs.haskellstack.org/en/stable/README/)

The stack new command should have created the following files:

```
.
├── app
│   └── Main.hs
├── ChangeLog.md
├── LICENSE
├── my-project.cabal
├── package.yaml
├── README.md
├── Setup.hs
├── src
│   └── Lib.hs
├── stack.yaml
└── test
    └── Spec.hs

    3 directories, 10 files
```

So to manage your library:

- Edit files in the src/ directory.

The app directory should preferably contain only files related to executables.

- If you need to include another library (for example the package `text`):
  Add the package text to the file package.yaml in the section `dependencies: ....`
- Run `stack build` another time.
- `stack build` will update my-project.cabal for you. If desired you can update the .cabal file manually and stack will use .cabal instead of package.yaml.
- If you get an error that tells you your package isn't in the LTS. Just try to add a new version in the stack.yaml file in the extra-deps section.

That was a really fast introduction on how to start to code in Haskell using `stack`. If you want to go further, we highly recommend you to read the stack guide.

## Running and testing

To run the project

```
stack build
stack exec homeworkxx-exe
```

where `xx` is to be replaced by the homework number. Note the `-exe` appendix.
 