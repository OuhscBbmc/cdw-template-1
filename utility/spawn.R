# Install remotes & pluripotent if not already installed.  pluripotent won't reinstall if it's already up-to-date.
if( !requireNamespace("remotes") ) utils::install.packages("remotes")
remotes::install_github("OuhscBbmc/pluripotent")

# Discover repo name & parent directory.
project_name          <- basename(normalizePath(".."))
project_path          <- normalizePath("..")
project_parent_path   <- normalizePath("..\\..")
config_path           <- file.path(project_path, "config.yml")

# Copy remote files to the current repo.
pluripotent::start_cdw_skeleton_1(
  project_name          = project_name,
  destination_directory = project_parent_path
)

pluripotent::populate_config(
  path_in       = config_path,
  project_name  = project_name
)

# Afterwards, close RStudio and open the *.Rproj file in the root directory.
