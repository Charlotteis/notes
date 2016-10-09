-- Starman: a guessing game
-- Player guesses a letter each turn. If the guess is correct, the letters
-- are displayed in th correct place within the word. If the guess is
-- incorrect, the player loses a star.
-- Game over: Lose all Stars
-- Game won: Guess all letters in the word

import System.Random

starman :: Int -> IO ()
starman n = do
  let wordList = ["cheese", "chocolate", "eggs"]
  rand <- getStdRandom (randomR (0, 2))
  let word = wordList !! rand
  turn word ['-' | x <- word] n

check :: String -> String -> Char -> (Bool, String)
check word display c
  = (c `elem` word, [if x==c then c else y| (x, y) <- zip word display])

turn :: String -> String -> Int -> IO ()
turn word display n =
  do {
    if n==0
      then putStrLn "You lose"
      else if word==display
        then putStrLn "You win!"
        else mkguess word display n
  }

mkguess :: String -> String -> Int -> IO ()
mkguess word display n =
  do putStrLn (display ++ " " ++ take n (repeat '*'))
     putStr " Enter your guess: "
     guess <- getLine
     let (correct, display') = check word display (head guess)
     let n' = if correct then n else n-1
     turn word display' n'
