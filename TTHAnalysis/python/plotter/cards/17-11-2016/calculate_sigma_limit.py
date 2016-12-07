import sys

#print sys.argv[:]
#print sys.argv[1], sys.argv[6], sys.argv[-1]

if "Hut" in sys.argv[1]:
    limit = float(sys.argv[6])*50.82
elif "Hct" in sys.argv[1]:
    limit = float(sys.argv[6])*38.88

print sys.argv[1], limit, sys.argv[-1]
