// Since I've currently decided to serve a static page redering the HTML with PowerShell
// This part of the code isn't needed. If I decide to change the the page, I'll still have the boilerplate written.
/*
function getProjectData() {
  return Promise.resolve(
    fetch("./resources/portfolioProject.json")
      .then((response) => response.json())
      .then((data) => {
        return data;
      })
      .catch((err) => console.log(err))
  );
}

Promise.resolve(getProjectData()).then((data) => {
  console.log(data.projectData);
  orderedData = data.projectData.sort(
    (a, b) => a.projectDisplayOrder > b.projectDisplayOrder
  );
  reactProjects = orderedData.filter((elm) => elm.projectArea === "React");
  d3Projects = orderedData.filter((elm) => elm.projectArea === "d3.js");
  htmlProjects = orderedData.filter((elm) => elm.projectArea === "HTML");
  
  console.log(reactProjects);
  console.log(d3Projects);
  console.log(htmlProjects);
});
*/

$(document).ready(function () {
  //add smooth scrolling to navbar links and footer
  $('.navbar a, footer a[href="#myPage"]').on("click", function (event) {
    if (this.hash !== "") {
      event.preventDefault();
      var hash = this.hash;
      //900 is number of milliseconds to complete animation
      $("html, body").animate(
        {
          scrollTop: $(hash).offset().top,
        },
        900,
        function () {
          //add the hash to the url after animation (default behavior that was stopped earlier)
          window.location.hash = hash;
        }
      );
    }
  });
});
