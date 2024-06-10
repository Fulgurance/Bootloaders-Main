class Target < ISM::Software

    def prepare
        super

        fileReplaceTextAtLineNumber("#{buildDirectoryPath}src/Makefile","\n","\ttouch prep\n",87)
    end

    def build
        super

        makeSource(["ERRORS="],buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeSource(["DESTDIR=#{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath}","install", "LIBDIR=/usr/lib"],buildDirectoryPath)
    end

end
