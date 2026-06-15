import streamlit as st


# Page configuration
st.set_page_config(
    page_title="MiniStore",
    page_icon="🛒",
    layout="wide"
)


# Custom CSS
st.markdown("""
<style>

.stApp {
    background-color: #f5f7fb;
}

.title {
    text-align:center;
    font-size:45px;
    font-weight:bold;
    color:#222;
}

.subtitle {
    text-align:center;
    font-size:20px;
    color:#555;
}


.product-card {

    background:white;
    padding:20px;
    border-radius:15px;
    box-shadow:0px 4px 10px rgba(0,0,0,0.1);

}

.product-name {

    font-size:22px;
    font-weight:bold;

}

.price {

    color:green;
    font-size:20px;
    font-weight:bold;

}

.category {

    color:blue;

}

</style>
""", unsafe_allow_html=True)



# Product data

products = [

    {
        "name":"Wireless Headphones",
        "price":2999,
        "category":"Electronics",
        "description":"Noise cancelling headphones with premium sound."
    },

    {
        "name":"Smart Watch",
        "price":4999,
        "category":"Electronics",
        "description":"Fitness tracking smartwatch with notifications."
    },

    {
        "name":"Cotton Hoodie",
        "price":1499,
        "category":"Fashion",
        "description":"Comfortable casual hoodie."
    },

    {
        "name":"Running Shoes",
        "price":3499,
        "category":"Fashion",
        "description":"Lightweight shoes for daily workouts."
    },

    {
        "name":"Coffee Maker",
        "price":5999,
        "category":"Home",
        "description":"Automatic coffee machine."
    },

    {
        "name":"Laptop Backpack",
        "price":1999,
        "category":"Accessories",
        "description":"Water resistant laptop backpack."
    }

]



# Sidebar

st.sidebar.title("🛒 MiniStore")


categories = ["All"]

for product in products:

    if product["category"] not in categories:
        categories.append(product["category"])



selected = st.sidebar.selectbox(
    "Choose Category",
    categories
)


st.sidebar.divider()

st.sidebar.subheader("Cart Summary")

st.sidebar.write("Items: 2")
st.sidebar.write("Total: ₹4498")



# Homepage

st.markdown(
    "<div class='title'>🛒 MiniStore</div>",
    unsafe_allow_html=True
)


st.markdown(
    "<div class='subtitle'>Welcome to MiniStore - Quality products at great prices</div>",
    unsafe_allow_html=True
)



st.header("⭐ Featured Products")



# Filter products

if selected == "All":

    display_products = products

else:

    display_products = [

        p for p in products 
        if p["category"] == selected

    ]



# Product cards

cols = st.columns(3)


for i, product in enumerate(display_products):

    with cols[i % 3]:

        st.markdown(
            f"""

            <div class="product-card">

            <div class="product-name">
            {product['name']}
            </div>

            <br>

            <div class="category">
            {product['category']}
            </div>

            <br>

            <div class="price">
            ₹{product['price']}
            </div>

            <p>
            {product['description']}
            </p>


            </div>

            """,
            unsafe_allow_html=True
        )


        st.button(
            "Add to Cart",
            key=i
        )



st.divider()

st.write("© 2026 MiniStore Demo Website")