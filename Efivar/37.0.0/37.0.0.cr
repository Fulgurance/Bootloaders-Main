class Target < ISM::Software

    def build
        super
        makeSource([Ism.settings.makeOptions,"CFLAGS=\"-O2 -Wno-stringop-truncation\""],buildDirectoryPath)
    end
    
    def prepareInstallation
        super
        makeSource([Ism.settings.makeOptions,"DESTDIR=#{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath}","install", "LIBDIR=/usr/lib"],buildDirectoryPath)
    end

end
