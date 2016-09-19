from CMGTools.TTHAnalysis.treeReAnalyzer import *
from CMGTools.TTHAnalysis.tools.mvaTool import *

import xml.etree.ElementTree as ET

class FinalMVA_2LSS:
    def __init__(self):
        self._MVAs = {}
        self._Spect = [
              MVAVar("iF0 := iF_Recl[0]", func = lambda ev : ev.iF_Recl[0]),
              MVAVar("iF1 := iF_Recl[1]", func = lambda ev : ev.iF_Recl[1]),
              MVAVar("iF2 := iF_Recl[2]", func = lambda ev : ev.iF_Recl[2]),
        ]
        #self._all_vars = [
        '''
        MVAVar("abs(Alt$(LepGood_eta[0],0)):=abs(Alt$(LepGood_eta[0],0))" , func = lambda ev : abs((ev.LepGood_eta[0] if ev.nLepGood > 0 else 0))),
        MVAVar("abs(Alt$(LepGood_eta[1],0)):=abs(Alt$(LepGood_eta[1],0))" , func = lambda ev : abs((ev.LepGood_eta[1] if ev.nLepGood > 1 else 0))),
        MVAVar("avg_dr_jet:=avg_dr_jet" , func = lambda ev : ev.avg_dr_jet),
        MVAVar("B_loose_phi:=B_loose_phi" , func = lambda ev : ev.B_loose_phi),
        MVAVar("B_medium_phi:=B_medium_phi" , func = lambda ev : ev.B_medium_phi),
        MVAVar("b1_jet_pt:=Alt$(Jet_pt[0],0)" , func = lambda ev : (ev.Jet_pt[0] if ev.nJet > 0 else 0)),
        MVAVar("b2_jet_pt:=Alt$(Jet_pt[1],0)" , func = lambda ev : (ev.Jet_pt[1] if ev.nJet > 1 else 0)),
        MVAVar("bestMWjj" , func = lambda ev : ev.bestMWjj),
        MVAVar("DR_l_b_loose1:=DR_l_b_loose1" , func = lambda ev : ev.DR_l_b_loose1),
        MVAVar("DR_l_b_loose2:=DR_l_b_loose2" , func = lambda ev : ev.DR_l_b_loose2),
        MVAVar("DR_l_b_medium1:=DR_l_b_medium1" , func = lambda ev : ev.DR_l_b_medium1),
        MVAVar("DR_l_b_medium2:=DR_l_b_medium2" , func = lambda ev : ev.DR_l_b_medium2),
        MVAVar("ht3l:=min(Alt$(LepGood_pt[0],0)+Alt$(LepGood_pt[1],0)+Alt$(LepGood_pt[2],0),300)" , func = lambda ev : min((ev.LepGood_pt[0] if ev.nLepGood > 0 else 0)+(ev.LepGood_pt[1] if ev.nLepGood > 1 else 0)+(ev.LepGood_pt[2] if ev.nLepGood > 2 else 0),300)),
        MVAVar("HT6:=Alt$(Jet_pt[0],0)+Alt$(Jet_pt[1],0)+Alt$(Jet_pt[2],0)+Alt$(LepGood_pt[0],0)+Alt$(LepGood_pt[1],0)+Alt$(LepGood_pt[2],0)" , func = lambda ev : (ev.Jet_pt[0] if ev.nJet > 0 else 0)+(ev.Jet_pt[1] if ev.nJet > 1 else 0)+(ev.Jet_pt[2] if ev.nJet > 2 else 0)+(ev.LepGood_pt[0] if ev.nLepGood > 0 else 0)+(ev.LepGood_pt[1] if ev.nLepGood > 1 else 0)+(ev.LepGood_pt[2] if ev.nLepGood > 2 else 0)),
        MVAVar("htJet25:=htJet25" , func = lambda ev : ev.htJet25),
        MVAVar("Alt$(Jet_btagCSV[0],-1):=max(0,Alt$(Jet_btagCSV[0],-1))" , func = lambda ev : max(0,(ev.Jet_btagCSV[0] if ev.nJet > 0 else -1))),
        MVAVar("Alt$(Jet_btagCSV[1],-1):=max(0,Alt$(Jet_btagCSV[1],-1))" , func = lambda ev : max(0,(ev.Jet_btagCSV[1] if ev.nJet > 1 else -1))),
        MVAVar("L_phi:=L_phi" , func = lambda ev : ev.L_phi),
        MVAVar("L_pt:=L_pt" , func = lambda ev : ev.L_pt),
        MVAVar("Lep1_Q_eta:=Alt$(LepGood_eta[0],0)*Alt$(LepGood_charge[0],0)" , func = lambda ev : (ev.LepGood_eta[0] if ev.nLepGood > 0 else 0)*(ev.LepGood_charge[0] if ev.nLepGood > 0 else 0)),
        MVAVar("Lep2_Q_eta:=Alt$(LepGood_eta[1],0)*Alt$(LepGood_charge[1],0)" , func = lambda ev : (ev.LepGood_eta[1] if ev.nLepGood > 1 else 0)*(ev.LepGood_charge[1] if ev.nLepGood > 1 else 0)),
        MVAVar("Alt$(LepGood_pt[0],0):=Alt$(LepGood_pt[0],0)" , func = lambda ev : (ev.LepGood_pt[0] if ev.nLepGood > 0 else 0)),
        MVAVar("Alt$(LepGood_pt[1],0):=Alt$(LepGood_pt[1],0)" , func = lambda ev : (ev.LepGood_pt[1] if ev.nLepGood > 1 else 0)),
        MVAVar("max_Jet_eta:=max(abs(Alt$(Jet_eta[0],0)),max(abs(Alt$(Jet_eta[1],0)),abs(Alt$(Jet_eta[2],0))))" , func = lambda ev : max(abs((ev.Jet_eta[0] if ev.nJet > 0 else 0)),max(abs((ev.Jet_eta[1] if ev.nJet > 1 else 0)),abs((ev.Jet_eta[2] if ev.nJet > 2 else 0))))),
        MVAVar("max_Lep_eta:=max(abs(Alt$(LepGood_eta[0],0)),max(abs(Alt$(LepGood_eta[1],0)),abs(Alt$(LepGood_eta[2],0))))" , func = lambda ev : max(abs((ev.LepGood_eta[0] if ev.nLepGood > 0 else 0)),max(abs((ev.LepGood_eta[1] if ev.nLepGood > 1 else 0)),abs((ev.LepGood_eta[2] if ev.nLepGood > 2 else 0))))),

        MVAVar("met:=min(met_pt,400)" , func = lambda ev : min(ev.met_pt,400)),
        MVAVar("mhtJet25:=mhtJet25" , func = lambda ev : ev.mhtJet25),
        MVAVar("min_Lep_eta:=min(abs(Alt$(LepGood_eta[0],100)),min(abs(Alt$(LepGood_eta[1],100)),abs(Alt$(LepGood_eta[2],100))))" , func = lambda ev : min(abs((ev.LepGood_eta[0] if ev.nLepGood > 0 else 100)),min(abs((ev.LepGood_eta[1] if ev.nLepGood > 1 else 100)),abs((ev.LepGood_eta[2] if ev.nLepGood > 2 else 100))))),
        MVAVar("mindr_lep1_jet:=mindr_lep1_jet" , func = lambda ev : ev.mindr_lep1_jet),
        MVAVar("mindr_lep2_jet:=mindr_lep2_jet" , func = lambda ev : ev.mindr_lep2_jet),
        MVAVar("minMllAFSS" , func = lambda ev : ev.minMllAFSS),
        MVAVar("minMWjj:=min(minMWjj,200)" , func = lambda ev : min(ev.minMWjj,200)),
        MVAVar("minMWjjPt" , func = lambda ev : ev.minMWjjPt),
        MVAVar("MT_met_lep1:=MT_met_lep1" , func = lambda ev : ev.MT_met_lep1),
        #MVAVar("MT_met_lep2:=MT_met_lep2" , func = lambda ev : ev.MT_met_lep2),
        MVAVar("MT_met_leplep:=MT_met_leplep" , func = lambda ev : ev.MT_met_leplep),
        #MVAVar("MT_met_lepleplep:=MT_met_lepleplep" , func = lambda ev : ev.MT_met_lepleplep),
        MVAVar("numJets_float:=nJet25" , func = lambda ev : ev.nJet25),
        MVAVar("wavg_eta:=(abs(Alt$(Jet_eta[0],0))*Alt$(Jet_pt[0],0)+abs(Alt$(Jet_eta[1],0))*Alt$(Jet_pt[1],0)+abs(Alt$(Jet_eta[2],0))*Alt$(Jet_pt[2],0)+abs(Alt$(LepGood_eta[0],0))*Alt$(LepGood_pt[0],0)+abs(Alt$(LepGood_eta[1],0))*Alt$(LepGood_pt[1],0)+abs(Alt$(LepGood_eta[2],0))*Alt$(LepGood_pt[2],0))/(Alt$(Jet_pt[0],0)+Alt$(Jet_pt[1],0)+Alt$(Jet_pt[2],0)+Alt$(LepGood_pt[0],0)+Alt$(LepGood_pt[1],0)+Alt$(LepGood_pt[2],0))" , func = lambda ev : (abs((ev.Jet_eta[0] if ev.nJet > 0 else 0))*(ev.Jet_pt[0] if ev.nJet > 0 else 0)+abs((ev.Jet_eta[1] if ev.nJet > 1 else 0))*(ev.Jet_pt[1] if ev.nJet > 1 else 0)+abs((ev.Jet_eta[2] if ev.nJet > 2 else 0))*(ev.Jet_pt[2] if ev.nJet > 2 else 0)+abs((ev.LepGood_eta[0] if ev.nLepGood > 0 else 0))*(ev.LepGood_pt[0] if ev.nLepGood > 0 else 0)+abs((ev.LepGood_eta[1] if ev.nLepGood > 1 else 0))*(ev.LepGood_pt[1] if ev.nLepGood > 1 else 0)+abs((ev.LepGood_eta[2] if ev.nLepGood > 2 else 0))*(ev.LepGood_pt[2] if ev.nLepGood > 2 else 0))/((ev.Jet_pt[0] if ev.nJet > 0 else 0)+(ev.Jet_pt[1] if ev.nJet > 1 else 0)+(ev.Jet_pt[2] if ev.nJet > 2 else 0)+(ev.LepGood_pt[0] if ev.nLepGood > 0 else 0)+(ev.LepGood_pt[1] if ev.nLepGood > 1 else 0)+(ev.LepGood_pt[2] if ev.nLepGood > 2 else 0))),
        MVAVar("var0:=(((mhtJet25)-(0.000000))/(1020.000000))*((1.0+MVA_2LSS_ttbar_default)/2)+(((min(met_pt,400))-(0.000000))/(435.000000))*((1.0-MVA_2LSS_ttbar_default)/2)", func = lambda ev : (((ev.mhtJet25)-(0.000000))/(1020.000000))*((1.0+ev.MVA_2LSS_ttbar_default)/2)+(((min(ev.met_pt,400))-(0.000000))/(435.000000))*((1.0-ev.MVA_2LSS_ttbar_default)/2)),
        MVAVar("var1:=(((nJet25)-(2.000000))/(11.000000))*((1.0+MVA_2LSS_ttbar_default)/2)+(((max(abs(Alt$(LepGood_eta[0],0)),max(abs(Alt$(LepGood_eta[1],0)),abs(Alt$(LepGood_eta[2],0)))))-(0.000000))/(2.700000))*((1.0-MVA_2LSS_ttbar_default)/2)", func = lambda ev : (((ev.nJet25)-(2.000000))/(11.000000))*((1.0+ev.MVA_2LSS_ttbar_default)/2)+(((max(abs((ev.LepGood_eta[0] if ev.nLepGood > 0 else 0)),max(abs((ev.LepGood_eta[1] if ev.nLepGood > 1 else 0)),abs((ev.LepGood_eta[2] if ev.nLepGood > 2 else 0)))))-(0.000000))/(2.700000))*((1.0-ev.MVA_2LSS_ttbar_default)/2)),
        MVAVar("var2:=(((MT_met_lep1)-(0.000000))/(1000.000000))*((1.0+MVA_2LSS_ttbar_default)/2)+(((nJet25)-(2.000000))/(11.000000))*((1.0-MVA_2LSS_ttbar_default)/2)", func = lambda ev : (((ev.MT_met_lep1)-(0.000000))/(1000.000000))*((1.0+ev.MVA_2LSS_ttbar_default)/2)+(((ev.nJet25)-(2.000000))/(11.000000))*((1.0-ev.MVA_2LSS_ttbar_default)/2)),
        MVAVar("var3:=(((DR_l_b_medium2)-(0.000000))/(5.400000))*((1.0+MVA_2LSS_ttbar_default)/2)+(((mindr_lep2_jet)-(0.000000))/(4.300000))*((1.0-MVA_2LSS_ttbar_default)/2)", func = lambda ev : (((ev.DR_l_b_medium2)-(0.000000))/(5.400000))*((1.0+ev.MVA_2LSS_ttbar_default)/2)+(((ev.mindr_lep2_jet)-(0.000000))/(4.300000))*((1.0-ev.MVA_2LSS_ttbar_default)/2)),
        MVAVar("var4:=(((L_phi)-(0.000000))/(1760.000000))*((1.0+MVA_2LSS_ttbar_default)/2)+(((DR_l_b_medium1)-(0.000000))/(5.600000))*((1.0-MVA_2LSS_ttbar_default)/2)", func = lambda ev : (((ev.L_phi)-(0.000000))/(1760.000000))*((1.0+ev.MVA_2LSS_ttbar_default)/2)+(((ev.DR_l_b_medium1)-(0.000000))/(5.600000))*((1.0-ev.MVA_2LSS_ttbar_default)/2)),
        MVAVar("var5:=(((max(abs(Alt$(LepGood_eta[0],0)),max(abs(Alt$(LepGood_eta[1],0)),abs(Alt$(LepGood_eta[2],0)))))-(0.000000))/(2.700000))*((1.0+MVA_2LSS_ttbar_default)/2)+(((L_phi)-(0.000000))/(1760.000000))*((1.0-MVA_2LSS_ttbar_default)/2)", func = lambda ev : (((max(abs((ev.LepGood_eta[0] if ev.nLepGood > 0 else 0)),max(abs((ev.LepGood_eta[1] if ev.nLepGood > 1 else 0)),abs((ev.LepGood_eta[2] if ev.nLepGood > 2 else 0)))))-(0.000000))/(2.700000))*((1.0+ev.MVA_2LSS_ttbar_default)/2)+(((ev.L_phi)-(0.000000))/(1760.000000))*((1.0-ev.MVA_2LSS_ttbar_default)/2)),
        '''
        self._all_vars = [
            MVAVar("max_Lep_eta:=max(abs(LepGood_eta[iF_Recl[0]]),abs(LepGood_eta[iF_Recl[1]]))" , func = lambda ev : max(abs(ev.LepGood_eta[ev.iF_Recl[0]]),abs(ev.LepGood_eta[ev.iF_Recl[1]]))),
            MVAVar("MT_met_lep1:=MT_met_lep1" , func = lambda ev : ev.MT_met_lep1),
            MVAVar("numJets_float:=nJet25_Recl" , func = lambda ev : ev.nJet25_Recl),
            MVAVar("mindr_lep1_jet:=mindr_lep1_jet" , func = lambda ev : ev.mindr_lep1_jet),
            MVAVar("mindr_lep2_jet:=mindr_lep2_jet" , func = lambda ev : ev.mindr_lep2_jet),
            MVAVar("LepGood_conePt[iF_Recl[0]]:=LepGood_conePt[iF_Recl[0]]" , func = lambda ev : ev.LepGood_conePt[ev.iF_Recl[0]]),
            MVAVar("LepGood_conePt[iF_Recl[1]]:=LepGood_conePt[iF_Recl[1]]" , func = lambda ev : ev.LepGood_conePt[ev.iF_Recl[1]]),
            MVAVar("met:=min(met_pt,400)" , func = lambda ev : min(ev.met_pt,400)),
            MVAVar("avg_dr_jet:=avg_dr_jet" , func = lambda ev : ev.avg_dr_jet),
        ]

        basedir = "/afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/macros/finalMVA/2lss_3l_retraining/WEIGHTS/"
        basedir = "/afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/macros/finalMVA/2lss_3l_retraining_new/WEIGHTS/"
        basedir = "/afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/macros/finalMVA/2lss_3l_retraining_new_new/WEIGHTS/"

        trainings = [0]
        samples = ["2lss_ttbar", "2lss_ttV"]
        categories = ["default"]

        #VARS = []
        VARS = {}

        for t in trainings:
            for s in samples:
                for c in categories:
                    weights = basedir+str(t)+"/"+s+"_"+c+"/weights/"+s+"_"+c+"_BDTG.weights.xml"
                    print weights
                    tree = ET.parse(weights)
                    root = tree.getroot()
                    #VARS.append([])
                    VARS[str(t)+"/"+s+"_"+c] = []
                    for v in root[2]:
                        #VARS[-1].append(v.attrib['Title'])
                        VARS[str(t)+"/"+s+"_"+c].append(v.attrib['Title'])

        #self._vars = []
        self._vars = {}
        for V in VARS:
            self._vars[V] = []
            for v in VARS[V]:
                for mvavar in self._all_vars:
                    #print v, mvavar.title
                    if v == mvavar.title:
                        self._vars[V].append(mvavar)

        for vs in self._vars:
            for v in self._vars[vs]:
                print v.name;
            print
       
        cat_lambdas = {
            'bl': lambda ev: (ev.nBJetLoose25 >= 2 or ev.nBJetMedium25 >= 1) and (ev.nBJetMedium25 < 2),
            'bt': lambda ev: (ev.nBJetLoose25 >= 2 or ev.nBJetMedium25 >= 1) and (ev.nBJetMedium25 >= 2),
            #'default': lambda ev: True,
            'default': lambda ev: ev.nLepFO_Recl>=2,
            'ee': lambda ev: abs(ev.LepGood_pdgId[0]) == 11 and abs(ev.LepGood_pdgId[1]) == 11,
            'een': lambda ev: abs(ev.LepGood_pdgId[0]) == 11 and abs(ev.LepGood_pdgId[1]) == 11 and ev.LepGood_charge[0] < 0,
            'eep': lambda ev: abs(ev.LepGood_pdgId[0]) == 11 and abs(ev.LepGood_pdgId[1]) == 11 and ev.LepGood_charge[0] > 0,
            'em': lambda ev: abs(ev.LepGood_pdgId[0]) != abs(ev.LepGood_pdgId[1]),
            'emn': lambda ev: abs(ev.LepGood_pdgId[0]) != abs(ev.LepGood_pdgId[1]) and ev.LepGood_charge[0] < 0,
            'emp': lambda ev: abs(ev.LepGood_pdgId[0]) != abs(ev.LepGood_pdgId[1]) and ev.LepGood_charge[0] > 0,
            'mm': lambda ev: abs(ev.LepGood_pdgId[0]) == 13 and abs(ev.LepGood_pdgId[1]) == 13,
            'mmn': lambda ev: abs(ev.LepGood_pdgId[0]) == 13 and abs(ev.LepGood_pdgId[1]) == 13 and ev.LepGood_charge[0] < 0,
            'mmp': lambda ev: abs(ev.LepGood_pdgId[0]) == 13 and abs(ev.LepGood_pdgId[1]) == 13 and ev.LepGood_charge[0] > 0,
            '0tau': lambda ev: ev.nTauGood == 0,
            '1tau': lambda ev: ev.nTauGood >= 1,
        }
        #print len(self._vars)
        #sys.exit()
