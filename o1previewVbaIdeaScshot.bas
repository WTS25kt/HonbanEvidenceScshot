Sub スクリーンショット保存()
    Dim StepNumber As String
    Dim Result As String
    Dim FileName As String
    Dim FilePath As String
    
    ' チェックリストから項番と結果を取得
    StepNumber = ActiveCell.Offset(0, -1).Value   ' 項番
    Result = ActiveCell.Value                     ' 確認結果（OK/NG）
    
    ' ファイル名を設定
    FileName = StepNumber & "_" & Result & ".png"
    FilePath = "C:\スクリーンショット保存先フォルダ\" & FileName  ' 保存先を適宜変更
    
    ' スクリーンショットを撮影して保存
    SendKeys "{PRTSC}"
    Application.Wait (Now + TimeValue("0:00:01"))  ' スクリーンショットのキャプチャを待機
    
    ' クリップボードの画像をファイルに保存
    With CreateObject("WIA.ImageFile")
        .LoadFile ("clipboard:")  ' クリップボードから画像を取得
        .SaveFile FilePath        ' ファイルに保存
    End With
    
    MsgBox "スクリーンショットを保存しました：" & vbCrLf & FileName
End Sub