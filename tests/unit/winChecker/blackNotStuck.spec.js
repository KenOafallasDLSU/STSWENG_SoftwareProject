import { checkIfPlayerStuck } from '@/store/services/winCheckerService'
import { getBoardFromPDN } from '@/store/services/boardParsingService'

describe ('Positions where black still has legal moves', () => {
  describe ('Black piece free', () => {
    it ('starting position', () => {
      // Arrange
      const pdn = `[FEN "O:W1,3,5,7,10,12,14,16,17,19,21,23:B42,44,46,48,49,51,53,55,56,58,60,62,64"]`
      const isWhite = false
      const board = getBoardFromPDN(pdn, !isWhite)
      const expected = false

      // Act
      const result = checkIfPlayerStuck(board, isWhite)

      // Assert
      expect(result).toEqual(expected)
    }),

    it ('can still make a capture', () => {
      // Arrange
      const pdn = `[FEN "O:W55:B64"]`
      const isWhite = false
      const board = getBoardFromPDN(pdn, !isWhite)
      const expected = false

      // Act
      const result = checkIfPlayerStuck(board, isWhite)

      // Assert
      expect(result).toEqual(expected)
    }),

    it ('can still make a move', () => {
      // Arrange
      const pdn = `[FEN "O:W46:B64"]`
      const isWhite = false
      const board = getBoardFromPDN(pdn, !isWhite)
      const expected = false

      // Act
      const result = checkIfPlayerStuck(board, isWhite)

      // Assert
      expect(result).toEqual(expected)
    })
  })

  describe ('Black king free', () => {
    it ('can still make a capture', () => {
      // Arrange
      const pdn = `[FEN "O:W46:BK64"]`
      const isWhite = false
      const board = getBoardFromPDN(pdn, !isWhite)
      const expected = false

      // Act
      const result = checkIfPlayerStuck(board, isWhite)

      // Assert
      expect(result).toEqual(expected)
    }),

    it ('can still make a move', () => {
      // Arrange
      const pdn = `[FEN "O:W55:BK64"]`
      const isWhite = false
      const board = getBoardFromPDN(pdn, !isWhite)
      const expected = false

      // Act
      const result = checkIfPlayerStuck(board, isWhite)

      // Assert
      expect(result).toEqual(expected)
    })
  })
})