const getters = {
  getCurrentGame: state => state.currentGameID,
  getTimer: state => state.timerID,
  getHostUser: state => state.hostUser,
  getOtherUser: state => state.otherUser,
  getEnemyUsername: state => state.enemyUsername,
  getHostTimeLeft: state => state.hostTimeLeft,
  getOtherTimeLeft: state => state.otherTimeLeft,
  getIsHostWhite: state => state.isHostWhite,
  getCurrentTimer: state => state.currentTimerID
}

export default getters
