VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ThisWorkbook"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Sub StocksChallenge()
    
    'decalrations
    
    Dim ws As Worksheet
    Dim LastRow As Long
    Dim i As Long
    Dim TickerOutput As Long
    Dim QChangeOut As Long
    Dim first_i As Long
    Dim j As Long
    Dim QCRow As Long
    Dim PChangeOut As Long
    Dim totallist As Double
    Dim part As Variant
    Dim percentmax As Double
    
    Cells(1, 8).Value = "Ticker"
    Cells(1, 9).Value = "Quarterly Change"
    Cells(1, 10).Value = "Percent Change"
    Cells(1, 11).Value = "Total Stock Volume"
    
    Cells(1, 15).Value = "Ticker"
    Cells(1, 16).Value = "Value"
    Cells(2, 14).Value = "Greatest % Increase"
    Cells(3, 14).Value = "Greatest % decrease"
    Cells(4, 14).Value = "Greatest Total Volume"
    
    
    'Getting it to run on all sheets
    
    For Each ws In Worksheets
        LastRow = ws.Cells(ws.Rows.Count, 1).End(xlUp).Row
        QCRow = ws.Cells(ws.Rows.Count, 9).End(xlUp).Row
        
        TickerOutput = 2
        QChangeOut = 2
        PChangeOut = 2
        TOut = 2
        
        
        For i = 2 To LastRow - 1
            If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
                
                ws.Cells(TickerOutput, 8).Value = ws.Cells(i, 1).Value
                TickerOutput = TickerOutput + 1
                
                'how to find the first row for quarterly change
                
                
                first_i = i
                For j = i - 1 To 2 Step -1
                    If ws.Cells(j, 1).Value <> ws.Cells(i, 1).Value Then
                        Exit For
                        End If
                    first_i = j
                    
                Next j
                
                ' This is for the quarterly change on the sheet
                
                ws.Cells(QChangeOut, 9).Value = ws.Cells(i, 6).Value - ws.Cells(first_i, 3).Value
                QChangeOut = QChangeOut + 1
                
            End If
        
        Next i
        
        'getting the color to work right
        
         For i = 2 To QChangeOut - 1
            If ws.Cells(i, 9).Value > 0 Then
                ws.Cells(i, 9).Interior.ColorIndex = 4
            ElseIf ws.Cells(i, 9).Value < 0 Then
                ws.Cells(i, 9).Interior.ColorIndex = 3
            End If
        Next i
        
        'this is me trying to calculate the percent total
        
         For i = 2 To QChangeOut - 1
            If ws.Cells(i, 1).Value <> "" Then
                first_i = i
                For j = i - 1 To 2 Step -1
                    If ws.Cells(j, 1).Value <> ws.Cells(i, 1).Value Then
                        Exit For
                    End If
                    first_i = j
                Next j

                If ws.Cells(first_i, 3).Value <> 0 Then
                    ws.Cells(PChangeOut, 10).Value = ws.Cells(i, 9).Value / ws.Cells(first_i, 3).Value
                    ws.Cells(PChangeOut, 10).NumberFormat = "0.00%"
                
                Else
                    ws.Cells(PChangeOut, 10).Value = 0
                End If
                PChangeOut = PChangeOut + 1
            End If
        Next i
        
        'this is me attempting to sum the total volume for Total Stock Volume
        
        For i = 2 To LastRow - 1
            If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
                totallist = 0
                For j = i To 2 Step -1
                    If ws.Cells(j, 1).Value <> ws.Cells(i, 1).Value Then
                        Exit For
                    End If
                    totallist = totallist + ws.Cells(j, 7).Value
                Next j
                
                ws.Cells(TOut, 11).Value = totallist
                ws.Cells(TOut, 11).NumberFormat = "0.00"
                TOut = TOut + 1
            End If
        Next i
        
        'Get the greatest % increase
        
    For i = 2 To LastRow - 1
            If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
                totallist = 0
                For j = i To 2 Step -1
                    If ws.Cells(j, 1).Value <> ws.Cells(i, 1).Value Then
                        Exit For
                    End If
                    totallist = totallist + ws.Cells(j, 7).Value
                Next j
                
                ws.Cells(TOut, 11).Value = totallist
                ws.Cells(TOut, 11).NumberFormat = "0.00"
                TOut = TOut + 1
            End If
        Next i
        
        ' Get the greatest % increase

     
     
    


End Sub




