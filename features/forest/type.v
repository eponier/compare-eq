Inductive forest := | empty | add : tree -> forest -> forest
with tree := | node : nat -> forest -> tree.
