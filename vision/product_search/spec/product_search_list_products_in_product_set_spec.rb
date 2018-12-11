# Copyright 2018 Google, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "spec_helper"

describe "List products in product set" do

  example "List products in product set" do

    current_directory = File.expand_path(File.dirname(__FILE__))
    snippet_filepath = File.join current_directory, "..",
                                 "product_search_list_products_in_product_set.rb"
    products = []
    2.times { products << create_temp_product }
    product_set = create_temp_product_set products
    product_set_id = get_id product_set

    output = `ruby #{snippet_filepath} #{@project_id} #{@location} #{product_set_id}`

    output_products = output.split("\n").select { |line| line.include? "projects/" }
    expect(output_products.length).to eq 2
  end

end