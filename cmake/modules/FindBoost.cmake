# Find the Boost includes and library

IF (BOOST_INCLUDE_DIR AND BOOST_LIBRARIES)
    # Already in cache, be silent
    SET(BOOST_FIND_QUIETLY TRUE)
ENDIF (BOOST_INCLUDE_DIR AND BOOST_LIBRARIES)

FIND_PATH(BOOST_INCLUDE_DIR boost/config.hpp
        ${PROJECT_SOURCE_DIR}/../third-lib/boost/include
        /usr/include
        /usr/local/include
        )

FIND_LIBRARY(BOOST_REGEX_LIBRARY NAMES boost_regex PATHS
        ${BOOST_INCLUDE_DIR}/../lib
        /usr/lib
        /usr/local/lib
        )

FIND_LIBRARY(BOOST_SYSTEM_LIBRARY NAMES boost_system PATHS
        ${BOOST_INCLUDE_DIR}/../lib
        /usr/lib
        /usr/local/lib
        )

SET(BOOST_LIBRARIES ${BOOST_REGEX_LIBRARY} ${BOOST_SYSTEM_LIBRARY} CACHE STRING "The libraries needed to use Boost")

IF (BOOST_INCLUDE_DIR AND BOOST_LIBRARIES)
    SET(BOOST_FOUND TRUE)
ENDIF (BOOST_INCLUDE_DIR AND BOOST_LIBRARIES)

IF (BOOST_FOUND)
    MESSAGE(STATUS "Found BOOST INCLUDE: ${BOOST_INCLUDE_DIR}")
    MESSAGE(STATUS "Found BOOST LIBRARY: ${BOOST_LIBRARIES}")
    INCLUDE_DIRECTORIES(${BOOST_INCLUDE_DIR})
ELSE (BOOST_FOUND)
    IF (BOOST_FIND_REQUIRED)
        MESSAGE(FATAL_ERROR "Could NOT find Boost")
    ELSE (BOOST_FIND_REQUIRED)
        MESSAGE(STATUS "Could NOT find Boost")
    ENDIF (BOOST_FIND_REQUIRED)
ENDIF (BOOST_FOUND)
