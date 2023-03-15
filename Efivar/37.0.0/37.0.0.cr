class Target < ISM::Software

    def build
        super
        makeSource([Ism.settings.makeOptions],buildDirectoryPath,{"CFLAGS" => "-O2 -Wno-stringop-truncation"})
    end
    
    def prepareInstallation
        super
        makeSource([Ism.settings.makeOptions,"DESTDIR=#{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath}","install", "LIBDIR=/usr/lib"],buildDirectoryPath)
    end

end
