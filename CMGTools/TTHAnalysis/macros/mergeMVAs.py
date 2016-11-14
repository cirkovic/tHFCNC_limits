from ROOT import *
import ROOT

Nbins = 20
xl = -0.8
xh = +0.4

fs = []
ts = []
cs = []
hs = {}

sigs = [ ("ST_TH_1L3B", "HutST"), ("ST_TH_1L3B_Hct", "HctST"), ("TT_TopLeptonicDecay_TH_1L3B_Eta_Hut", "HutTT"), ("TT_TopLeptonicDecay_TH_1L3B_Eta_Hct", "HctTT"), ("TT_AntitopLeptonicDecay_TH_1L3B_Eta_Hut", "HutTT"), ("TT_AntitopLeptonicDecay_TH_1L3B_Eta_Hct", "HctTT") ]
bkgs = [ ("TT_TuneCUETP8M1_13TeV-powheg-pythia8", "HutST"), ("TT_TuneCUETP8M1_13TeV-powheg-pythia8", "HctST"), ("TT_TuneCUETP8M1_13TeV-powheg-pythia8", "HutTT"), ("TT_TuneCUETP8M1_13TeV-powheg-pythia8", "HctTT") ]

categories = [ "b2j4", "b3j3", "b3j4" ]

hs["sig"] = TH1F("sig", "sig", Nbins, xl, xh)
hs["bkg"] = TH1F("bkg", "bkg", Nbins, xl, xh)

for s,st in sigs:
    for c in categories:
        print "::", s, st, c, "::"
        fs.append(TFile.Open("FTREES/MVAVars/"+c+"/evVarFriend_"+s+".root"))
        ts.append(fs[-1].Get("sf/t"))
        for e in ts[-1]:
            print e.__getattr__("MVA_"+st+"_"+c+"_default")
        print
        cs.append(TCanvas())
        ts[-1].Draw("MVA_"+st+"_"+c+"_default>>hMVA_"+st+"_"+c+"_default_"+s+"("+str(Nbins)+","+str(xl)+","+str(xh)+")")
        hs["hMVA_"+st+"_"+c+"_default_"+s] = globals()["hMVA_"+st+"_"+c+"_default_"+s]
        hs["sig"].Add(hs["hMVA_"+st+"_"+c+"_default_"+s])

for s,st in bkgs:
    for c in categories:
        fs.append(TFile.Open("FTREES/MVAVars/"+c+"/evVarFriend_"+s+".root"))
        ts.append(fs[-1].Get("sf/t"))
        cs.append(TCanvas())
        ts[-1].Draw("MVA_"+st+"_"+c+"_default>>hMVA_"+st+"_"+c+"_default_"+s+"("+str(Nbins)+","+str(xl)+","+str(xh)+")")
        hs["hMVA_"+st+"_"+c+"_default_"+s] = globals()["hMVA_"+st+"_"+c+"_default_"+s]
        hs["bkg"].Add(hs["hMVA_"+st+"_"+c+"_default_"+s])

hs["sig"].Scale(1./hs["sig"].Integral())
hs["bkg"].Scale(1./hs["bkg"].Integral())

cs.append(TCanvas())
hs["sig"].Draw()
hs["sig"].SetLineColor(ROOT.kBlue)
hs["bkg"].Draw("SAME")
hs["bkg"].SetLineColor(ROOT.kRed)

raw_input("Press enter to finish...")

