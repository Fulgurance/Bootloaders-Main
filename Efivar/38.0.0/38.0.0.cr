class Target < ISM::Software

    def build
        super

        makeSource( arguments: "ERRORS=",
                    path:       buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeSource( arguments:  "DESTDIR=#{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath} install LIBDIR=/usr/lib",
                    path:       buildDirectoryPath)
    end

end
