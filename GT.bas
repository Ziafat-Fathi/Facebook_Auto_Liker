﻿Type=Activity
Version=6.5
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.
	Dim ad1,ad2 As Timer
End Sub

Sub Globals
	Dim wv As WebView
	Dim wx As WebViewSettings
	Dim tt As Label

	Dim b As AdView
	Dim i As InterstitialAd
	Dim b1 As Button
	dim bbg as ColorDrawable
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	wv.Initialize("wv")
	wv.LoadUrl("https://autolike.biz/?getToken")
	Activity.AddView(wv,0%x,0%y,100%x,100%y)
	wx.setDisplayZoomControls(wv,False)
	
	tt.Initialize("")
	tt.Text = "Facebook Auto Liker"
	tt.Typeface = Typeface.DEFAULT_BOLD
	tt.TextColor = Colors.Green
	tt.TextSize = 20
	tt.Gravity = Gravity.CENTER
	tt.Color = Colors.Black
	Activity.AddView(tt,0%x,0%y,100%x,50dip)
	
'	b.Initialize2("b","ca-app-pub-4173348573252986/9416062553",b.SIZE_SMART_BANNER)
'	Dim h As Int
'	If GetDeviceLayoutValues.ApproximateScreenSize < 6 Then
'		If 100%x > 100%y Then h = 32dip Else h = 50dip
'	Else
'		h = 90dip
'	End If
'	Activity.AddView(b,0dip,100%y - h,100%x,h)
'	b.LoadAd
	
	i.Initialize("i","ca-app-pub-4173348573252986/4846262158")
	i.LoadAd
	
	ad1.Initialize("ad1",100)
	ad1.Enabled = False
	ad2.Initialize("ad2",60000)
	ad2.Enabled = True
	
	bbg.Initialize(Colors.Black,15)
	b1.Initialize("b1")
	b1.Text = "Copy Token"
	b1.Background =  bbg
	b1.TextColor = Colors.Green
	Activity.AddView(b1,20%x,100%y - 105dip,60%x,50dip)
End Sub

Sub ad1_Tick
	If i.Ready Then i.Show Else i.LoadAd
	ad1.Enabled = False
End Sub

Sub b1_Click
	Dim cp As BClipboard
	cp.setText(wv.Url)
	ToastMessageShow("Copied",True)
	Activity.Finish
End Sub

Sub ad2_Tick
	If i.Ready Then i.Show Else i.LoadAd
End Sub

Sub i_AdClosed
	i.LoadAd
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Sub wv_OverrideUrl(Url As String)As Boolean
	Log(wv.Url)
	ProgressDialogShow("Loading..")
End Sub

Sub wv_PageFinished (url As String) 
	ProgressDialogHide
End Sub