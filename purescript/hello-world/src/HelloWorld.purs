module HelloWorld where

import Data.Maybe (Maybe, fromMaybe)
import Prelude ((<>))

helloWorld :: Maybe String -> String
helloWorld maybe =
  "Hello, " <> (fromMaybe "World" maybe) <> "!"
