import sys

#print sys.argv[:]
#sys.exit()
#print sys.argv[1], sys.argv[6], sys.argv[-1]
'''

if "Hut" in sys.argv[1]:
    limit1 = float(sys.argv[6])*1
    limit2 = float(sys.argv[11])*1
    limit3 = float(sys.argv[16])*1
    limit4 = float(sys.argv[21])*1
    limit5 = float(sys.argv[26])*1
elif "Hct" in sys.argv[1]:
    limit1 = float(sys.argv[6])*1
    limit2 = float(sys.argv[11])*1
    limit3 = float(sys.argv[16])*1
    limit4 = float(sys.argv[21])*1
    limit5 = float(sys.argv[26])*1

'''
if "Hut" in sys.argv[1]:
    limit1 = float(sys.argv[6])*50.82
    limit2 = float(sys.argv[11])*50.82
    limit3 = float(sys.argv[16])*50.82
    limit4 = float(sys.argv[21])*50.82
    limit5 = float(sys.argv[26])*50.82
elif "Hct" in sys.argv[1]:
    limit1 = float(sys.argv[6])*38.88
    limit2 = float(sys.argv[11])*38.88
    limit3 = float(sys.argv[16])*38.88
    limit4 = float(sys.argv[21])*38.88
    limit5 = float(sys.argv[26])*38.88

print '#"'+sys.argv[1][16:-9]+'": [ 0,', limit1, ", ", limit2, ", ", limit3, ", ", limit4, ", ", limit5, "],"
