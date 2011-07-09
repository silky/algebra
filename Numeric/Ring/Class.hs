module Numeric.Ring.Class
  ( Ring(..)
  , fromIntegral
  ) where

import Data.Int
import Data.Word
import Numeric.Rig.Class
import Numeric.Rng.Class
import Numeric.Group.Additive
import Numeric.Monoid.Multiplicative
import qualified Prelude
import Prelude (Integral(toInteger), Integer, (.))

class (Rig r, Rng r) => Ring r where
  fromInteger :: Integer -> r
  fromInteger n = times n one

fromIntegral :: (Integral n, Ring r) => n -> r
fromIntegral = fromInteger . toInteger

instance Ring Integer where fromInteger = Prelude.fromInteger
instance Ring Int     where fromInteger = Prelude.fromInteger
instance Ring Int8    where fromInteger = Prelude.fromInteger
instance Ring Int16   where fromInteger = Prelude.fromInteger
instance Ring Int32   where fromInteger = Prelude.fromInteger
instance Ring Int64   where fromInteger = Prelude.fromInteger
instance Ring Word    where fromInteger = Prelude.fromInteger
instance Ring Word8   where fromInteger = Prelude.fromInteger
instance Ring Word16  where fromInteger = Prelude.fromInteger
instance Ring Word32  where fromInteger = Prelude.fromInteger
instance Ring Word64  where fromInteger = Prelude.fromInteger
