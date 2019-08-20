#! /usr/bin/env python3

FILE = 'ragas.csv'

raga_str = """Harikambhoji	s r2 g2 m1 p d2 n1 s	s n1 d2 p m1 g2 r2 s
Cakravakam	s r1 g2 m1 p d2 n1 s	s n1 d2 p m1 g2 r1 s
Yamunakalyani	s r2 g2 m2 p d2 n2 s	s n2 d2 p m2 g2 m1 r2 s	m1
Misraranjini
Mayamalavagaula	s r1 g2 m1 p d1 n2 s	s n2 d1 p m1 g2 r1 s
Pantuvarali
Madhyamavati	s r2 m1 p n1 s	s n1 p m1 r2 s
Hamsadhvani	s r2 g2 p n2 s	s n2 p g2 r2 s
Sankarabharanam	s r2 g2 m1 p d2 n2 s	s n2 d2 p m1 g2 r2 s
Abheri	s g1 m1 p n1 s	s n1 d2 p m1 g1 r2 s
Mohanam	s r2 g2 p d2 s	s d2 p g2 r2 s
Sindhubhairavi	s r1 g1 m1 p d1 n1 s	s n1 d1 p m1 g1 r1 s	r2 m2 d2 n2
Suddhasaveri	s r2 m1 p d2 s	s d2 p m1 r2 s
Suddhadhanyasi	s g1 m1 p n1 s	s n1 p m1 g1 s
Ritigaula	s g1 r2 g1 m1 n1 d2 m1 n1 n1 s	s n1 d2 m1 g1 m1 p M1 g1 r2 s"""

raga_dicts = []
for line in raga_str.split('\n'):
    parts = line.split('\t')
    
    raga = { 'name': row[0] }
        'arohanam': row[1],
        'avarohanam': row[2]
    }

    if len(row) > 3:
        raga['anyasvara'] = row[3]
    
    raga_dicts.append(raga)

print(raga_dicts)