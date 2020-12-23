# Diamoneum

set(Diamoneum_CMAKE_ARGS
    -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    -DBUILD_ALL:BOOL=FALSE) # Only libraries are required!

if(CMAKE_TOOLCHAIN_FILE)
    list(INSERT Diamoneum_CMAKE_ARGS 0 -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE})
endif()

if(NOT WIN32)
    list(INSERT Diamoneum_CMAKE_ARGS 0 -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE})
endif()

ExternalProject_Add(Diamoneum
    GIT_REPOSITORY https://github.com/Diamoneum/Diamoneum.git
    GIT_TAG master
    GIT_SHALLOW ON
    GIT_PROGRESS OFF

    UPDATE_COMMAND ""
    PATCH_COMMAND ""

    CMAKE_ARGS ${Diamoneum_CMAKE_ARGS}

    # CONFIGURE_COMMAND (use default)
    BUILD_COMMAND ${CMAKE_COMMAND} --build . --config ${CMAKE_BUILD_TYPE} --target DiamoneumFramework
    BUILD_ALWAYS FALSE
    TEST_COMMAND ""
    INSTALL_COMMAND ""
)

ExternalProject_Get_property(Diamoneum SOURCE_DIR)
ExternalProject_Get_property(Diamoneum BINARY_DIR)

set(DiamoneumFramework_INCLUDE_DIRS
    "${SOURCE_DIR}/include"
    "${SOURCE_DIR}/lib"
    "${BINARY_DIR}/lib"
    "${BINARY_DIR}/_ExternalProjects/Install/sparsehash/include"
    "${SOURCE_DIR}/src" # Temporary hack-ish solution for <config/*> includes.
)
if(MSVC)
    list(APPEND DiamoneumFramework_INCLUDE_DIRS "${SOURCE_DIR}/lib/Platform/Windows")
    list(APPEND DiamoneumFramework_INCLUDE_DIRS "${SOURCE_DIR}/lib/Platform/msc")
elseif(APPLE)
    list(APPEND DiamoneumFramework_INCLUDE_DIRS "${SOURCE_DIR}/lib/Platform/OSX")
    list(APPEND DiamoneumFramework_INCLUDE_DIRS "${SOURCE_DIR}/lib/Platform/Posix")
elseif(ANDROID)
    list(APPEND DiamoneumFramework_INCLUDE_DIRS "${SOURCE_DIR}/lib/Platform/Android")
    list(APPEND DiamoneumFramework_INCLUDE_DIRS "${SOURCE_DIR}/lib/Platform/Posix")
else()
    list(APPEND DiamoneumFramework_INCLUDE_DIRS "${SOURCE_DIR}/lib/Platform/Linux")
    list(APPEND DiamoneumFramework_INCLUDE_DIRS "${SOURCE_DIR}/lib/Platform/Posix")
endif()

set(DiamoneumFramework_LIBS
    BlockchainExplorer
    Common
    Crypto
    CryptoNoteCore
    CryptoNoteProtocol
    Http
    InProcessNode
    JsonRpcServer
    Logging
    Mnemonics
    NodeRpcProxy
    P2p
    PaymentGate
    Rpc
    Serialization
    System
    Transfers
    Wallet
)

mark_as_advanced(DiamoneumFramework_INCLUDE_DIRS DiamoneumFramework_LIBS)

foreach(LIB ${DiamoneumFramework_LIBS})
    set(LIB_IMPORTED_LOCATION_KEY "RELEASE")
    set(LIB_SUFFIX "")
    if (CMAKE_BUILD_TYPE STREQUAL "Debug")
        set(LIB_IMPORTED_LOCATION_KEY "DEBUG")
        set(LIB_SUFFIX "d")
    endif()

    set(${LIB}_filename "${CMAKE_STATIC_LIBRARY_PREFIX}DiamoneumFramework_${LIB}${LIB_SUFFIX}${CMAKE_STATIC_LIBRARY_SUFFIX}")
    if(WIN32)
        set(${LIB}_library "${BINARY_DIR}/lib/${CMAKE_BUILD_TYPE}/${${LIB}_filename}")
    else()
        set(${LIB}_library "${BINARY_DIR}/lib/${${LIB}_filename}")
    endif()

    add_library(DiamoneumFramework::${LIB} UNKNOWN IMPORTED GLOBAL)
    set_target_properties(DiamoneumFramework::${LIB} PROPERTIES
        IMPORTED_CONFIGURATIONS ${CMAKE_BUILD_TYPE}
        IMPORTED_LOCATION_${LIB_IMPORTED_LOCATION_KEY} ${${LIB}_library}
    )
    add_dependencies(DiamoneumFramework::${LIB} Diamoneum)
