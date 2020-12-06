import Cells from '@/store/modules/cells/index.js'

const getBoard = () => {
  const board = new Array(3).fill(null).map(() => Array(3))
  for (let i = 0; i < 3; i++) {
    for (let j = 0; j < 3; j++) {
      board[i][j] = { 
        nRow: i + 1, 
        nCol: j + 1, 
        bHasBlackChip: false, 
        bHasWhiteChip: false,
        bHasBlackKing: false,
        bHasWhiteKing: false,
        isHighlighted: false,
        isPossibleCapture: false,
        isPossibleMove: false
      }
    }
  }
  return board
}

describe('Mutation testing', () => {
  describe('Highlighting the selected cell', () => {
    it(`sets the firstClick cell's to the coordinates of the cell
      clicked`, () => {
        const state = {
          firstClick: null,
          cells: getBoard()
        }
        
        let coords = { nRow: 2, nCol: 2 }
        Cells.mutations.mHighlight(state, coords)
        expect(state.firstClick).toBe(coords)
      })
  }),

  describe('Moving a piece forward', () => {
    it('Replaces the board with a deep copy of the updated board which \
      contains the new position of a white chip', () => {
      const board = new Array(2).fill(null).map(() => Array(2))

      // Fake 2x2 board for testing
      board[0][0] = { 
        nRow: 1, nCol: 1, 
        bHasBlackChip: false,
        bHasBlackKing: false, 
        bHasWhiteChip: true,
        bHasWhiteKing: false,
        isHighlighted: false,
        isPossibleCapture: false,
        isPossibleMove: false
      }
      
      board[0][1] = { 
        nRow: 1, nCol: 2, 
        bHasBlackChip: false,
        bHasBlackKing: false, 
        bHasWhiteChip: false,
        bHasWhiteKing: false,
        isHighlighted: false,
        isPossibleCapture: false,
        isPossibleMove: false
      }

      board[1][0] = { 
        nRow: 2, nCol: 1, 
        bHasBlackChip: false,
        bHasBlackKing: false, 
        bHasWhiteChip: false,
        bHasWhiteKing: false,
        isHighlighted: false,
        isPossibleCapture: false,
        isPossibleMove: false
      }

      board[1][1] = { 
        nRow: 2, nCol: 2, 
        bHasBlackChip: false,
        bHasBlackKing: false, 
        bHasWhiteChip: false,
        bHasWhiteKing: false,
        isHighlighted: false,
        isPossibleCapture: false,
        isPossibleMove: false
      }

      /**
       * Starting position looks like this:
       * _ _
       * o _
       */

      const state = {
        cells: board,
        firstClick: {row: 1, col: 1}
      }

      const expected = [
        [
          { nRow: 1, nCol: 1, 
            bHasBlackChip: false,
            bHasBlackKing: false, 
            bHasWhiteChip: false,
            bHasWhiteKing: false,
            isHighlighted: false,
            isPossibleCapture: false,
            isPossibleMove: false
          },
          { nRow: 1, nCol: 2,             
            bHasBlackChip: false,
            bHasBlackKing: false, 
            bHasWhiteChip: false,
            bHasWhiteKing: false,
            isHighlighted: false,
            isPossibleCapture: false,
            isPossibleMove: false
          }
        ],
        [
          { nRow: 2, nCol: 1, 
            bHasBlackChip: false,
            bHasBlackKing: false, 
            bHasWhiteChip: false,
            bHasWhiteKing: false,
            isHighlighted: false,
            isPossibleCapture: false,
            isPossibleMove: false
          },
          { nRow: 2, nCol: 2,
            bHasBlackChip: false,
            bHasBlackKing: false, 
            bHasWhiteChip: true,
            bHasWhiteKing: false,
            isHighlighted: false,
            isPossibleCapture: false,
            isPossibleMove: false
          }
        ]
      ]

      /**
       * Ending position:
       * _ o
       * _ _
       */

      let coords = { nRow: 1, nCol: 1, nDestRow: 2, nDestCol: 2 }
      Cells.mutations.mMoveForward(state, coords)
      expect(state.cells).toStrictEqual(expected)
      expect(state.firstClick).toBe(null)
    })
  
    it('Replaces the board with a deep copy of the updated board which \
      contains the new position of a black chip', () => {
      const board = new Array(2).fill(null).map(() => Array(2))

      // Fake 2x2 board for testing
      board[0][0] = {
        nRow: 1, nCol: 1,  
        bHasBlackChip: false,
        bHasBlackKing: false, 
        bHasWhiteChip: false,
        bHasWhiteKing: false,
        isHighlighted: false,
        isPossibleCapture: false,
        isPossibleMove: false
      }

      board[0][1] = {
        nRow: 1, nCol: 2, 
        bHasBlackChip: false,
        bHasBlackKing: false, 
        bHasWhiteChip: false,
        bHasWhiteKing: false,
        isHighlighted: false,
        isPossibleCapture: false,
        isPossibleMove: false
      }

      board[1][0] = {
        nRow: 2, nCol: 1, 
        bHasBlackChip: false,
        bHasBlackKing: false, 
        bHasWhiteChip: false,
        bHasWhiteKing: false,
        isHighlighted: false,
        isPossibleCapture: false,
        isPossibleMove: false
      }

      board[1][1] = {
        nRow: 2, nCol: 2, 
        bHasBlackChip: true,
        bHasBlackKing: false, 
        bHasWhiteChip: false,
        bHasWhiteKing: false,
        isHighlighted: false,
        isPossibleCapture: false,
        isPossibleMove: false
      }

      /**
       * Starting position looks like this:
       * _ o
       * _ _
       */

      const state = {
        cells: board,
        firstClick: {row: 2, col: 2}
      }

      const expected = [
        [
          { nRow: 1, nCol: 1, 
            bHasBlackChip: true,
            bHasBlackKing: true, 
            bHasWhiteChip: false,
            bHasWhiteKing: false,
            isHighlighted: false,
            isPossibleCapture: false,
            isPossibleMove: false
          },
          { nRow: 1, nCol: 2,  
            bHasBlackChip: false,
            bHasBlackKing: false, 
            bHasWhiteChip: false,
            bHasWhiteKing: false,
            isHighlighted: false,
            isPossibleCapture: false,
            isPossibleMove: false
          }
        ],
        [
          { nRow: 2, nCol: 1,  
            bHasBlackChip: false,
            bHasBlackKing: false, 
            bHasWhiteChip: false,
            bHasWhiteKing: false,
            isHighlighted: false,
            isPossibleCapture: false,
            isPossibleMove: false
          },
          { nRow: 2, nCol: 2, 
            bHasBlackChip: false,
            bHasBlackKing: false, 
            bHasWhiteChip: false,
            bHasWhiteKing: false,
            isHighlighted: false,
            isPossibleCapture: false,
            isPossibleMove: false
          }
        ]
      ]

      /**
       * Ending position:
       * _ _
       * o _
       */

      let coords = { nRow: 2, nCol: 2, nDestRow: 1, nDestCol: 1 }
      Cells.mutations.mMoveForward(state, coords)
      expect(state.cells).toStrictEqual(expected)
      expect(state.firstClick).toBe(null)
    })
  })

  describe('Capturing a piece', () => {
    it('Replaces the board with a deep copy of the updated board which \
      contains the new position of a white chip', () => {
        // Arrange
        const board = getBoard()
        board[0][0] = { 
          nRow: 1, 
          nCol: 1, 
          bHasBlackChip: false, 
          bHasWhiteChip: true,
          bHasBlackKing: false,
          bHasWhiteKing: false,
          isHighlighted: false,
          isPossibleCapture: false,
          isPossibleMove: false
        }

        board[1][1] = {
          nRow: 2, 
          nCol: 2, 
          bHasBlackChip: true, 
          bHasWhiteChip: false,
          bHasBlackKing: false,
          bHasWhiteKing: false,
          isHighlighted: false,
          isPossibleCapture: false,
          isPossibleMove: false
        }

        /**
         * Starting position looks like this:
         * _ _ _
         * _ x _
         * o _ _
         */
  
        const state = {
          cells: board,
          firstClick: {row: 0, col: 0}
        }
  
        const expected = [
          [
            { nRow: 1, nCol: 1,  
              bHasBlackChip: false,
              bHasBlackKing: false, 
              bHasWhiteChip: false,
              bHasWhiteKing: false,
              isHighlighted: false,
              isPossibleCapture: false,
              isPossibleMove: false
            },
            { nRow: 1, nCol: 2, 
              bHasBlackChip: false,
              bHasBlackKing: false, 
              bHasWhiteChip: false,
              bHasWhiteKing: false,
              isHighlighted: false,
              isPossibleCapture: false,
              isPossibleMove: false
            },
            { nRow: 1, nCol: 3, 
              bHasBlackChip: false,
              bHasBlackKing: false, 
              bHasWhiteChip: false,
              bHasWhiteKing: false,
              isHighlighted: false,
              isPossibleCapture: false,
              isPossibleMove: false
            }
          ],
          [
            { nRow: 2, nCol: 1,  
              bHasBlackChip: false,
              bHasBlackKing: false, 
              bHasWhiteChip: false,
              bHasWhiteKing: false,
              isHighlighted: false,
              isPossibleCapture: false,
              isPossibleMove: false
            },
            { nRow: 2, nCol: 2,  
              bHasBlackChip: false,
              bHasBlackKing: false, 
              bHasWhiteChip: false,
              bHasWhiteKing: false,
              isHighlighted: false,
              isPossibleCapture: false,
              isPossibleMove: false
            },
            { nRow: 2, nCol: 3,  
              bHasBlackChip: false,
              bHasBlackKing: false, 
              bHasWhiteChip: false,
              bHasWhiteKing: false,
              isHighlighted: false,
              isPossibleCapture: false,
              isPossibleMove: false
            }
          ],
          [
            { nRow: 3, nCol: 1, 
              bHasBlackChip: false,
              bHasBlackKing: false, 
              bHasWhiteChip: false,
              bHasWhiteKing: false,
              isHighlighted: false,
              isPossibleCapture: false,
              isPossibleMove: false
            },
            { nRow: 3, nCol: 2, 
              bHasBlackChip: false,
              bHasBlackKing: false, 
              bHasWhiteChip: false,
              bHasWhiteKing: false,
              isHighlighted: false,
              isPossibleCapture: false,
              isPossibleMove: false
            },
            { nRow: 3, nCol: 3, 
              bHasBlackChip: false,
              bHasBlackKing: false, 
              bHasWhiteChip: true,
              bHasWhiteKing: false,
              isHighlighted: false,
              isPossibleCapture: false,
              isPossibleMove: false
            }
          ]
        ]

        /**
         * Ending position looks like this:
         * _ _ o
         * _ x _
         * _ _ _
         */

        // Act
        let coords = { nRow: 1, nCol: 1, nDestRow: 3, nDestCol: 3 }
        Cells.mutations.mCapturePiece(state, coords)

        // Assert
        expect(state.cells).toStrictEqual(expected)
        expect(state.firstClick).toBe(null)
    }),

    it('Replaces the board with a deep copy of the updated board which \
      contains the new position of a black chip', () => {
      // Arrange
      const board = getBoard()
      board[2][2] = {
        nRow: 3,
        nCol: 3, 
        bHasBlackChip: true, 
        bHasWhiteChip: false,
        bHasBlackKing: false,
        bHasWhiteKing: false
      }
      board[1][1] = {
        nRow: 2, 
        nCol: 2, 
        bHasBlackChip: false, 
        bHasWhiteChip: true,
        bHasBlackKing: false,
        bHasWhiteKing: false
      }

      /**
       * Starting position looks like this:
       * _ _ b
       * _ w _
       * _ _ _
       */

      const state = {
        cells: board,
        firstClick: {row: 2, col: 2}
      }

      const expected = [
        [
          { nRow: 1, nCol: 1,  
            bHasBlackChip: true,
            bHasBlackKing: true, 
            bHasWhiteChip: false,
            bHasWhiteKing: false 
          },
          { nRow: 1, nCol: 2, 
            bHasBlackChip: false,
            bHasBlackKing: false, 
            bHasWhiteChip: false,
            bHasWhiteKing: false 
          },
          { nRow: 1, nCol: 3, 
            bHasBlackChip: false,
            bHasBlackKing: false, 
            bHasWhiteChip: false,
            bHasWhiteKing: false 
          }
        ],
        [
          { nRow: 2, nCol: 1,  
            bHasBlackChip: false,
            bHasBlackKing: false, 
            bHasWhiteChip: false,
            bHasWhiteKing: false 
          },
          { nRow: 2, nCol: 2,  
            bHasBlackChip: false,
            bHasBlackKing: false, 
            bHasWhiteChip: false,
            bHasWhiteKing: false 
          },
          { nRow: 2, nCol: 3,  
            bHasBlackChip: false,
            bHasBlackKing: false, 
            bHasWhiteChip: false,
            bHasWhiteKing: false  
          }
        ],
        [
          { nRow: 3, nCol: 1, 
            bHasBlackChip: false,
            bHasBlackKing: false, 
            bHasWhiteChip: false,
            bHasWhiteKing: false 
          },
          { nRow: 3, nCol: 2, 
            bHasBlackChip: false,
            bHasBlackKing: false, 
            bHasWhiteChip: false,
            bHasWhiteKing: false 
          },
          { nRow: 3, nCol: 3, 
            bHasBlackChip: false,
            bHasBlackKing: false, 
            bHasWhiteChip: false,
            bHasWhiteKing: false 
          }
        ]
      ]

      /**
       * Ending position looks like this:
       * _ _ _
       * _ w _
       * b _ _
       */

      // Act
      let coords = { nRow: 3, nCol: 3, nDestRow: 1, nDestCol: 1 }
      Cells.mutations.mCapturePiece(state, coords)

      // Assert
      expect(state.cells).toMatchObject(expected)
      expect(state.firstClick).toBe(null)
    })
  })
})