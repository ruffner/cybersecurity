from operator import xor

a=[[0x7c,0x6b,0x01,0xd7],[0xf2,0x30,0xfe,0x63],[0x2b,0x76,0x7b,0xc5],[0xab,0x77,0x6f,0x2b]]
b=[[2,3,1,1],[1,2,3,1],[1,1,2,3],[3,1,1,2]]
result=[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]

for i in range(len(b)):
	for j in range(len(a[0])):
		for k in range(len(a)):
			result[i][j] ^= b[i][k] * a[k][j]
for r in result:
	for rr in r:
		print(format(rr%256, '02x'))