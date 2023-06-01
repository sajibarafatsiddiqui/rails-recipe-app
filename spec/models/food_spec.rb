RSpec.describe Food type: :model do
    @food = Food.create(name: 'Apple', measurement: 10, price: 5)

    it 'Should belong to Recipe' do
        f = Recipe.reflect_on_association(:food)
        expect(f.macro).to eq(:has_many)
    end

    it 'Should belong to Inventory' do
        f = Inventory.reflect_on_association(:food)
        expect(f.macro).to eq(:has_many)
    end

    it 'Name should not be nill' do
        expect(@food.name).to eq('Apple')
    end

    it 'Name value should be string' do
        @food.name = 3
        expect(@food.name).to not_eq('Apple')
    end

    it 'Measurement unit should not be nil' do
        expect(@food.measurement).to eq(10)
    end

    it 'Measurement unit should be a number' do
        @food.measurement = 'lalala'
        expect(@food.measurement).to not_eq(10)
    end

    it 'Price should not be null' do
        expect(@food.price).to eq(5)
    end

    it 'Price should be a number' do
        @food.price = 'free'
        expect(@food.price).to not_eq(5)
    end
end