module Qu
  module Mfeindex
    DB_JSON = '.uni'
    DB_SQLITE3 = '.sqlite3.db'
    DB_2BIT = '.2bit'
    BIG_DB = '_BIG_MFE_DB'
    BIG_DB_SPLIT_CUTOFF = 1024**3

    IUPAC = {
      A: ['A'],
      T: ['T'],
      C: ['C'],
      G: ['G'],
      R: ['G', 'A'],
      Y: ['T', 'C'],
      S: ['G', 'C'],
      W: ['T', 'A'],
      K: ['G', 'T'],
      M: ['A', 'C'],
      D: ['G', 'T', 'A'],
      H: ['T', 'A', 'C'],
      B: ['G', 'T', 'C'],
      V: ['G', 'A', 'C'],
      N: ['G', 'A', 'T', 'C'],
      I: ['G', 'A', 'T', 'C'],
    }

    D2I = {
      'A' => 0, 
      'T' => 3, 
      'C' => 2, 
      'G' => 1,
    }

    NN_MM = {
      'GA' => ['GC'],
      'GG' => ['GT', 'GC'],
      'GT' => ['GC'],

      'CG' => ['CC', 'CA'],
      'CT' => ['CC', 'CA'],

      'AG' => ['AC']
    }
  end
end
