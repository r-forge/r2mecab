# this file should be under src folder #

if (WINDOWS) {
  files <- Sys.glob(paste("*", SHLIB_EXT, sep=''))
   cat ("files = ", files, "\n")
  libarch <- if (nzchar(R_ARCH)) paste('libs', R_ARCH, sep='') else 'libs'
  
   cat ("R_ARCH = ", R_ARCH, "\n")
   cat ("libarch = ", libarch, "\n")

  dest <- file.path(R_PACKAGE_DIR, libarch)
  dest32 <- file.path(R_PACKAGE_DIR, "libs/i386")
   cat ("dest32 = ", dest32, "\n")

  dest64 <- file.path(R_PACKAGE_DIR, "libs/x64")
   cat ("dest64 = ", dest64, "\n")
  
  dir.create(dest, recursive = TRUE, showWarnings = FALSE)
  file.copy(files, dest, overwrite = TRUE)

 dir.create(dest64, recursive = TRUE, showWarnings = FALSE)
  file.copy(files, dest64, overwrite = TRUE)

  if (file.exists ("../inst/libmecab.dll")) 
    cat ("###################found libmecab.dll\n") else cat("##################no libmecab.dll\n")

  if (file.exists ("../inst/libmecab64.dll")) {
    file.copy  ("../inst/libmecab64.dll", paste (dest64, "libmecab.dll", sep = "/") )
    # file.remove ("../inst/libmecab64.dll")
  }
  if (file.exists ("../inst/libmecab.dll") ) {
     file.copy  ("../inst/libmecab.dll", paste (dest, "libmecab.dll", sep = "/") )
      # file.remove ("../inst/libmecab.dll")
  }
} else{
  files <- Sys.glob(paste("*", SHLIB_EXT, sep=''))
  libarch <- if (nzchar(R_ARCH)) paste('libs', R_ARCH, sep='') else 'libs'
  dest <- file.path(R_PACKAGE_DIR, libarch)
  dir.create(dest, recursive = TRUE, showWarnings = FALSE)
  file.copy(files, dest, overwrite = TRUE)
}



# if (R_ARCH == "/i386" ) file.remove("libs/i386/libmecab.dll")
