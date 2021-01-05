const getEmptyBoard = () => {
  const board = new Array(8).fill(null).map(() => Array(8))
  for (let r = 0; r < 8; r++) {
    for (let c = 0; c < 8; c++) {
      // initialize empty cell
      const cell = {
        nRow: r + 1, // nRow number 1-8, 1 is bottom
        nCol: c + 1, // column number 1-8, 1 is leftmost
        bHasBlackChip: false, // boolean
        bHasWhiteChip: false, // boolean
        bHasBlackKing: false, // boolean
        bHasWhiteKing: false, // boolean,
        isHighlighted: false,
        isPossibleMove: false,
        isPossibleCapture: false
      }

      board[r][c] = cell
    }
  }

  return board
}

const placePieces = (board, squares, pieceColor, playerIsBlack) => {
  for (let squareString of squares) {
    let cell = {
      nRow: 0,              // nRow number 1-8, 1 is bottom
      nCol: 0,              // column number 1-8, 1 is leftmost
      bHasBlackChip: false, // boolean
      bHasWhiteChip: false, // boolean
      bHasBlackKing: false, // boolean
      bHasWhiteKing: false, // boolean
      isHighlighted: false,
      isPossibleMove: false,
      isPossibleCapture: false
    }

    // Check if the square contains a king
    if (squareString.charAt(0) === 'K') {
      squareString = squareString.replace('K', '')
      cell = (pieceColor === 'w') ? 
        { ...cell, bHasWhiteKing: true } : 
        { ...cell, bHasBlackKing: true }
    } 

    // Set the square properties
    const square = playerIsBlack ? 
      65 - Number(squareString) : // Reversed if the player is playing black 
      Number(squareString)

    const row = Math.floor((square - 1) / 8) + 1
    const col = ((square - 1) % 8) + 1
    cell = (pieceColor === 'w') ? 
      { ...cell, nRow: row, nCol: col, bHasWhiteChip: true } :
      { ...cell, nRow: row, nCol: col, bHasBlackChip: true }

    // Place the square in the board
    board[row-1][col-1] = cell
  }
}

/**
 * PDN Grammar: 
 * S -> [FEN "[Turn]:[Color][K][Square],[K][Square]...]:[Color][K][Square], [K][Square]...]"]
 * [Color] -> 'B' | 'W'
 * [K] -> 'K' | ''
 * [Square] -> (1 - 64)
 * @param pdn the board state in Portable Draughts Notation from white's perspective
 */
export const getBoardFromPDN = (pdn, playerIsBlack) => {
  // Trim PDN string
  pdn = pdn.substring(1, pdn.length - 2)

  const board = getEmptyBoard()
  let sections = pdn.split(':')
  let white
  let black
  const turn = sections[0][sections[0].length - 1]

  // If contains start, white, and black
  // White
  if (sections.length === 3) {
    white = sections[1]
      .replace('W', '')
      .split(',')
    placePieces(board, white, 'w', playerIsBlack)

    // Black 
    black = sections[2]
      .replace('B', '')
      .replace('"]', '')
      .split(',')
    placePieces(board, black, 'b', playerIsBlack)
  } else {
    let color = sections[1].charAt(0)
    if (color === 'W') {
      white = sections[1]
        .replace('W', '')
        .split(',')
      placePieces(board, white, 'w', playerIsBlack)
    } else {
      black = sections[1]
        .replace('B', '')
        .replace('"]', '')
        .split(',')
      placePieces(board, black, 'b', playerIsBlack)
    }
  }
  return board
}

/**
 * Returns a PDN string from an unpacked board instance.
 * The PDN string is viewed from white's perspective
 * @param board the unpacked board instance 
 * @param turn the current player to move (dummy)
 */
export const getPDNFromBoard = (board, turn, isPlayerBlack) => {
  let res = `[FEN "${turn}:`
  let white = ''
  let black = ''

  // Fill in the piece values
  for (let r = 0; r < 8; r++) {
    for (let c = 0; c < 8; c++) {
      let square = isPlayerBlack ? 
        65 - (8*r + c + 1) : 
        8*r + c + 1
        
      if (board[r][c].bHasWhiteChip) {
        if (board[r][c].bHasWhiteKing) {
          white = white.concat(`K${square},`)
        } else {
          white = white.concat(`${square},`)
        }
      } else if (board[r][c].bHasBlackChip) {
        if (board[r][c].bHasBlackKing) {
          black = black.concat(`K${square},`)
        } else {
          black = black.concat(`${square},`)
        }
      }
    }
  }

  // Create the string from the arrays
  if (white.length > 0) {
    res = res.concat(`W${white}`)
  }
  
  if (black.length > 0) {
    res = res.slice(0, res.length-1).concat(`:B${black}`)
  }

  res = res.slice(0, res.length-1).concat(`"]`)
  return res
}


// Tests:
// Starting position:   [FEN "O:W1,3,5,7,10,12,14,16,17,19,21,23:B42,44,46,48,49,51,53,55,56,58,60,62,64"]
// With 2 Kings:        [FEN "O:WK1:BK42"]
// White piece:         [FEN "O:W1"]
// Black piece:         [FEN "O:B7"]
// White king:          [FEN "O:WK3"]
// Black king:          [FEN "O:BK1"]
// Captures:            [FEN "O:W1,55:B10,64"]