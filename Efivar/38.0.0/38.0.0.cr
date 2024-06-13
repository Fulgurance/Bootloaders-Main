class Target < ISM::Software

    def prepare
        super

        fileReplaceTextAtLineNumber(path:       "#{buildDirectoryPath}src/Makefile",
                                    text:       "\n",
                                    newText:    "\ttouch prep\n",
                                    lineNumber: 87)
    end

    def build
        super

        makeSource( arguments: "ERRORS=",
                    path:       buildDirectoryPath)
    end
    
    def prepareInstallation
        super

        makeSource( arguments:  "DESTDIR=#{builtSoftwareDirectoryPath}/#{Ism.settings.rootPath} install LIBDIR=/usr/lib",
                    path:       buildDirectoryPath)
    end

end
