class Target < ISM::Software
    
    def configure
        super

        configureSource(arguments:  "--prefix=/usr                                          \
                                    --sysconfdir=/etc                                       \
                                    --disable-efiemu                                        \
                                    #{option("FreeType") ? "--enable-grub-mkfont" : ""}     \
                                    #{option("Efibootmgr") ? "--with-platform=efi" : ""}    \
                                    --disable-werror",
                        path:       buildDirectoryPath)
    end
    
    def build
        super

        makeSource(path: buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeSource( arguments:  "DESTDIR=#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath} install",
                    path:       buildDirectoryPath)

        makeDirectory("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/bash-completion/completions")

        moveFile(   "#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}etc/bash_completion.d/grub",
                    "#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}usr/share/bash-completion/completions/grub")
    end

end
