{
   c1 = new TCanvas("c1","A Simple Graph with asymmetric error bars",200,10,700,500);
   c1->SetFillColor(42);
   c1->SetGrid();
   c1->GetFrame()->SetFillColor(21);
   c1->GetFrame()->SetBorderSize(12);
   const Int_t n = 4;
   Double_t x[n]   = {0, 1, 2, 3};
   Double_t y[n]   = {0.818202, 0.767382, 0.421806, 0.320166};
   Double_t exl[n] = {0, 0, 0, 0};
   Double_t eyl[n] = {0.447216, 0.40656, 0.223608, 0.182952};
   Double_t exh[n] = {0, 0, 0, 0};
   Double_t eyh[n] = {1.661814, 1.570338, 0.848694, 0.701316};
   gr = new TGraphAsymmErrors(n,x,y,exl,exh,eyl,eyh);
   gr->SetTitle("TGraphAsymmErrors Example");
   gr->SetMarkerColor(4);
   gr->SetMarkerStyle(21);
   gr->Draw("ALP");

   Double_t X[n]   = {0, 1, 2, 3};
   Double_t Y[n]   = {0.60984, 0.564102, 0.299838, 0.233772};
   Double_t Exl[n] = {0, 0, 0, 0};
   Double_t Eyl[n] = {0.447216, 0.40656, 0.223608, 0.182952};
   Double_t Exh[n] = {0, 0, 0, 0};
   Double_t Eyh[n] = {1.199352, 1.138368, 0.625086, 0.5082};
   gr1 = new TGraphAsymmErrors(n,X,Y,Exl,Exh,Eyl,Eyh);
   gr1->SetTitle("TGraphAsymmErrors Example");
   gr1->SetMarkerColor(4);
   gr1->SetMarkerStyle(21);
   gr1->Draw("ALP SAME");

   return c1;
}
