# -------------------------------------------------------------------
# Project file for the QtWebKit QML plugin
#
# See 'Tools/qmake/README' for an overview of the build system
# -------------------------------------------------------------------

TEMPLATE = lib
TARGET  = qmlwebkitplugin

TARGET.module_name = QtWebKit

CONFIG += plugin

cpqmldir.files = $${_PRO_FILE_PWD_}/qmldir
cpqmldir.path = $${ROOT_BUILD_DIR}/imports/$${TARGET.module_name}
COPIES += cpqmldir

contains(QT_CONFIG, reduce_exports):CONFIG += hide_symbols

wince*:LIBS += $$QMAKE_LIBS_GUI

QT += webkit webkit-private quick quick-private

WEBKIT += wtf

DESTDIR = $${ROOT_BUILD_DIR}/imports/$${TARGET.module_name}

CONFIG += rpath
RPATHDIR_RELATIVE_TO_DESTDIR = ../../lib

SOURCES += plugin.cpp

build?(webkit2): {
    DEFINES += HAVE_WEBKIT2
    QT += network
}


importPath = $$[QT_INSTALL_QML]
isEmpty(importPath){
    importPath = $$[QT_INSTALL_IMPORTS]
} else {
    target.path = $${importPath}/$${TARGET.module_name}
    INSTALLS += target
}

qmldir.files += $$PWD/qmldir $$PWD/plugins.qmltypes
qmldir.path +=  $${importPath}/$${TARGET.module_name}

INSTALLS += qmldir