endforeach()

# DiamoneumFramework::Common
target_link_libraries(DiamoneumFramework::Common INTERFACE
    Threads::Threads
    DiamoneumFramework::Crypto
)
if(UNIX AND NOT ANDROID)
    target_link_libraries(DiamoneumFramework::Common INTERFACE -lresolv)
endif()

# DiamoneumFramework::CryptoNoteCore
target_link_libraries(DiamoneumFramework::CryptoNoteCore INTERFACE
    Boost::filesystem
    Boost::program_options
    DiamoneumFramework::BlockchainExplorer
    DiamoneumFramework::Common
    DiamoneumFramework::Crypto
    DiamoneumFramework::Logging
    DiamoneumFramework::Serialization
)

# DiamoneumFramework::InProcessNode
target_link_libraries(DiamoneumFramework::InProcessNode INTERFACE
    DiamoneumFramework::BlockchainExplorer
)

# DiamoneumFramework::NodeRpcProxy
target_link_libraries(DiamoneumFramework::NodeRpcProxy INTERFACE
    DiamoneumFramework::System
)

# DiamoneumFramework::P2p
target_link_libraries(DiamoneumFramework::P2p INTERFACE
    MiniUPnP::miniupnpc
    DiamoneumFramework::CryptoNoteProtocol
)

if(WIN32 AND MSVC)
    target_link_libraries(DiamoneumFramework::P2p INTERFACE Bcrypt)
endif()

# DiamoneumFramework::PaymentGate
target_link_libraries(DiamoneumFramework::PaymentGate INTERFACE
    DiamoneumFramework::JsonRpcServer
    DiamoneumFramework::NodeRpcProxy
    DiamoneumFramework::System
    DiamoneumFramework::Wallet
)

# DiamoneumFramework::Rpc
target_link_libraries(DiamoneumFramework::Rpc INTERFACE
    DiamoneumFramework::BlockchainExplorer
    DiamoneumFramework::CryptoNoteCore
    DiamoneumFramework::P2p
    DiamoneumFramework::PaymentGate
    DiamoneumFramework::Serialization
    DiamoneumFramework::System
    DiamoneumFramework::Http
)

# DiamoneumFramework::Serialization
target_link_libraries(DiamoneumFramework::Serialization INTERFACE
    DiamoneumFramework::Common
)

# DiamoneumFramework::System
if(WIN32)
    target_link_libraries(DiamoneumFramework::System INTERFACE ws2_32)
endif()

# DiamoneumFramework::Transfers
target_link_libraries(DiamoneumFramework::Transfers INTERFACE
    DiamoneumFramework::CryptoNoteCore
)

# DiamoneumFramework::Wallet
target_link_libraries(DiamoneumFramework::Wallet INTERFACE
    Boost::filesystem
    DiamoneumFramework::Common
    DiamoneumFramework::Crypto
    DiamoneumFramework::CryptoNoteCore
    DiamoneumFramework::Logging
    DiamoneumFramework::Mnemonics
    DiamoneumFramework::Rpc
    DiamoneumFramework::Transfers
)

# MiniUPnP::miniupnpc

get_filename_component(MINIUPNP_DIR "${BINARY_DIR}/_ExternalProjects/Install/MiniUPnP" ABSOLUTE CACHE)
set(MINIUPNP_INCLUDE_DIRS "${MINIUPNP_DIR}/include")
set(MINIUPNP_STATIC_LIBRARY "${MINIUPNP_DIR}/lib/libminiupnpc${CMAKE_STATIC_LIBRARY_SUFFIX}")
mark_as_advanced(MINIUPNP_DIR MINIUPNP_INCLUDE_DIRS MINIUPNP_STATIC_LIBRARY)

add_library(MiniUPnP::miniupnpc STATIC IMPORTED GLOBAL)
add_dependencies(MiniUPnP::miniupnpc MiniUPnP)
set_target_properties(MiniUPnP::miniupnpc PROPERTIES
    IMPORTED_LOCATION "${MINIUPNP_STATIC_LIBRARY}"
    INTERFACE_COMPILE_DEFINITIONS "MINIUPNP_STATICLIB"
)
if(WIN32)
    target_link_libraries(MiniUPnP::miniupnpc INTERFACE iphlpapi mswsock ws2_32)
endif()
