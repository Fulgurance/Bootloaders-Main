class Target < ISM::Software

    def build
        super

        makeSource(path: buildDirectoryPath, environment: {"CFLAGS=-O2" => "-Wno-stringop-truncation"})
    end
    
    def prepareInstallation
        super

        makeSource(["DESTDIR=#{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath}","install", "LIBDIR=/usr/lib"],buildDirectoryPath)
    end

end
