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
renditions = {}

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



def print_ruby (model_name, rows, reference_fields=[], list_fields=[]):
    lines = []
    for name in sorted(rows.keys()):
        keyvals = []
        for k, v in rows[name].items():
            if k in list_fields:
               continue
            elif k in reference_fields:
                keyvals.append(":{}_id => {}".format(k, v))
            else:
                keyvals.append(':{} => "{}"'.format(k, v))

        if len(list_fields) != 0:
            str = 'obj = '
        else:
            str = ''
        
        str += '{}.create({})'.format(
            model_name, ', '.join(keyvals)
        )

        lines.append(str)

        for k in list_fields:
            str = 'obj.{} += '.format(k)
            all_persons = [
                p
                for p in rows[name][k]
            ]
            str += "[{}]".format(", ".join(all_persons))
            lines.append(str)
        
        if len(list_fields) != 0:
            lines.append('obj.save')

    
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
    people['Group'] = { 'name': 'Group' }
    first_name_mapping = {}
    for name in people.keys():
        firstname = name.split()[0]
        first_name_mapping[firstname] = name
    

    rendition_id = 0
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
                rendition['event'] = 'Event.find_by(name: "practice").id'
            else:
                rendition['event'] = 'Event.find_by(name: "satsang").id'


            # people - lead, backup, soundsystem, instrumentalists
            rendition['lead'] = []
            lead_singer_key = 'Lead singer'
            if ('Jay' in row[lead_singer_key] and 'Prema' in row[lead_singer_key]):
                firstnames = ['Jay', 'Prema']
            elif (row[lead_singer_key] in ['Sumathy & Senthil']):
                firstnames = ['Senthil', 'Sumathy']
            else:
                firstnames = [row['Lead singer']]
            for name in firstnames:
                assert name in first_name_mapping, '{} LEAD: name not found <{}>'.format(week, name)
                rendition['lead'].append('Person.find_by(name: "{}")'.format(first_name_mapping[name]))

            rendition['backup'] = []
            backup1 = row['Backup1']
            if "," in backup1:
                firstnames = backup1.split(", ")
            else:
                firstnames = [backup1]
            if 'Backup2' in row and row['Backup2'] != '':
                firstnames.append(row['Backup2'])
            if 'Backup3' in row and row['Backup3'] != '':
                firstnames.append(row['Backup3'])
            for name in firstnames:
                if name == '':
                    continue
                assert name in first_name_mapping, '{} BACKUP: name not found <{}>'.format(week, name)
                rendition['backup'].append('Person.find_by(name: "{}")'.format(first_name_mapping[name]))


            rendition['instrumentalists'] = []

            keys = ['Harmonium', 'Percussionists', 'Guitar', 'Keyboard']
            for key in keys:
                if key not in row:
                    continue

                names = row[key]
                if "," in names:
                    firstnames = names.split(", ")
                else:
                    firstnames = [names]
                
                for name in firstnames:
                    if name == '' or name == 'None':
                        continue
                    if " " in name:
                        name = name.split(" ")[0]

                    assert name in first_name_mapping, '{} INSTRUMENTALISTS: name not found <{}>'.format(week, name)
                    rendition['instrumentalists'].append('Person.find_by(name: "{}")'.format(first_name_mapping[name]))


            rendition['soundsystem'] = []
            keys = ['Sound system']
            for key in keys:
                if key not in row:
                    continue

                names = row[key]
                if "," in names:
                    firstnames = names.split(", ")
                else:
                    firstnames = [names]
                
                for name in firstnames:
                    if name == '' or name == 'None':
                        continue
                    if " " in name:
                        name = name.split(" ")[0]

                    assert name in first_name_mapping, '{} SOUNDSYSTEM: name not found <{}>'.format(week, name)
                    rendition['soundsystem'].append('Person.find_by(name: "{}")'.format(first_name_mapping[name]))


            renditions[rendition_id] = rendition
            rendition_id += 1

    #return
    print_ruby('Raga', ragas)
    print_ruby('Language', languages)
    print_ruby('Deity', deities)
    print_ruby('Bhajan', bhajans, reference_fields=['language', 'deity', 'raga'])
    
    print_ruby('Event', events)
    print_ruby('Weekend', weekends)
    print_ruby('Person', people)

    print_ruby("Rendition", renditions, 
        reference_fields=['weekend', 'event', 'bhajan'], 
        list_fields=['instrumentalists', 'soundsystem', 'lead', 'backup'])
    
    # adding to the rendition list
    """
    rend = Rendition.create(:...)
    rend.lead << Person.find_by(name: person_name)
    rend.lead << Person.find_by(name: person_name)
    rend.lead << Person.find_by(name: person_name)
    
    rend.lead << Person.find_by(name: person_name)
    rend.lead << Person.find_by(name: person_name)
    rend.lead << Person.find_by(name: person_name)

    rend.lead << Person.find_by(name: person_name)
    rend.lead << Person.find_by(name: person_name)
    rend.lead << Person.find_by(name: person_name)

    rend.lead << Person.find_by(name: person_name)
    rend.lead << Person.find_by(name: person_name)
    rend.lead << Person.find_by(name: person_name)
    """
if __name__ == '__main__':
    main()

    



