file(GLOB
    files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/*"
    files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/*.*.*.dylib")
message("${files}")

execute_process(
    COMMAND codesign -f -s- ${files}
    RESULT_VARIABLE result
    ERROR_VARIABLE stderr)

if(NOT result EQUAL 0)
    string(REPLACE "\n" "\n  " stderr "  ${stderr}")
    message(WARNING "codesign failed:\n${stderr}")
endif()