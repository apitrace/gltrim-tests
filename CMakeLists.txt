
MACRO(TRACE_TEST name frame orig_img)
  
  ADD_TEST(NAME ${name}-${frame} COMMAND
    /bin/bash ${CMAKE_CURRENT_SOURCE_DIR}/compare-trace.sh
    ${CMAKE_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${name}.test_trace
    ${frame}
    ${orig_img})
ENDMACRO(TRACE_TEST)


TRACE_TEST(glxgears 238 6620)
TRACE_TEST(red_triangle 139 13732)
TRACE_TEST(textured_cube 145 14961)
TRACE_TEST(basic_shading 732 29443)
TRACE_TEST(transparency 289 19547)
TRACE_TEST(2dfonts 369 28885)
TRACE_TEST(normal_mapping 302 378970)
TRACE_TEST(render_to_texture 425 29227)
TRACE_TEST(rotations 68 103311)
TRACE_TEST(shadowmaps 560 42910)
TRACE_TEST(fbo-render 3 20278)
TRACE_TEST(fbo-render 50 176281)
#Disable for now
#TRACE_TEST(sauerbraten 913 1061896)

MACRO(TRACE_RTEST name frame orig_img)
  ADD_TEST(NAME ${name}_reverse COMMAND
    /bin/bash ${CMAKE_CURRENT_SOURCE_DIR}/compare-trace_reverse.sh
    ${CMAKE_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${name}.test_trace
    ${frame}
    ${orig_img})
ENDMACRO(TRACE_RTEST)

#TRACE_RTEST(red_triangle 139 13732)
#TRACE_RTEST(textured_cube 145 14961)
#TRACE_RTEST(basic_shading 732 29443)
#TRACE_RTEST(transparency 289 19547)
#TRACE_RTEST(2dfonts 369 28885)
#TRACE_RTEST(normal_mapping 302 378970)
#TRACE_RTEST(render_to_texture 425, 29227)
#TRACE_RTEST(shadowmaps 560 42910)
#TRACE_RTEST(rotations 68 103311)