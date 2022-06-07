describe("Navigation", () => {
  it("should visit home", () => {
    cy.visit("/");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  // it("should navigate to Tuesday", () => {
  //   cy.visit("/");
  //   cy.contains("[data-testid=day]", "Tuesday")
  //     .click()
  //     .should("have.class","day-list__item--selected");
  // })
});