# - Try to find the Boost library.

IF (BOOST_INCLUDE_DIR AND BOOST_LIBRARIES)
    # Already in cache, be silent
    SET(BOOST_FIND_QUIETLY TRUE)
ENDIF (BOOST_INCLUDE_DIR AND BOOST_LIBRARIES)

FIND_PATH(BOOST_INCLUDE_DIR boost/config.hpp
    /usr/include
    /usr/local/include
)

FIND_LIBRARY(BOOST_REGEX_LIBRARY NAMES boost_regex PATHS
    /usr/lib
    /usr/local/lib
)

FIND_LIBRARY(BOOST_SYSTEM_LIBRARY NAMES boost_system PATHS
    /usr/lib
    /usr/local/lib
)

SET(BOOST_LIBRARIES ${BOOST_REGEX_LIBRARY} ${BOOST_SYSTEM_LIBRARY} CACHE STRING "The libraries needed to use Boost")

IF (BOOST_INCLUDE_DIR AND BOOST_LIBRARIES)
    SET(BOOST_FOUND TRUE)
ENDIF (BOOST_INCLUDE_DIR AND BOOST_LIBRARIES)

IF (BOOST_FOUND)
    IF (NOT BOOST_FIND_QUIETLY)
        MESSAGE(STATUS "Found BOOST: ${BOOST_LIBRARIES}")
    ENDIF (NOT BOOST_FIND_QUIETLY)
ELSE (BOOST_FOUND)
    IF (BOOST_FIND_REQUIRED)
        MESSAGE(FATAL_ERROR "Could NOT find Boost")
    ELSE (BOOST_FIND_REQUIRED)
        MESSAGE(STATUS "Could NOT find Boost")
    ENDIF (BOOST_FIND_REQUIRED)
ENDIF (BOOST_FOUND)

MARK_AS_ADVANCED(BOOST_INCLUDE_DIR BOOST_LIBRARIES BOOST_REGEX_LIBRARY)