python plotLimitsHutST.py ; mv clslimitSplitQMVA.png clslimitHutST.png;
python plotLimitsHutTT.py ; mv clslimitSplitQMVA.png clslimitHutTT.png;
python plotLimitsHctST.py ; mv clslimitSplitQMVA.png clslimitHctST.png;
python plotLimitsHctTT.py ; mv clslimitSplitQMVA.png clslimitHctTT.png;

display clslimitHutST.png &
display clslimitHutTT.png &
display clslimitHctST.png &
display clslimitHctTT.png &
