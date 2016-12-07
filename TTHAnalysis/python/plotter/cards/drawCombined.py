from ROOT import *
import numpy as np
from array import array

outdir = '~/www/19-11-2016/2/'
gROOT.SetBatch(True)

'''
X = []
Y = []

for x in np.arange(0, 1, 0.01):
    X.append(x)
    Y.append(x*x)

x = array('d', X)
y = array('d', Y)

gr = TGraph(x, y)
'''

for cup in ["Hut", "Hct"]:
    c1 = TCanvas()

    vals = None
    if cup == "Hut":
        vals = {
            "comb": [ 0.12705 ,  0.15246 ,  0.223608 ,  0.325248 ,  0.43197 ],
        }
    elif cup == "Hct":
        vals = {
            "comb": [ 0.11664 ,  0.151632 ,  0.209952 ,  0.303264 ,  0.416016 ],
        }

    Exl2 = []
    Exh2 = []
    X2   = []
    Y2   = []
    Eyl2 = []
    Eyh2 = []
    for ci, c in enumerate(["comb"]):
        Exl2.append(0.5)
        Exh2.append(0.5)
        X2.append(ci+0.5)
        Y2.append(vals[c][2])
        Eyl2.append(vals[c][2]-vals[c][0])
        Eyh2.append(vals[c][4]-vals[c][2])

    exl2 = array('d', Exl2)
    exh2 = array('d', Exh2)
    x2   = array('d', X2)
    y2   = array('d', Y2)
    eyl2 = array('d', Eyl2)
    eyh2 = array('d', Eyh2)

    gr2 = TGraphAsymmErrors(len(vals), x2, y2, exl2, exh2, eyl2, eyh2)
    #gr2.SetTitle("2 sigma bars")
    gr2.SetMarkerColor(kBlue)
    gr2.SetFillColor(kYellow)
    gr2.Draw("a2")
    #gr2.Draw("p")
    gr2.GetXaxis().SetRangeUser(0.0,1.0)
    gr2.SetMinimum(5e-2)
    gr2.SetMaximum(1e2)


    Exl1 = []
    Exh1 = []
    X1   = []
    Y1   = []
    Eyl1 = []
    Eyh1 = []
    for ci, c in enumerate(["comb"]):
        Exl1.append(0.5)
        Exh1.append(0.5)
        X1.append(ci+0.5)
        Y1.append(vals[c][2])
        Eyl1.append(vals[c][2]-vals[c][1])
        Eyh1.append(vals[c][3]-vals[c][2])

    exl1 = array('d', Exl1)
    exh1 = array('d', Exh1)
    x1   = array('d', X1)
    y1   = array('d', Y1)
    eyl1 = array('d', Eyl1)
    eyh1 = array('d', Eyh1)

    gr1 = TGraphAsymmErrors(len(vals), x1, y1, exl1, exh1, eyl1, eyh1)
    #gr1.SetTitle("1 sigma bars")
    gr1.SetMarkerColor(kBlue)
    gr1.SetFillColor(kGreen)
    gr1.Draw("2")
    #gr1.Draw("p")
    gr1.GetXaxis().SetRangeUser(0.0,1.0)
    gr1.SetMinimum(5e-2)
    gr1.SetMaximum(1e2)

    Exl0 = []
    Exh0 = []
    X0   = []
    Y0   = []
    Eyl0 = []
    Eyh0 = []
    for ci, c in enumerate(["comb"]):
        Exl0.append(0.5)
        Exh0.append(0.5)
        X0.append(ci+0.5)
        Y0.append(vals[c][2])
        Eyl0.append(0)
        Eyh0.append(0)

    exl0 = array('d', Exl0)
    exh0 = array('d', Exh0)
    x0   = array('d', X0)
    y0   = array('d', Y0)
    eyl0 = array('d', Eyl0)
    eyh0 = array('d', Eyh0)

    gr0 = TGraphAsymmErrors(len(vals), x0, y0, exl0, exh0, eyl0, eyh0)
    #gr0.SetTitle("0 sigma bars")
    #gr0.SetLineColor(kBlack)
    gr0.SetFillColor(kBlack)
    #gr0.SetLineWidth(gr0.GetLineWidth()*3)
    #gr0.Draw("p")
    gr0.Draw("2")
    gr0.GetXaxis().SetRangeUser(0.0, 1.0)
    gr0.SetMinimum(5e-2)
    gr0.SetMaximum(1e2)

    f1 = TF1("f1", "[0]*x*x", 0, 1)
    if cup == "Hut":
        f1.SetParameter(0, 50.82)
    elif cup == "Hct":
        f1.SetParameter(0, 38.88)
    f1.Draw("same")
    c1.SetLogy()
    c1.Print(outdir+'combLimit'+cup+'.png')

    print "cuppling:", f1.GetX(y0[0])
    print "BRlimit:", round(0.1836*(f1.GetX(y0[0])**2)/1.4*100, 3), "%"

#raw_input("Press enter...")

