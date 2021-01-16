import firebase from 'firebase'
import 'firebase/auth'
import 'firebase/firestore'

const firebaseConfig = {
  apiKey: "AIzaSyA9SZagTMn8tSFeZkOQkrDmptaQLP-3c7k",
  authDomain: "check-with-me.firebaseapp.com",
  projectId: "check-with-me",
  storageBucket: "check-with-me.appspot.com",
  messagingSenderId: "910644162284",
  appId: "1:910644162284:web:ac3990fc338d8863593fc9"
}

firebase.initializeApp(firebaseConfig)

// Utilities
const db = firebase.firestore()
const auth = firebase.auth()

// To be used in the Vue Router
firebase.getCurrentUser = () => {
  return new Promise((resolve, reject) => {
    const unsubscribe = firebase.auth().onAuthStateChanged(user => {
      unsubscribe();
      resolve(user);
    }, reject)
  })
}

// Collections
const usersCollection = db.collection('users')
const gamesCollection = db.collection('games')
<<<<<<< HEAD
const timersCollection = db.collection('timers')
=======
const movesCollection = db.collection('moves')
const timersCollection = db.collection('timers')

gamesCollection.doc("2gSaU2SjJeUpHEEbXPyX")
  .onSnapshot(doc => {
      // const boardState = doc.data().boardState
      // console.log(boardState)
      // store.dispatch('aUpdateBoard', boardState);
  });
>>>>>>> a043ed3311ad637513a9acaed19bf5f367d002b4

export {
  db,
  auth,
  usersCollection,
  gamesCollection,
  timersCollection,
  chatsCollection
}