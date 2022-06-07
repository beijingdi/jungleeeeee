describe("Get product details", () => {
  it("should visit home", () => {
    cy.visit("/");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("can show the product page when clicked", () => {
    cy.get(".products article")
    .first()
    .click();

    cy.get(".product-detail")
    .should('exist');

  });

  

});


