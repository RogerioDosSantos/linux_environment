cindex.py
- - - - - - - - - - - - 

Work around clag messing up vim output

Se article: https://github.com/Rip-Rip/clang_complete/issues/453

Change applied:

diff --git a/plugin/clang/cindex.py b/plugin/clang/cindex.py
index eb05560..bfeb58d 100644
--- a/plugin/clang/cindex.py
+++ b/plugin/clang/cindex.py
@@ -1991,6 +1991,7 @@ class TranslationUnit(ClangObject):
         if args is None:
             args = []

+        args.append('-fno-color-diagnostics')
         if unsaved_files is None:
             unsaved_files = []
