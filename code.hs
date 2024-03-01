data Tree a = Nil | TreeNode (Tree a) a (Tree a) deriving (Show)

{-
    Construct a complete binary tree given its post-order traversal.
    Reverse the list containing the elements.
    Figure out how many nodes are at the level of the tree which is not fully filled (dangling elements).
    Figure out the capacity of the lowest level of the tree (end level capacity).
    Create a split in the list based on the minimum of the number of dangling elements and
    the difference between the number of dangling elements and end level capacity.
    The right subtree contains the elements before the split and left contains those after the split.
    Create the root of the current subtree and recursively call the construction function for the left and right subtrees.
-}

constructTree :: [Int] -> Tree Int
constructTree [] = Nil
constructTree [x] = TreeNode Nil x Nil
constructTree lst =
  let dangling_elems = length lst - (2 ^ floor (logBase 2 (fromIntegral (length lst))) - 1)
      end_level_capacity = 2 ^ (ceiling (logBase 2 (fromIntegral (length lst))) - 1)
      split = (length lst - 1 - min (end_level_capacity - dangling_elems) dangling_elems) `div` 2
      right_subtree = take split (tail lst)
      left_subtree = drop split (tail lst)
  in
    TreeNode (constructTree left_subtree) (head lst) (constructTree right_subtree)


postOrderTreeConstruction = constructTree . reverse