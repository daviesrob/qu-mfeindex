module Qu
  module Mfeindex
    DB_JSON = '.uni'
    DB_SQLITE3 = '.sqlite3.db'
    DB_2BIT = '.2bit'
    BIG_DB = '_BIG_MFE_DB'
    BIG_DB_SPLIT_CUTOFF = 1024**3

    D2I = {
      'A' => 0, 
      'T' => 3, 
      'C' => 2, 
      'G' => 1,
    }
  end
end
