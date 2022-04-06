
main-no：     文件格式 elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 8a 2f 00 00    	push   0x2f8a(%rip)        # 3fb0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 8b 2f 00 00 	bnd jmp *0x2f8b(%rip)        # 3fb8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	push   $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	push   $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    105f:	90                   	nop

Disassembly of section .plt.got:

0000000000001060 <__cxa_finalize@plt>:
    1060:	f3 0f 1e fa          	endbr64 
    1064:	f2 ff 25 8d 2f 00 00 	bnd jmp *0x2f8d(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    106b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001070 <puts@plt>:
    1070:	f3 0f 1e fa          	endbr64 
    1074:	f2 ff 25 45 2f 00 00 	bnd jmp *0x2f45(%rip)        # 3fc0 <puts@GLIBC_2.2.5>
    107b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001080 <printf@plt>:
    1080:	f3 0f 1e fa          	endbr64 
    1084:	f2 ff 25 3d 2f 00 00 	bnd jmp *0x2f3d(%rip)        # 3fc8 <printf@GLIBC_2.2.5>
    108b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001090 <malloc@plt>:
    1090:	f3 0f 1e fa          	endbr64 
    1094:	f2 ff 25 35 2f 00 00 	bnd jmp *0x2f35(%rip)        # 3fd0 <malloc@GLIBC_2.2.5>
    109b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000010a0 <_start>:
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	31 ed                	xor    %ebp,%ebp
    10a6:	49 89 d1             	mov    %rdx,%r9
    10a9:	5e                   	pop    %rsi
    10aa:	48 89 e2             	mov    %rsp,%rdx
    10ad:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    10b1:	50                   	push   %rax
    10b2:	54                   	push   %rsp
    10b3:	45 31 c0             	xor    %r8d,%r8d
    10b6:	31 c9                	xor    %ecx,%ecx
    10b8:	48 8d 3d f8 02 00 00 	lea    0x2f8(%rip),%rdi        # 13b7 <main>
    10bf:	ff 15 13 2f 00 00    	call   *0x2f13(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    10c5:	f4                   	hlt    
    10c6:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

00000000000010d0 <deregister_tm_clones>:
    10d0:	48 8d 3d 41 2f 00 00 	lea    0x2f41(%rip),%rdi        # 4018 <__TMC_END__>
    10d7:	48 8d 05 3a 2f 00 00 	lea    0x2f3a(%rip),%rax        # 4018 <__TMC_END__>
    10de:	48 39 f8             	cmp    %rdi,%rax
    10e1:	74 15                	je     10f8 <deregister_tm_clones+0x28>
    10e3:	48 8b 05 f6 2e 00 00 	mov    0x2ef6(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    10ea:	48 85 c0             	test   %rax,%rax
    10ed:	74 09                	je     10f8 <deregister_tm_clones+0x28>
    10ef:	ff e0                	jmp    *%rax
    10f1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10f8:	c3                   	ret    
    10f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001100 <register_tm_clones>:
    1100:	48 8d 3d 11 2f 00 00 	lea    0x2f11(%rip),%rdi        # 4018 <__TMC_END__>
    1107:	48 8d 35 0a 2f 00 00 	lea    0x2f0a(%rip),%rsi        # 4018 <__TMC_END__>
    110e:	48 29 fe             	sub    %rdi,%rsi
    1111:	48 89 f0             	mov    %rsi,%rax
    1114:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1118:	48 c1 f8 03          	sar    $0x3,%rax
    111c:	48 01 c6             	add    %rax,%rsi
    111f:	48 d1 fe             	sar    %rsi
    1122:	74 14                	je     1138 <register_tm_clones+0x38>
    1124:	48 8b 05 c5 2e 00 00 	mov    0x2ec5(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    112b:	48 85 c0             	test   %rax,%rax
    112e:	74 08                	je     1138 <register_tm_clones+0x38>
    1130:	ff e0                	jmp    *%rax
    1132:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1138:	c3                   	ret    
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001140 <__do_global_dtors_aux>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	80 3d cd 2e 00 00 00 	cmpb   $0x0,0x2ecd(%rip)        # 4018 <__TMC_END__>
    114b:	75 2b                	jne    1178 <__do_global_dtors_aux+0x38>
    114d:	55                   	push   %rbp
    114e:	48 83 3d a2 2e 00 00 00 	cmpq   $0x0,0x2ea2(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1156:	48 89 e5             	mov    %rsp,%rbp
    1159:	74 0c                	je     1167 <__do_global_dtors_aux+0x27>
    115b:	48 8b 3d a6 2e 00 00 	mov    0x2ea6(%rip),%rdi        # 4008 <__dso_handle>
    1162:	e8 f9 fe ff ff       	call   1060 <__cxa_finalize@plt>
    1167:	e8 64 ff ff ff       	call   10d0 <deregister_tm_clones>
    116c:	c6 05 a5 2e 00 00 01 	movb   $0x1,0x2ea5(%rip)        # 4018 <__TMC_END__>
    1173:	5d                   	pop    %rbp
    1174:	c3                   	ret    
    1175:	0f 1f 00             	nopl   (%rax)
    1178:	c3                   	ret    
    1179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001180 <frame_dummy>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	e9 77 ff ff ff       	jmp    1100 <register_tm_clones>

0000000000001189 <service>:
    1189:	f3 0f 1e fa          	endbr64 
    118d:	55                   	push   %rbp
    118e:	48 89 e5             	mov    %rsp,%rbp
    1191:	48 83 ec 10          	sub    $0x10,%rsp
    1195:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1199:	48 8d 05 68 0e 00 00 	lea    0xe68(%rip),%rax        # 2008 <_IO_stdin_used+0x8>
    11a0:	48 89 c7             	mov    %rax,%rdi
    11a3:	e8 c8 fe ff ff       	call   1070 <puts@plt>
    11a8:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11ac:	48 83 c0 02          	add    $0x2,%rax
    11b0:	c9                   	leave  
    11b1:	c3                   	ret    

00000000000011b2 <sensitive>:
    11b2:	f3 0f 1e fa          	endbr64 
    11b6:	55                   	push   %rbp
    11b7:	48 89 e5             	mov    %rsp,%rbp
    11ba:	48 83 ec 20          	sub    $0x20,%rsp
    11be:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    11c2:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    11c6:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    11ca:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    11ce:	48 01 d0             	add    %rdx,%rax
    11d1:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    11d5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11d9:	48 89 c6             	mov    %rax,%rsi
    11dc:	48 8d 05 35 0e 00 00 	lea    0xe35(%rip),%rax        # 2018 <_IO_stdin_used+0x18>
    11e3:	48 89 c7             	mov    %rax,%rdi
    11e6:	b8 00 00 00 00       	mov    $0x0,%eax
    11eb:	e8 90 fe ff ff       	call   1080 <printf@plt>
    11f0:	8b 05 1a 2e 00 00    	mov    0x2e1a(%rip),%eax        # 4010 <debug>
    11f6:	85 c0                	test   %eax,%eax
    11f8:	75 11                	jne    120b <sensitive+0x59>
    11fa:	48 89 25 27 2e 00 00 	mov    %rsp,0x2e27(%rip)        # 4028 <RSP1>
    1201:	48 8b 05 18 2e 00 00 	mov    0x2e18(%rip),%rax        # 4020 <RSP0>
    1208:	48 89 c4             	mov    %rax,%rsp
    120b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    120f:	48 89 c7             	mov    %rax,%rdi
    1212:	e8 72 ff ff ff       	call   1189 <service>
    1217:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    121b:	8b 05 ef 2d 00 00    	mov    0x2def(%rip),%eax        # 4010 <debug>
    1221:	85 c0                	test   %eax,%eax
    1223:	75 0a                	jne    122f <sensitive+0x7d>
    1225:	48 8b 05 fc 2d 00 00 	mov    0x2dfc(%rip),%rax        # 4028 <RSP1>
    122c:	48 89 c4             	mov    %rax,%rsp
    122f:	8b 05 db 2d 00 00    	mov    0x2ddb(%rip),%eax        # 4010 <debug>
    1235:	85 c0                	test   %eax,%eax
    1237:	75 11                	jne    124a <sensitive+0x98>
    1239:	48 89 25 e8 2d 00 00 	mov    %rsp,0x2de8(%rip)        # 4028 <RSP1>
    1240:	48 8b 05 d9 2d 00 00 	mov    0x2dd9(%rip),%rax        # 4020 <RSP0>
    1247:	48 89 c4             	mov    %rax,%rsp
    124a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    124e:	48 89 c7             	mov    %rax,%rdi
    1251:	e8 33 ff ff ff       	call   1189 <service>
    1256:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    125a:	8b 05 b0 2d 00 00    	mov    0x2db0(%rip),%eax        # 4010 <debug>
    1260:	85 c0                	test   %eax,%eax
    1262:	75 0a                	jne    126e <sensitive+0xbc>
    1264:	48 8b 05 bd 2d 00 00 	mov    0x2dbd(%rip),%rax        # 4028 <RSP1>
    126b:	48 89 c4             	mov    %rax,%rsp
    126e:	8b 05 9c 2d 00 00    	mov    0x2d9c(%rip),%eax        # 4010 <debug>
    1274:	85 c0                	test   %eax,%eax
    1276:	75 11                	jne    1289 <sensitive+0xd7>
    1278:	48 89 25 a9 2d 00 00 	mov    %rsp,0x2da9(%rip)        # 4028 <RSP1>
    127f:	48 8b 05 9a 2d 00 00 	mov    0x2d9a(%rip),%rax        # 4020 <RSP0>
    1286:	48 89 c4             	mov    %rax,%rsp
    1289:	b9 00 10 00 00       	mov    $0x1000,%ecx
    128e:	ba e8 03 00 00       	mov    $0x3e8,%edx
    1293:	be 64 00 00 00       	mov    $0x64,%esi
    1298:	bf 0a 00 00 00       	mov    $0xa,%edi
    129d:	e8 93 00 00 00       	call   1335 <nested_test>
    12a2:	8b 05 68 2d 00 00    	mov    0x2d68(%rip),%eax        # 4010 <debug>
    12a8:	85 c0                	test   %eax,%eax
    12aa:	75 0a                	jne    12b6 <sensitive+0x104>
    12ac:	48 8b 05 75 2d 00 00 	mov    0x2d75(%rip),%rax        # 4028 <RSP1>
    12b3:	48 89 c4             	mov    %rax,%rsp
    12b6:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    12ba:	c9                   	leave  
    12bb:	c3                   	ret    

00000000000012bc <sensitive_nested_test>:
    12bc:	f3 0f 1e fa          	endbr64 
    12c0:	55                   	push   %rbp
    12c1:	48 89 e5             	mov    %rsp,%rbp
    12c4:	48 83 ec 10          	sub    $0x10,%rsp
    12c8:	89 7d fc             	mov    %edi,-0x4(%rbp)
    12cb:	89 75 f8             	mov    %esi,-0x8(%rbp)
    12ce:	89 55 f4             	mov    %edx,-0xc(%rbp)
    12d1:	89 4d f0             	mov    %ecx,-0x10(%rbp)
    12d4:	8b 75 f0             	mov    -0x10(%rbp),%esi
    12d7:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    12da:	8b 55 f8             	mov    -0x8(%rbp),%edx
    12dd:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12e0:	41 89 f0             	mov    %esi,%r8d
    12e3:	89 c6                	mov    %eax,%esi
    12e5:	48 8d 05 3c 0d 00 00 	lea    0xd3c(%rip),%rax        # 2028 <_IO_stdin_used+0x28>
    12ec:	48 89 c7             	mov    %rax,%rdi
    12ef:	b8 00 00 00 00       	mov    $0x0,%eax
    12f4:	e8 87 fd ff ff       	call   1080 <printf@plt>
    12f9:	8b 05 11 2d 00 00    	mov    0x2d11(%rip),%eax        # 4010 <debug>
    12ff:	85 c0                	test   %eax,%eax
    1301:	75 11                	jne    1314 <sensitive_nested_test+0x58>
    1303:	48 89 25 1e 2d 00 00 	mov    %rsp,0x2d1e(%rip)        # 4028 <RSP1>
    130a:	48 8b 05 0f 2d 00 00 	mov    0x2d0f(%rip),%rax        # 4020 <RSP0>
    1311:	48 89 c4             	mov    %rax,%rsp
    1314:	bf 0a 00 00 00       	mov    $0xa,%edi
    1319:	e8 6b fe ff ff       	call   1189 <service>
    131e:	8b 05 ec 2c 00 00    	mov    0x2cec(%rip),%eax        # 4010 <debug>
    1324:	85 c0                	test   %eax,%eax
    1326:	75 0a                	jne    1332 <sensitive_nested_test+0x76>
    1328:	48 8b 05 f9 2c 00 00 	mov    0x2cf9(%rip),%rax        # 4028 <RSP1>
    132f:	48 89 c4             	mov    %rax,%rsp
    1332:	90                   	nop
    1333:	c9                   	leave  
    1334:	c3                   	ret    

0000000000001335 <nested_test>:
    1335:	f3 0f 1e fa          	endbr64 
    1339:	55                   	push   %rbp
    133a:	48 89 e5             	mov    %rsp,%rbp
    133d:	48 83 ec 10          	sub    $0x10,%rsp
    1341:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1344:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1347:	89 55 f4             	mov    %edx,-0xc(%rbp)
    134a:	89 4d f0             	mov    %ecx,-0x10(%rbp)
    134d:	8b 75 f0             	mov    -0x10(%rbp),%esi
    1350:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    1353:	8b 55 f8             	mov    -0x8(%rbp),%edx
    1356:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1359:	41 89 f0             	mov    %esi,%r8d
    135c:	89 c6                	mov    %eax,%esi
    135e:	48 8d 05 e6 0c 00 00 	lea    0xce6(%rip),%rax        # 204b <_IO_stdin_used+0x4b>
    1365:	48 89 c7             	mov    %rax,%rdi
    1368:	b8 00 00 00 00       	mov    $0x0,%eax
    136d:	e8 0e fd ff ff       	call   1080 <printf@plt>
    1372:	8b 05 98 2c 00 00    	mov    0x2c98(%rip),%eax        # 4010 <debug>
    1378:	85 c0                	test   %eax,%eax
    137a:	75 11                	jne    138d <nested_test+0x58>
    137c:	48 89 25 9d 2c 00 00 	mov    %rsp,0x2c9d(%rip)        # 4020 <RSP0>
    1383:	48 8b 05 9e 2c 00 00 	mov    0x2c9e(%rip),%rax        # 4028 <RSP1>
    138a:	48 89 c4             	mov    %rax,%rsp
    138d:	8b 4d f0             	mov    -0x10(%rbp),%ecx
    1390:	8b 55 f4             	mov    -0xc(%rbp),%edx
    1393:	8b 75 f8             	mov    -0x8(%rbp),%esi
    1396:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1399:	89 c7                	mov    %eax,%edi
    139b:	e8 1c ff ff ff       	call   12bc <sensitive_nested_test>
    13a0:	8b 05 6a 2c 00 00    	mov    0x2c6a(%rip),%eax        # 4010 <debug>
    13a6:	85 c0                	test   %eax,%eax
    13a8:	75 0a                	jne    13b4 <nested_test+0x7f>
    13aa:	48 8b 05 6f 2c 00 00 	mov    0x2c6f(%rip),%rax        # 4020 <RSP0>
    13b1:	48 89 c4             	mov    %rax,%rsp
    13b4:	90                   	nop
    13b5:	c9                   	leave  
    13b6:	c3                   	ret    

00000000000013b7 <main>:
    13b7:	f3 0f 1e fa          	endbr64 
    13bb:	55                   	push   %rbp
    13bc:	48 89 e5             	mov    %rsp,%rbp
    13bf:	48 83 ec 20          	sub    $0x20,%rsp
    13c3:	48 c7 45 e0 02 00 00 00 	movq   $0x2,-0x20(%rbp)
    13cb:	48 c7 45 e8 08 00 00 00 	movq   $0x8,-0x18(%rbp)
    13d3:	bf 00 40 00 00       	mov    $0x4000,%edi
    13d8:	e8 b3 fc ff ff       	call   1090 <malloc@plt>
    13dd:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    13e1:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    13e5:	48 05 00 00 01 00    	add    $0x10000,%rax
    13eb:	48 89 05 36 2c 00 00 	mov    %rax,0x2c36(%rip)        # 4028 <RSP1>
    13f2:	8b 05 18 2c 00 00    	mov    0x2c18(%rip),%eax        # 4010 <debug>
    13f8:	85 c0                	test   %eax,%eax
    13fa:	75 11                	jne    140d <main+0x56>
    13fc:	48 89 25 1d 2c 00 00 	mov    %rsp,0x2c1d(%rip)        # 4020 <RSP0>
    1403:	48 8b 05 1e 2c 00 00 	mov    0x2c1e(%rip),%rax        # 4028 <RSP1>
    140a:	48 89 c4             	mov    %rax,%rsp
    140d:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1411:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1415:	48 89 d6             	mov    %rdx,%rsi
    1418:	48 89 c7             	mov    %rax,%rdi
    141b:	e8 92 fd ff ff       	call   11b2 <sensitive>
    1420:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1424:	8b 05 e6 2b 00 00    	mov    0x2be6(%rip),%eax        # 4010 <debug>
    142a:	85 c0                	test   %eax,%eax
    142c:	75 0a                	jne    1438 <main+0x81>
    142e:	48 8b 05 eb 2b 00 00 	mov    0x2beb(%rip),%rax        # 4020 <RSP0>
    1435:	48 89 c4             	mov    %rax,%rsp
    1438:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    143c:	48 89 c6             	mov    %rax,%rsi
    143f:	48 8d 05 1e 0c 00 00 	lea    0xc1e(%rip),%rax        # 2064 <_IO_stdin_used+0x64>
    1446:	48 89 c7             	mov    %rax,%rdi
    1449:	b8 00 00 00 00       	mov    $0x0,%eax
    144e:	e8 2d fc ff ff       	call   1080 <printf@plt>
    1453:	b8 00 00 00 00       	mov    $0x0,%eax
    1458:	c9                   	leave  
    1459:	c3                   	ret    

Disassembly of section .fini:

000000000000145c <_fini>:
    145c:	f3 0f 1e fa          	endbr64 
    1460:	48 83 ec 08          	sub    $0x8,%rsp
    1464:	48 83 c4 08          	add    $0x8,%rsp
    1468:	c3                   	ret    
