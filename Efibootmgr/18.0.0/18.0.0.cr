class Target < ISM::Software

    def build
        super

        makeSource( arguments:  "EFIDIR=\"#{Ism.settings.systemName}\" EFI_LOADER=grubx64.efi",
                    path:       buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeSource( arguments:  "DESTDIR=#{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath} install EFIDIR=#{Ism.settings.systemName}",
                    path:       buildDirectoryPath)
    end

end
