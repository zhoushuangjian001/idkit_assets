# idkit_assets

### 1. Briefly

This command line tool is for the convenient use and management of the resource management files of the Flutter project.

### 2. Instructions for use

#### 1. Install the resource management command tool

The instructions are as follows:

```shell
$ dart pub global activate idkit_assets
```

or

```shell
$ flutter pub global activate idkit_assets
```

##### Note: If the prompt [No active package idkit_assets] appears,

use `$ dart pub global activate idkit_assets` to install it once.

#### 2. Create a flutter project or a flutter package project

The instructions are as follows:

```shell
$ flutter create xx
```

#### 3. Initialize project resource management

The instructions are as follows:

```shell
$ idkit_assets run
```

or

```shell
idkit_assets -r
```

#### 4. Update the name of the referenced class in the project resource file

The instructions are as follows:

```shell
$ idkit_assets rename AssetsMap
```

or

```shell
$ idkit_assets -rn AssetsMap
```

#### 5. Check for unused resources in the project

The instructions are as follows:

```shell
$ idkit_assets unused check
```

or

```shell
$ idkit_assets -uc
```

#### 6. Remove unused resource files from project resources

The instructions are as follows:

```shell
$ idkit_assets unused remove
```

or

```shell
$ idkit_assets -ur
```

#### 7. Filter resource files greater than or equal to the specified project

The instructions are as follows:

```shell
# default: 200KB
$ idkit_assets unused filter
$ idkit_assets unused filter 300

```

or

```shell
# default: 200KB
$ idkit_assets -f 200
$ idkit_assets -f 300
```

#### 8. Delete the resource file of the specified path in the project

The instructions are as follows:

```shell
$ idkit_assets delete xx
```

or

```shell
$ idkit_assets -d xx
```

#### 9. Get instructions for using the resource management project command tool

The instructions are as follows:

```shell
$ idkit_assets help
```

or

```shell
$ idkit_assets -h
```
