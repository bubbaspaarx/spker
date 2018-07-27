const tabs = document.querySelectorAll(".dash-tab");
const nextBtns = document.querySelectorAll(".next-btn");
nextBtns.forEach((nextBtn) => {
  nextBtn.addEventListener("click", event => {
    tabs.forEach(tab => {
      tab.classList.remove("active");
    });
    setTimeout(() => {
      const openPanel = document.querySelector(".tab-pane.active").id;
      tabs.forEach(tab => {
        if (tab.firstChild.attributes[1].value === openPanel) {
          tab.classList.add("active");
        }
      });
    }, 100);
  });
})

