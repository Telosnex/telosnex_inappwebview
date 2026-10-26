#!/usr/bin/env python3
"""Renames flutter_inappwebview to telosnex_inappwebview in this checkout.

Run it on upstream code before merging it, so upstream changes land on the
renamed files:

    git checkout -b upstream-renamed upstream/master
    python3 tool/rename_upstream.py && git add -A && git commit -m "rename"
    git checkout master && git merge upstream-renamed

(Copy the script out of the tree first if upstream does not have it.)

Renames file paths and contents:
  Dart packages        flutter_inappwebview*        -> telosnex_inappwebview*
  Android package      com.pichillilorenzo.*        -> com.telosnex.*
  Method channels      com.pichillilorenzo/...      -> com.telosnex/...
  C, C++ and CMake     FLUTTER_INAPPWEBVIEW*, FlutterInappwebview*
  Swift packages       flutter-inappwebview-{ios,macos}
  iOS/macOS plugin     InAppWebViewFlutterPlugin   -> TelosnexInAppWebViewPlugin
                       (Objective-C class names are global: the registrant
                       of an app with both packages would not build)

Keeps:
  The JavaScript API of pages: window.flutter_inappwebview (the default
  javaScriptBridgeName), flutterInAppWebViewPlatformReady,
  _flutter_inappwebview_* properties. Renaming them would break pages.
  flutter_inappwebview_internal_annotations (upstream's published package).
  URLs, except this fork's (github.com/Telosnex/flutter_inappwebview).
  CHANGELOG.md, LICENSE, .all-contributorsrc.
"""
import os
import re
import subprocess
import sys

KEEP_FILES = re.compile(r'(^|/)(CHANGELOG\.md|LICENSE[^/]*|\.all-contributorsrc)$')
KEEP_DIRS = ('dev_packages/flutter_inappwebview_internal_annotations/',)

# Bridge-name defaults: "flutter_inappwebview" on these lines is the
# JavaScript object pages use.
BRIDGE_LINE = re.compile(r'JAVASCRIPT_BRIDGE_NAME|javaScriptBridgeName|^\s*[\'"]flutter_inappwebview[\'"];\s*$')

URL = re.compile(r'https?://[^\s)\]\'"<>`]+')


def rename_text(s):
    masks = []

    def mask(m):
        masks.append(m.group(0))
        return f'\x00{len(masks) - 1}\x00'

    s = re.sub(r'flutter_inappwebview_internal_annotations', mask, s)
    s = URL.sub(lambda m: m.group(0) if 'Telosnex/flutter_inappwebview' in m.group(0)
                or 'telosnex/flutter_inappwebview' in m.group(0) else mask(m), s)
    s = re.sub(r'(?<!com\.)pichillilorenzo/flutter_inappwebview', mask, s)
    s = '\n'.join(
        re.sub(r'[\'"]flutter_inappwebview[\'"]', mask, line) if BRIDGE_LINE.search(line) else line
        for line in s.split('\n'))

    s = s.replace('com.pichillilorenzo.flutter_inappwebview', 'com.telosnex.telosnex_inappwebview')
    s = s.replace('com.pichillilorenzo', 'com.telosnex')
    s = s.replace('com/pichillilorenzo/', 'com/telosnex/')
    # Not after . or a word character: window.flutter_inappwebview and
    # _flutter_inappwebview_* are page JavaScript.
    s = re.sub(r'(?<![\w.])flutter_inappwebview', 'telosnex_inappwebview', s)
    s = s.replace('Telosnex/flutter_inappwebview', 'Telosnex/telosnex_inappwebview')
    s = s.replace('telosnex/flutter_inappwebview', 'Telosnex/telosnex_inappwebview')
    s = s.replace('FLUTTER_INAPPWEBVIEW', 'TELOSNEX_INAPPWEBVIEW')
    s = s.replace('FlutterInappwebview', 'TelosnexInappwebview')
    s = s.replace('flutterInappwebview', 'telosnexInappwebview')
    s = re.sub(r'flutter-inappwebview-(ios|macos)', r'telosnex-inappwebview-\1', s)
    s = re.sub(r'\bInAppWebViewFlutterPlugin\b', 'TelosnexInAppWebViewPlugin', s)

    return re.sub('\x00(\\d+)\x00', lambda m: masks[int(m.group(1))], s)


def rename_path(p):
    if p.startswith(KEEP_DIRS):
        return p
    p = p.replace('com/pichillilorenzo/', 'com/telosnex/')
    p = re.sub(r'flutter_inappwebview(?!_internal_annotations)', 'telosnex_inappwebview', p)
    p = p.replace('FlutterInappwebview', 'TelosnexInappwebview')
    p = re.sub(r'\bInAppWebViewFlutterPlugin\b', 'TelosnexInAppWebViewPlugin', p)
    return p


def main():
    root = subprocess.check_output(['git', 'rev-parse', '--show-toplevel'], text=True).strip()
    os.chdir(root)
    files = subprocess.check_output(['git', 'ls-files', '-z'], text=True).split('\0')[:-1]
    changed = moved = 0
    for f in files:
        if os.path.islink(f) or not os.path.isfile(f):
            continue
        if not (KEEP_FILES.search(f) or f.startswith(KEEP_DIRS)) and f != 'tool/rename_upstream.py':
            try:
                with open(f, encoding='utf-8', newline='') as h:
                    text = h.read()
            except UnicodeDecodeError:
                text = None
            if text is not None:
                new = rename_text(text)
                if new != text:
                    with open(f, 'w', encoding='utf-8', newline='') as h:
                        h.write(new)
                    changed += 1
        target = rename_path(f)
        if target != f:
            os.makedirs(os.path.dirname(target) or '.', exist_ok=True)
            subprocess.check_call(['git', 'mv', '-k', f, target])
            moved += 1
    print(f'{changed} files rewritten, {moved} moved')


if __name__ == '__main__':
    sys.exit(main())
