require_relative '../spec_helper'

module ExchangeRate
  describe Store do
    describe '#initialize' do
      before do
        @file_store = Tempfile.new('pstore')
        @store = Store.new(@file_store.path)
      end
      it 'sets the file store path' do
        assert @store.file == @file_store.path
      end

      it 'creates a PStore object to store data' do
        assert @store.data.is_a? PStore
      end
    end

    describe '#update rates' do
      before do
        tmp_file = Tempfile.new('pstore')
        @store = Store.new(tmp_file.path)
        @store.update_rates({:foo => :bar})
      end

      it 'sets data' do
        assert @store.data.transaction(true) { @store.data[:foo] } == :bar
      end

      it 'overwrites existing data' do
        @store.update_rates({:foo => :baz})
        assert @store.data.transaction(true) { @store.data[:foo] } == :baz
      end

      it "doesn't delete existing data" do
        @store.update_rates({:baz => :foo})
        assert @store.data.transaction(true) { @store.data[:foo] } == :bar
      end
    end

    describe '#get_rates' do
      before do
        @file_store = Tempfile.new('pstore')
        @store = Store.new(@file_store.path)
        @store.update_rates(rate_data)
      end

      it 'gets correct rate for a specified date' do
        assert @store.get_rate('2013-10-08', 'CZK') == 25.518
      end
    end

    def rate_data
      {
        "2013-10-09" => [
          {:currency => "CZK", :rate => 25.598},
          {:currency => "DKK ", :rate => 7.4595}
        ],
        "2013-10-08" => [
          {:currency => "CZK", :rate => 25.518},
          {:currency => "DKK ", :rate => 7.4599}
        ]
      }
    end

  end
end
