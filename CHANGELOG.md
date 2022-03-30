## 1.0.0

#### 1. Introduction

Flutter project resource management command tool.

#### 2. Instructions contained in this command line

- `idkit_assets run` or `idkit_assets -r`
  Resource management instructions for quick initialization projects, the default reference class for resources is IDKitAssets.

- `idkit_assets rename xx` or `idkit_assets -rn xx`
  Quickly initialize the resource management of the project and specify the name of the resource reference class; and instructions to change the name of the resource reference class later.

- `idkit_assets unused check` or `idkit_assets -uc`
  Check unused resource files in the project and resource files that are not commented out.

- `idkit_assets unused remove` or `idkit_assets -ur`
  Remove unused resource files and resource files that are not used in comments in the project.

- `idkit_assets filter xx` or `idkit_assets -f xx`
  Filter the resources of the specified size in the project resource file, the default value is 200KB.

- `idkit_assets delete xx` or `idkit_assets -d xx`
  Delete the resource file specified in the project.

- `idkit_assets help` or `idkit_assets -h`
  Get the manual for the resource management command tool.

#### 3. Guide

If you have any questions or difficulties in using the project resource management command tool, please read the [README](https://github.com/zhoushuangjian001/idkit_assets/blob/master/README.md) file carefully. You can also leave me a message and I will reply to you as soon as possible.

## 1.0.1

Fix the problem of temporary use of the process when the Windows system is processing the pubspec.yaml file

## 1.0.2

Optimize initializing empty files

## 1.0.3

1. Handling window platform path backslash handling

2. Adjust the help group command globalization of the command package tool

## 1.1.0

Access project resource path optimization, better access to resources

## 1.1.1

Code optimization for version **1.1.0**, no other updates

## 1.1.2

1. Optimized resource command internal package references
2. Remove invalid and unused package references
3. Supports the deletion of files in the specified path of Windows
