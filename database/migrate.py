#! /usr/bin/env python3

import csv
import os
from glob import glob
import difflib

languages = {}
deities = {}
ragas = {}
bhajans = {}
events = {}
weekends = {}
people = {}
renditions = []

inputs = {}

"""
* Start with ragas - done
* Then upload bhajans 
* Then, go per weekly - if the name already exists as a bhajan, use that, otherwise, create new bhajan and use that
* Then do input table - for a given week, IF the rendition exists, skip this one. If not, use this one. 
"""

def read_and_get_fields (filename, table_fields):
    ifile = open(filename, 'r')
    reader = csv.DictReader(ifile)
    tmp_dict = {}
    for row in reader:
        name = row['name']
        tmp_dict[name] = {
            key: row[key] 
            for key in table_fields
            if row[key] != '' }
    return tmp_dict



def print_ruby (model_name, rows, reference_fields=[]):
    lines = []
    for name in sorted(rows.keys()):
        keyvals = [
            ':{} => "{}"'.format(k, v) if k not in reference_fields else ":{}_id => {}".format(k, v)
            for k, v in rows[name].items()
        ]

        str = '{}.create({})'.format(
            model_name, ', '.join(keyvals)
        )

        lines.append(str)
    print('\n'.join(lines))


def main():
    ragas = read_and_get_fields('ragas.csv', ['name', 'arohanam', 'avarohanam', 'anyasvara'])

    bhajans = read_and_get_fields('bhajans.csv', ['name', 'deity', 'speed', 'raga', 'beat', 'language'])

    for name, bhajan in bhajans.items():
        if 'language' in bhajan:
            language = bhajan['language']
            languages.setdefault(language, {'name': language})
            bhajan['language'] = 'Language.find_by(name: "{}").id'.format(language)

        if 'deity' in bhajan:
            deity = bhajan['deity']
            deities.setdefault(deity, {'name': deity})
            bhajan['deity'] = 'Deity.find_by(name: "{}").id'.format(deity)

        if 'raga' in bhajan:
            raga = bhajan['raga']
            ragas.setdefault(raga, {'name': raga})
            bhajan['raga'] = 'Raga.find_by(name: "{}").id'.format(raga)


    weekly_files = glob('Weekly*csv')
    for evt in ['practice', 'satsang']:
        events[evt] = {'name': evt}


    for filename in weekly_files:
        basename, _ = os.path.splitext(filename)
        week = basename.split(' ')[-1].replace('_', '/')
        weekends[week] = {'name': week}

    people = read_and_get_fields('people.csv', ['name', 'phone', 'email'])
    first_name_mapping = {}
    for name in people.keys():
        firstname = name.split()[0]
        first_name_mapping[firstname] = name
    

    for filename in weekly_files:
        # weeks_renditions = read_and_get_fields(
        #     filename, 
        #     ['Song', 'Order', 'Lead singer', 'Backup1', 'Backup2', 
        #     'Backup3', 'Harmonium', 'Percussionists', 'Sound system', 
        #     'Scale', 'Pitch', 'Sung Pitch'])
        

        ifile = open(filename, 'r')
        reader = csv.DictReader(ifile)
        for row in reader:
            rendition = {}
            
            order = row['Order']
            if 'P' not in order and order != '':
                rendition['order'] = int(order)
            else:
                rendition['order'] = 0


            if 'Scale' in row:
                rendition['shruti'] = row['Scale']
            elif 'Pitch' in row:
                rendition['shruti'] = row['Pitch']
            elif 'Sung Pitch' in row:
                rendition['shruti'] = row['Sung Pitch']
            
            basename, _ = os.path.splitext(filename)
            week = basename.split(' ')[-1].replace('_', '/')

            bhajan_name = row['Song']
            if bhajan_name not in bhajans:
                print('{}: New bhajan {} ~ {}'.format(
                    week,
                    bhajan_name,
                    difflib.get_close_matches(bhajan_name, bhajans.keys())))
                bhajans.setdefault(bhajan_name, {'name': bhajan_name})
                rendition['bhajan'] = 'Bhajan.find_by(name: "{}").id'.format(bhajan_name)
            
            rendition['weekend'] = 'Weekend.find_by(name: "{}").id'.format(week)

            if 'P' in order:
                rendition['event'] = 'Event.find_by(name: "practice")'
            else:
                rendition['event'] = 'Event.find_by(name: "satsang")'

            renditions.append(rendition)
            


    return
    print_ruby('Raga', ragas)
    print_ruby('Language', languages)
    print_ruby('Deity', deities)
    print_ruby('Bhajan', bhajans, reference_fields=['language', 'deity', 'raga'])
    
    print_ruby('Event', events)
    print_ruby('Weekend', weekends)
    print_ruby('Person', people)

    # todo: print the rendition
    # this also involves adding to the lead and backup lists


    



if __name__ == '__main__':
    main()

    



