<g:select id="category"
          name="category.id"
          from="${categories}"
          optionValue="name"
          optionKey="id"
          required=""
          value="${selectedCategory?.id}"
          class="many-to-one form-control"
          noSelection="['':'Please choose subcategory']"/>