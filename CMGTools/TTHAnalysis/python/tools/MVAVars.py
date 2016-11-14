from CMGTools.TTHAnalysis.treeReAnalyzer import *
from CMGTools.TTHAnalysis.tools.mvaTool import *

import xml.etree.ElementTree as ET

class MVAVars:
    def __init__(self):
        self._MVAs = {}
        '''
        self._Spect = [
              MVAVar("iF0 := iF_Recl[0]", func = lambda ev : ev.iF_Recl[0]),
              MVAVar("iF1 := iF_Recl[1]", func = lambda ev : ev.iF_Recl[1]),
              MVAVar("iF2 := iF_Recl[2]", func = lambda ev : ev.iF_Recl[2]),
        ]
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
        '''
        self._all_vars = [
            MVAVar("HiggsBJet1HiggsBJet2Dr_TOPHLEPBB:=HiggsBJet1HiggsBJet2Dr_TOPHLEPBB" , func = lambda ev : ev.HiggsBJet1HiggsBJet2Dr_TOPHLEPBB),
            MVAVar("HiggsBJet1HiggsBJet2Dr_TOPTOPLEPHBB:=HiggsBJet1HiggsBJet2Dr_TOPTOPLEPHBB" , func = lambda ev : ev.HiggsBJet1HiggsBJet2Dr_TOPTOPLEPHBB),
            MVAVar("HiggsEta_TOPHLEPBB:=HiggsEta_TOPHLEPBB" , func = lambda ev : ev.HiggsEta_TOPHLEPBB),
            MVAVar("HiggsEta_TOPTOPLEPHBB:=HiggsEta_TOPTOPLEPHBB" , func = lambda ev : ev.HiggsEta_TOPTOPLEPHBB),
            MVAVar("HiggsMass_TOPHLEPBB:=HiggsMass_TOPHLEPBB" , func = lambda ev : ev.HiggsMass_TOPHLEPBB),
            MVAVar("HiggsMass_TOPTOPLEPHBB:=HiggsMass_TOPTOPLEPHBB" , func = lambda ev : ev.HiggsMass_TOPTOPLEPHBB),
            MVAVar("LepCharge:=LepCharge" , func = lambda ev : ev.LepCharge),
            MVAVar("MVA_TOPHLEPBB:=MVA_TOPHLEPBB" , func = lambda ev : ev.MVA_TOPHLEPBB),
            MVAVar("MVA_TOPTOPLEPHAD:=MVA_TOPTOPLEPHAD" , func = lambda ev : ev.MVA_TOPTOPLEPHAD),
            MVAVar("MVA_TOPTOPLEPHBB:=MVA_TOPTOPLEPHBB" , func = lambda ev : ev.MVA_TOPTOPLEPHBB),
            MVAVar("TopHadMass_TOPTOPLEPHAD:=TopHadMass_TOPTOPLEPHAD" , func = lambda ev : ev.TopHadMass_TOPTOPLEPHAD),
            MVAVar("TopLepEta_TOPHLEPBB:=TopLepEta_TOPHLEPBB" , func = lambda ev : ev.TopLepEta_TOPHLEPBB),
            MVAVar("TopLepEta_TOPTOPLEPHBB:=TopLepEta_TOPTOPLEPHBB" , func = lambda ev : ev.TopLepEta_TOPTOPLEPHBB),
            MVAVar("TopLepHiggsDr_TOPHLEPBB:=TopLepHiggsDr_TOPHLEPBB" , func = lambda ev : ev.TopLepHiggsDr_TOPHLEPBB),
            MVAVar("TopLepHiggsDr_TOPTOPLEPHBB:=TopLepHiggsDr_TOPTOPLEPHBB" , func = lambda ev : ev.TopLepHiggsDr_TOPTOPLEPHBB),
            MVAVar("TopLepMass_TOPHLEPBB:=TopLepMass_TOPHLEPBB" , func = lambda ev : ev.TopLepMass_TOPHLEPBB),
            MVAVar("TopLepMass_TOPTOPLEPHAD:=TopLepMass_TOPTOPLEPHAD" , func = lambda ev : ev.TopLepMass_TOPTOPLEPHAD),
            MVAVar("TopLepMass_TOPTOPLEPHBB:=TopLepMass_TOPTOPLEPHBB" , func = lambda ev : ev.TopLepMass_TOPTOPLEPHBB),
            MVAVar("TopLepPt_TOPHLEPBB:=TopLepPt_TOPHLEPBB" , func = lambda ev : ev.TopLepPt_TOPHLEPBB),
            MVAVar("TopLepPt_TOPTOPLEPHBB:=TopLepPt_TOPTOPLEPHBB" , func = lambda ev : ev.TopLepPt_TOPTOPLEPHBB),
            MVAVar("TopLepTopHadDr_TOPTOPLEPHAD:=TopLepTopHadDr_TOPTOPLEPHAD" , func = lambda ev : ev.TopLepTopHadDr_TOPTOPLEPHAD),
        ]

        #basedir = "/afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/macros/finalMVA/2lss_3l_retraining_new_new/WEIGHTS/"

        #/afs/cern.ch/work/c/cirkovic/fcnc/CMSSW_8_0_12/src/tHFCNC/NtupleAnalyzer/test/MVA/weights/TMVAClassification_BDT.weights.xml
        #basedir = "/afs/cern.ch/work/c/cirkovic/fcnc/CMSSW_8_0_12/src/tHFCNC/NtupleAnalyzer/test/MVA/"
        basedir = "/afs/cern.ch/work/c/cirkovic/fcnc_ana/CMSSW_8_0_12/src/tHFCNC/NtupleAnalyzer/test/MVA_test/"

        #trainings = ["ST_e", "TT_e", "both_e", "ST_m", "TT_m", "both_m", "ST_all", "TT_all", "both_all"]
        trainings = ["HutTT_b3j3", "HutST_b3j3", "HctST_b3j4", "HutST_b3j4", "HctTT_b3j4", "HctTT_b2j4", "HctST_b2j4", "HutTT_b3j4", "HutTT_b2j4", "HutST_b2j4", "HctTT_b3j3", "HctST_b3j3"]
        #samples = ["ST", "TT"]
        categories = ["default"]

        #VARS = []
        VARS = {}

        '''
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
        '''

        #for s in samples:
        for s in trainings:
            for c in categories:
                #weights = basedir+"/"+s+"/weights/TMVAClassification_BDT.weights.xml"
                weights = basedir+"/"+s+"/weights/TMVA_"+s+"_BDT.weights.xml"
                print weights
                tree = ET.parse(weights)
                root = tree.getroot()
                #VARS.append([])
                VARS[s+"_"+c] = []
                for v in root[2]:
                    VARS[s+"_"+c].append(v.attrib['Title'])

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
            'default': lambda ev: True,
            #'default': lambda ev: ev.nLepFO_Recl>=2,
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

        '''
        for t in trainings:
            for s in samples:
                for c in categories:
                    self._MVAs["MVA_2LSS_"+s+"_"+c+"_"+str(t)] = CategorizedMVA([
                    ( cat_lambdas[c], MVATool(s+"_"+c, basedir+str(t)+"/"+s+"_"+c+"/weights/"+s+"_"+c+"_BDTG.weights.xml", self._vars[str(t)+"/"+s+"_"+c], specs=self._Spect) ),
                    ])
        '''
        #for s in samples:
        for s in trainings:
            for c in categories:
                self._MVAs["MVA_"+s+"_"+c] = CategorizedMVA([
                ( cat_lambdas[c], MVATool("MVA_"+s+"_"+c, basedir+"/"+s+"/weights/TMVA_"+s+"_BDT.weights.xml", self._vars[s+"_"+c]) ),
                ])


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
            self.sf = MVAVars()
        def analyze(self,ev):
            print "\nrun %6d lumi %4d event %d: leps %d" % (ev.run, ev.lumi, ev.evt, ev.nLepGood)
            print self.sf(ev)
    el = EventLoop([ Tester("tester") ])
    el.loop([tree], maxEvents = 50)

