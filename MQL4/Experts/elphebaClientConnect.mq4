  {

   double Margin=AccountFreeMargin()-Withdrawls+Deposits-bufferEquity;

   return Margin;
  }
//+------------------------------------------------------------------+
string GrabWeb(string strUrl,double currentEquity)
  {
   string headers,response;
   char post[],result[];
   int httpRes,timeout=5000;
   char data[];
   string login=DoubleToStr(AccountNumber(),0);
   string password="pass";
   string str="Acct="+login+"&Password="+password+"$Equity="+DoubleToStr(currentEquity,2);

   ArrayResize(data,StringToCharArray(str,data,0,WHOLE_ARRAY,CP_UTF8)-1);

   ResetLastError();
   httpRes=WebRequest("POST",strUrl,"",NULL,1000,data,ArraySize(data),result,headers);

//Print("Status code: ",httpRes,", error: ",GetLastError());
   response=CharArrayToString(result);
   Print("Server response: ",response);
   return(response);
  }
//+--------------------------------------------------------------+
