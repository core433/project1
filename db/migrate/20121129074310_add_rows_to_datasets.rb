class AddRowsToDatasets < ActiveRecord::Migration
  def change
  	# a single array holding all data values in the dataset
  	# handles as a serialized array
  	add_column :datasets, :rows, :text
  	# we can index into any particular row/column if we have
  	# 1. the number of rows (num_rows)
  	# 2. the length of each row (row_length)
  	# Note that datasets can have row lengths that are not uniform
  	# we handle this by picking the longest row as row_length and
  	# filling in any missing cells with a special marker for
  	# nil data.

  	add_column :datasets, :num_rows, :integer
  	add_column :datasets, :row_length, :integer
  end
end
