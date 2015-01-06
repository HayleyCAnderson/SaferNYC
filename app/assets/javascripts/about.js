$(document).on("click","#about-data-nav",function(e){
  e.preventDefault();
  toggleLinks("#about-data-nav","#about-project-nav");
  toggleAboutSections("#about-data","#about-project");
});

$(document).on("click","#about-project-nav",function(e){
  e.preventDefault();
  toggleLinks("#about-project-nav","#about-data-nav");
  toggleAboutSections("#about-project","#about-data");
});

function toggleLinks(clicked,notClicked) {
  $(notClicked).removeClass("active");
  $(clicked).toggleClass("active");
};

function toggleAboutSections(clicked,notClicked) {
  $(notClicked).removeClass("about-active");
  $(clicked).toggleClass("about-active");
};
