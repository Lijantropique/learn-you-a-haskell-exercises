{-
 - For this exercise, we are dealing with a type for colours of the rainbow
 - The typeclass is defined here, and note its English spelling.
 - For more information on how this is done, look ahead to:
 - http://learnyouahaskell.com/making-our-own-types-and-typeclasses
 -
 - Have a play with the Colour in ghci, try the succ and pred functions and so on.
 -}
data Colour = Red | Orange | Yellow | Green | Blue | Indigo | Violet
    deriving (Eq, Ord, Show, Bounded, Enum)

{-
 - Again, you should be able to write these functions in one line,
 - using the information from the chapter http://learnyouahaskell.com/types-and-typeclasses
 - and the chapter before
 -}

{-
 - The Colour typeclass is of type Ord
 - What is the "first" (or least) colour
 -}
firstColour = minBound :: Colour

-- List the colours in reverse order
reverseColourOrder = reverse [Red .. Violet]
reverseColourOrder' = reverse [minBound .. maxBound] :: [Colour]

{-
 - Mix two colours together, to produce the average value of the two.
 - Example: paintMix Orange Green = Yellow
 - If necessary, favour the "higher" value when computing the average.
 - For example: paintMix Green Violet = Indigo
 - Hint: Integer division can be performed with the quot function: quot 7 2 = 3
 -}
paintMix c1 c2 = lstC !! (quot (idx c1 lstC + idx c2 lstC) 2)
    where
        lstC = [Red .. Violet]
        idx c lst
            |c == (head lst)   = 0
            |otherwise          = 1 + (idx c (tail lst))
paintMix' c1 c2 = [(min c1 c2) .. (max c1 c2)]!!(quot (length[(min c1 c2) .. (max c1 c2)]) 2)