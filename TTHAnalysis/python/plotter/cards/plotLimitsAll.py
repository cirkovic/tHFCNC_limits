#!/usr/bin/env python
#import ROOT 
from ROOT import *
#from math import *
#import os, os.path
from array import array
import sys

#outdir = '~/www/19-11-2016/1/'
outdir = '~/www/24-11-2016/1/'
gROOT.SetBatch(True)

VALS = {
    "HutST": {
        "b2j3": [ 0.472626 ,  0.655578 ,  0.919842 ,  1.37214 ,  1.971816 ],
        "b2j4": [ 0.523446 ,  0.696234 ,  1.0164 ,  1.453452 ,  2.10903 ],
        "b3j3": [ 0.274428 ,  0.350658 ,  0.523446 ,  0.772464 ,  1.087548 ],
        "b3j4": [ 0.223608 ,  0.299838 ,  0.421806 ,  0.650496 ,  0.945252 ],
        "comb": [ 0.15246 ,  0.198198 ,  0.274428 ,  0.396396 ,  0.599676 ],
    },

    "HutTT": {
        "b2j3": [ 1.148532 ,  1.580502 ,  2.256408 ,  3.282972 ,  4.670358 ],
        "b2j4": [ 0.792792 ,  1.097712 ,  1.539846 ,  2.251326 ,  3.216906 ],
        "b3j3": [ 0.447216 ,  0.594594 ,  0.869022 ,  1.2705 ,  1.80411 ],
        "b3j4": [ 0.33033 ,  0.421806 ,  0.620004 ,  0.91476 ,  1.29591 ],
        "comb": [ 0.198198 ,  0.269346 ,  0.421806 ,  0.594594 ,  0.833448 ],
    },

    "HctST": {
        "b2j3": [ 0.439344 ,  0.610416 ,  0.85536 ,  1.275264 ,  1.823472 ],
        "b2j4": [ 0.579312 ,  0.765936 ,  1.119744 ,  1.636848 ,  2.340576 ],
        "b3j3": [ 0.186624 ,  0.279936 ,  0.400464 ,  0.56376 ,  0.81648 ],
        "b3j4": [ 0.25272 ,  0.322704 ,  0.474336 ,  0.69984 ,  1.014768 ],
        "comb": [ 0.108864 ,  0.159408 ,  0.244944 ,  0.357696 ,  0.493776 ],
    },

    "HctTT": {
        "b2j3": [ 1.104192 ,  1.465776 ,  2.107296 ,  3.063744 ,  4.385664 ],
        "b2j4": [ 0.905904 ,  1.201392 ,  1.726272 ,  2.511648 ,  3.592512 ],
        "b3j3": [ 0.458784 ,  0.633744 ,  0.890352 ,  1.318032 ,  1.897344 ],
        "b3j4": [ 0.400464 ,  0.555984 ,  0.7776 ,  1.139184 ,  1.617408 ],
        "comb": [ 0.23328 ,  0.322704 ,  0.435456 ,  0.645408 ,  0.93312 ],
    },

}

for cup in ["HutST", "HutTT", "HctST", "HctTT"]:

    c1 = TCanvas("c1",cup,200,10,700,500)
    #c1.SetFillColor(42)
    #c1.SetGrid()
    #c1.GetFrame().SetFillColor(21)
    #c1.GetFrame().SetBorderSize(12)
    c1.SetLogy()

    vals = VALS[cup]

    dummyh = TH1F(cup, cup, len(vals), 0.5, len(vals)+0.5)

    Exl2 = []
    Exh2 = []
    X2   = []
    Y2   = []
    Eyl2 = []
    Eyh2 = []
    for ci, c in enumerate(["b2j3", "b2j4", "b3j3", "b3j4", "comb"]):
        dummyh.GetXaxis().SetBinLabel(ci+1, c)
        Exl2.append(0.5)
        Exh2.append(0.5)
        X2.append(ci+1)
        Y2.append(vals[c][2])
        Eyl2.append(vals[c][2]-vals[c][0])
        Eyh2.append(vals[c][4]-vals[c][2])

    exl2 = array('d', Exl2)
    exh2 = array('d', Exh2)
    x2   = array('d', X2)
    y2   = array('d', Y2)
    eyl2 = array('d', Eyl2)
    eyh2 = array('d', Eyh2)

    #dummyh.Draw()
    #c1.Print(outdir+'limit'+cup+'.png')
    gr2 = TGraphAsymmErrors(len(vals),x2,y2,exl2,exh2,eyl2,eyh2)
    gr2.SetTitle(cup)
    gr2.SetMarkerColor(kBlue)
    gr2.SetFillColor(kYellow)
    gr2.Draw("a2")
    #gr2.Draw("p")
    gr2.GetXaxis().SetRangeUser(0.5,len(vals)+0.5)
    gr2.SetMinimum(0.1)


    Exl1 = []
    Exh1 = []
    X1   = []
    Y1   = []
    Eyl1 = []
    Eyh1 = []
    for ci, c in enumerate(["b2j3", "b2j4", "b3j3", "b3j4", "comb"]):
        Exl1.append(0.5)
        Exh1.append(0.5)
        X1.append(ci+1)
        Y1.append(vals[c][2])
        Eyl1.append(vals[c][2]-vals[c][1])
        Eyh1.append(vals[c][3]-vals[c][2])

    exl1 = array('d', Exl1)
    exh1 = array('d', Exh1)
    x1   = array('d', X1)
    y1   = array('d', Y1)
    eyl1 = array('d', Eyl1)
    eyh1 = array('d', Eyh1)

    gr1 = TGraphAsymmErrors(len(vals),x1,y1,exl1,exh1,eyl1,eyh1)
    gr1.SetTitle("1 sigma bars")
    gr1.SetMarkerColor(kBlue)
    gr1.SetFillColor(kGreen)
    gr1.Draw("2")
    #gr1.Draw("p")
    gr1.GetXaxis().SetRangeUser(0.5,len(vals)+0.5)
    gr1.SetMinimum(0.1)

    Exl0 = []
    Exh0 = []
    X0   = []
    Y0   = []
    Eyl0 = []
    Eyh0 = []
    for ci, c in enumerate(["b2j3", "b2j4", "b3j3", "b3j4", "comb"]):
        Exl0.append(0.5)
        Exh0.append(0.5)
        X0.append(ci+1)
        Y0.append(vals[c][2])
        Eyl0.append(0)
        Eyh0.append(0)

    exl0 = array('d', Exl0)
    exh0 = array('d', Exh0)
    x0   = array('d', X0)
    y0   = array('d', Y0)
    eyl0 = array('d', Eyl0)
    eyh0 = array('d', Eyh0)

    gr0 = TGraphAsymmErrors(len(vals),x0,y0,exl0,exh0,eyl0,eyh0)
    gr0.SetTitle("0 sigma bars")
    #gr0.SetLineColor(kBlack)
    gr0.SetFillColor(kBlack)
    #gr0.SetLineWidth(gr0.GetLineWidth()*3)
    #gr0.Draw("p")
    gr0.Draw("2")
    gr0.GetXaxis().SetRangeUser(0.5,len(vals)+0.5)
    gr0.SetMinimum(0.1)

    c1.Update()
    dummyh.Draw("same")
    c1.Modified()
    c1.Print(outdir+'limit'+cup+'.png')
    del c1

    #raw_input("Press enter...")
