class Target < ISM::Software
    
    def configure
        super

        configureSource([   "--prefix=/usr",
                            "--sysconfdir=/etc",
                            "--disable-documentation",
                            "--systemdsystemunitdir=no"],
                            buildDirectoryPath)
    end
    
    def build
        super

        makeSource(path: buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeSource(["DESTDIR=#{builtSoftwareDirectoryPath}#{Ism.settings.rootPath}","install"],buildDirectoryPath)

        dracutconfData = <<-CODE
        hostonly="yes"
        install_items="/lib/elogind/elogind-uaccess-command"
        CODE
        fileWriteData("#{builtSoftwareDirectoryPath(false)}#{Ism.settings.rootPath}/etc/dracut.conf",dracutconfData)
    end

end
