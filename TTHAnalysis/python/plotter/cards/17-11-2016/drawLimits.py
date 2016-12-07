from ROOT import *
from ROOT import TGraphAsymmErrors

arr = {
    "med_m2s": [0.447216, 0.40656, 0.223608, 0.182952],
    "med_m1s": [0.60984, 0.564102, 0.299838, 0.233772],
    "med":     [0.818202, 0.767382, 0.421806, 0.320166],
    "med_p1s": [1.199352, 1.138368, 0.625086, 0.5082],
    "med_p2s": [1.661814, 1.570338, 0.848694, 0.701316],
}

arr = {
    "med_m2s": [0.400464, 0.489888, 0.171072, 0.209952],
    "med_m1s": [0.555984, 0.653184, 0.229392, 0.268272],
    "med":     [0.7776, 0.890352, 0.322704, 0.400464],
    "med_p1s": [1.139184, 1.306368, 0.497664, 0.56376],
    "med_p2s": [1.578528, 1.800144, 0.695952, 0.79704],
}

#gr = new TGraphAsymmErrors(n,x,y,exl,exh,eyl,eyh);
gr = TGraphAsymmErrors(4,[1,2,3,4],arr["med"],[0,0,0,0],[0,0,0,0],arr["med_m1s"],arr["med_p1s"])
gr = new TGraphAsymmErrors(4,[1,2,3,4],arr["med"],y,exl,exh,eyl,eyh);

c1 = TCanvas()
gr.Draw()

raw_input("Press enter...")

