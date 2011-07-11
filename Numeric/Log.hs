{-# LANGUAGE MultiParamTypeClasses #-}
module Numeric.Log 
  ( Log(..)
  ) where

import Data.Function (on)
import Numeric.Addition
import Numeric.Module
import Numeric.Multiplication
import Numeric.Band.Class
import Numeric.Natural.Internal

import Prelude hiding ((*),(^),(/),recip,negate,subtract)

newtype Log r = Log { runLog :: r } 


instance Multiplicative r => Additive (Log r) where
  Log a + Log b = Log (a * b)
  sumWith1 f = Log . productWith1 (runLog . f)
  replicate1p n (Log m) = Log (pow1p m n)

instance Unital r => LeftModule Natural (Log r) where
  n .* Log m = Log (pow m n)

instance Unital r => RightModule Natural (Log r) where
  Log m *. n = Log (pow m n)

instance Unital r => AdditiveMonoid (Log r) where
  zero = Log one
  replicate n (Log m) = Log (pow m n)
  sumWith f = Log . productWith (runLog . f)

instance MultiplicativeGroup r => LeftModule Integer (Log r) where
  n .* Log m = Log (m ^ n)

instance MultiplicativeGroup r => RightModule Integer (Log r) where
  Log m *. n = Log (m ^ n)

instance MultiplicativeGroup r => AdditiveGroup (Log r) where
  Log a - Log b = Log (a / b)
  negate (Log a) = Log (recip a)
  subtract (Log a) (Log b) = Log (a \\ b)
  times n (Log m) = Log (m ^ n)

instance Commutative r => Abelian (Log r)

instance Band r => Idempotent (Log r)

instance Factorable r => Partitionable (Log r) where
  partitionWith f = factorWith (f `on` Log) . runLog