category_trucks = ProductCategory.create(name: "Trucks", description: "The item that connects the wheels to the deck")
category_decks = ProductCategory.create(name: "Decks", description: "The item that you put your feet on")

element_deck = Product.create(
    name: "Element board", 
    description: "The one that Bam rides",
    price: 59.99,
    cost: 32.75,
    product_category: category_decks
)

blind_deck = Product.create(
    name: "Blind board", 
    description: "Reaper",
    price: 53.99,
    cost: 35.75,
    product_category: category_decks
)

tensor_trucks = Product.create(
    name: "Tensor Trucks", 
    description: "These things rip",
    price: 32.99,
    cost: 18.75,
    product_category: category_trucks
)