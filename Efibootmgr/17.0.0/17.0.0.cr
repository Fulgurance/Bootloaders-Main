class Target < ISM::Software

    def prepare
        super

        fileDeleteLine("#{buildDirectoryPath(false)}src/efibootmgr.c",1541)
    end

    def build
        super

        makeSource(["EFIDIR=#{Ism.settings.systemName}","EFI_LOADER=grubx64.efi"],buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeSource(["DESTDIR=#{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath}","install", "EFIDIR=#{Ism.settings.systemName}"],buildDirectoryPath)
    end

end
