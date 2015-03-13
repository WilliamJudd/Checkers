//
//  GameBoardView.swift
//  GameBoard
//
//  Created by Jide Opeola on 2/18/15.
//  Copyright (c) 2015 Jide Opeola. All rights reserved.
//

import UIKit



// boardSquares[row][column]


@IBDesignable class GameBoardView: UIView, GamePieceDelegate {
    
    let gridSize = 8
    
    var availableMoves:[(Int, Int)] = []
    
    
    override func layoutSubviews() {
        
        if  let boardSquares = DataModel.mainData().currentGame?.boardSquares {
            
            // enumerate fills (r, row) "r" is incremented row  = number in arrary
            
            for (rowIndex,rowArray) in enumerate(boardSquares) {
                // "col" is the value at the index..."c" is the index
                // was (c, col)
                
                //            println("row array: \(rowArray)")
                //            println("row index: \(rowIndex)")
                
                for (columnIndex,squarePieceType) in enumerate(rowArray) {
                    
                    if squarePieceType == 0 {continue}
                    
                    //                println("column Index: \(columnIndex)")
                    //                println("square Piece type: \(squarePieceType)")
                    
                    if let type = PieceType(rawValue: squarePieceType) {
                        
                        var piece = GamePiece(type: type)
                        
                        piece.square = (columnIndex, rowIndex)
                        piece.delegate = self
                        DataModel.mainData().currentGame?.boardPieces[rowIndex][columnIndex] = piece
                        
                        // println(boardPieces[rowIndex][columnIndex])
                        
                        let cF = CGFloat(columnIndex)
                        let rF = CGFloat(rowIndex)
                        
                        let squareSize = frame.width / CGFloat(gridSize)
                        
                        
                        let x = cF * squareSize + squareSize / 2
                        let y = rF * squareSize + squareSize / 2
                        
                        piece.center = CGPointMake(x, y)
                        
                        addSubview(piece)
                        
                    }
                    
                }
            }
            
        }
        
        
        
    }
    
    func pieceSelected(piece: GamePiece) {
        
        // piece.square is your start point
        
        let (c,r) = piece.square
        let squareTopRight = DataModel.mainData().currentGame?.boardPieces[c + 1][r - 1]
        
        if squareTopRight != nil {
            
            
            //     piece.square = (squareTopRight[0], squareTopRight[1])
            
            
        }
        
        // do something with piece
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        if let touch = touches.allObjects.last as? UITouch {
            
            let location = touch.locationInView(self)
            
            let squareSize = frame.width / CGFloat(gridSize)
            
            let col = Int(floor(location.x / squareSize))
            let row = Int(floor(location.y / squareSize))
            
            let selectedSquare = DataModel.mainData().currentGame?.boardPieces[row][col]
            
            
        }
        
    }
    
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        var context = UIGraphicsGetCurrentContext()
        
        
        for c in 0..<gridSize {
            
          //  println(DataModel.mainData().currentGame?.players)
            
            for r in 0..<gridSize {
                
                let cF = CGFloat(c)
                let rF = CGFloat(r)
                
                let squareSize = rect.width / CGFloat(gridSize)
                
                let x = cF * squareSize
                let y = rF * squareSize
                
                // majilo figures out reminder
                let color = (c + r) % 2 == 0 ? UIColor.magentaColor() : UIColor.darkGrayColor()
                
                color.set()
                
                CGContextFillRect(context, CGRectMake(x, y, squareSize, squareSize))
                
                
                
                
                
            }
            
            
        }
        
        
        
    }
    
    
}
