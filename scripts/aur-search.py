#!/bin/python
import argparse
import requests
from html.parser import HTMLParser

class AurParser(HTMLParser):
    def __init__(self):
        HTMLParser.__init__(self)
        self.name = False
        self.desc = False
        self.names = []
        self.descs = []

    def handle_starttag(self, tag, attr):
        if tag != 'td' and tag != 'a':
            return
        if tag == 'td':
            for name, val in attr:
                if name == 'class' and val == 'wrap':
                    self.desc = True
                    return
        if tag == 'a':
            for name, val in attr:
                if name == 'href' and val.find('?') == -1:
                    self.name = True
                    return

    def handle_endtag(self, tag):
        if tag == 'td' and self.desc:
            self.desc = False
            return
        if tag == 'a' and self.name:
            self.name = False
            return

    def handle_data(self, data):
        if self.name:
            self.names.append(data)
            return
        if self.desc:
            self.descs.append(data)
            return

parser = argparse.ArgumentParser(description='Searches the AUR')
parser.add_argument("string", metavar='<search>', type=str, nargs='*', help="the search string")

args = parser.parse_args()
search = ' '.join(args.string)
url = 'https://aur.archlinux.org/packages/'

if search != '':
    url += '?K=' + search

r = requests.get(url)
res = r.text
res = res[res.index('<tbody>'):res.index('</tbody>')]
p = AurParser()
p.feed(res)

for i in range(len(p.names)):
    print('{}\n\t{}\n'.format(p.names[i], p.descs[i]))
