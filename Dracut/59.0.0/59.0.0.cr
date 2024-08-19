class Target < ISM::Software
    
    def configure
        super

        configureSource(arguments:  "--prefix=/usr          \
                                    --sysconfdir=/etc       \
                                    --disable-documentation \
                                    --systemdsystemunitdir=no",
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

        deleteDirectory("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}no")

        dracutconfData = <<-CODE
        hostonly="yes"
        install_items+=" /lib/elogind/elogind-uaccess-command /usr/lib/libgcc_s.so.1 "
        CODE
        fileWriteData("#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}/etc/dracut.conf",dracutconfData)
    end

end