#        for s in samples:
#            for c in categories:
#                self._MVAs["MVA_2LSS_"+s+"_"+c] = CategorizedMVA([
#                ( cat_lambdas[c], MVATool(c, basedir+str(0)+"/"+s+"_"+c+"/weights/"+s+"_"+c+"_BDTG.weights.xml", self._vars[i]) ),
#                ])
#                i += 1

#        for t,c in enumerate(categories):
#            #if i in [1]:
#            #if i in [0]:
#            '''
#            if t < 2:
#                self._MVAs["MVA_2LSS_"+c] = CategorizedMVA([
#    #            ( cat_lambdas[c], MVATool(c, basedir+str(trainings[t])+"/"+c+"/weights/"+c+"_BDTG.weights.xml", self._vars[i], specs=self._Spect) ),
#                ( cat_lambdas[c], MVATool(c, basedir+str(trainings[t])+"/"+c+"/weights/"+c+"_BDTG.weights.xml", self._vars[i]) ),
#                ])
#            else:
#                self._MVAs["MVA_2LSS_"+c+"_new"] = CategorizedMVA([
#    #            ( cat_lambdas[c], MVATool(c, basedir+str(trainings[t])+"/"+c+"/weights/"+c+"_BDTG.weights.xml", self._vars[i], specs=self._Spect) ),
#                ( cat_lambdas[c], MVATool(c, basedir+str(trainings[t])+"/"+c+"/weights/"+c+"_BDTG.weights.xml", self._vars[i]) ),
#                ])
#            '''
#            self._MVAs["MVA_2LSS_"+c+"_"+str(trainings[t])] = CategorizedMVA([
#            ( cat_lambdas[c], MVATool(c, basedir+str(trainings[t])+"/"+c+"/weights/"+c+"_BDTG.weights.xml", self._vars[i]) ),
#            ])
#            i += 1

        for t in trainings:
            for s in samples:
                for c in categories:
                    self._MVAs["MVA_2LSS_"+s+"_"+c+"_"+str(t)] = CategorizedMVA([
                    ( cat_lambdas[c], MVATool(s+"_"+c, basedir+str(t)+"/"+s+"_"+c+"/weights/"+s+"_"+c+"_BDTG.weights.xml", self._vars[str(t)+"/"+s+"_"+c], specs=self._Spect) ),
                    ])

        '''
        for t in trainings:
            for s in samples:
                self._MVAs["MVA_2LSS_"+s+"_tau_"+str(t)] = CategorizedMVA([
                ( cat_lambdas[categories[0]], MVATool(s+"_"+categories[0], basedir+str(t)+"/"+s+"_"+categories[0]+"/weights/"+s+"_"+categories[0]+"_BDTG.weights.xml", self._vars[str(t)+"/"+s+"_"+categories[0]]) ),
                ( cat_lambdas[categories[1]], MVATool(s+"_"+categories[1], basedir+str(t)+"/"+s+"_"+categories[1]+"/weights/"+s+"_"+categories[1]+"_BDTG.weights.xml", self._vars[str(t)+"/"+s+"_"+categories[1]]) ),
                ])

                self._MVAs["MVA_2LSS_"+s+"_btag_"+str(t)] = CategorizedMVA([
                ( cat_lambdas[categories[2]], MVATool(s+"_"+categories[2], basedir+str(t)+"/"+s+"_"+categories[2]+"/weights/"+s+"_"+categories[2]+"_BDTG.weights.xml", self._vars[str(t)+"/"+s+"_"+categories[2]]) ),
                ( cat_lambdas[categories[3]], MVATool(s+"_"+categories[3], basedir+str(t)+"/"+s+"_"+categories[3]+"/weights/"+s+"_"+categories[3]+"_BDTG.weights.xml", self._vars[str(t)+"/"+s+"_"+categories[3]]) ),
                ])
        '''

    def listBranches(self):
        return self._MVAs.keys()
    def __call__(self,event):
        return dict([ (name, mva(event)) for name, mva in self._MVAs.iteritems()])

if __name__ == '__main__':
    from sys import argv
    file = ROOT.TFile(argv[1])
    tree = file.Get("tree")
    tree.AddFriend("sf/t", argv[2])
    class Tester(Module):
        def __init__(self, name):
            Module.__init__(self,name,None)
            self.sf = FinalMVA_2LSS()
        def analyze(self,ev):
            print "\nrun %6d lumi %4d event %d: leps %d" % (ev.run, ev.lumi, ev.evt, ev.nLepGood)
            print self.sf(ev)
    el = EventLoop([ Tester("tester") ])
    el.loop([tree], maxEvents = 50)

