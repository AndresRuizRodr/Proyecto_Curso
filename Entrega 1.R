install.packages("usethis")

usethis::use_git_config(user.name = "AndresRuiz",
                        user.mail = "Andres.ruiz@umag.cl")


usethis::use_git_config(user.name = "Andresruizrodr", 
                        user.email = "andres.ruiz@umag.cl")


usethis::use_git()

usethis::use_github()

usethis::git_sitrep()


######

renv::init()
