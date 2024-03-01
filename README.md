# Complete Binary Tree Construction Using Post-Order Traversal in Haskell

As defined on [Wikipedia](https://en.wikipedia.org/wiki/Binary_tree#complete), "a complete binary tree is a binary tree in which every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes at the last level h."

This file contains code in Haskell that constructs the tree, given a list of elements of a complete binary tree in post-order traversal. The definition of the tree data structure is in the code snippet is below.

```hs
data Tree a = Nil | TreeNode (Tree a) a (Tree a) deriving (Show)
```
