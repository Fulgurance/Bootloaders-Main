class Target < ISM::Software

    def build
        super

        makeSource(["CFLAGS=-O2 -Wno-stringop-truncation"],buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeSource(["DESTDIR=#{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath}","install", "LIBDIR=/usr/lib"],buildDirectoryPath)
    end

end
