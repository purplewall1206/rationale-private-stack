
main：     文件格式 elf64-x86-64


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
    10b8:	48 8d 3d 94 02 00 00 	lea    0x294(%rip),%rdi        # 1353 <main>
    10bf:	ff 15 13 2f 00 00    	call   *0x2f13(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    10c5:	f4                   	hlt    
    10c6:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

00000000000010d0 <deregister_tm_clones>:
    10d0:	48 8d 3d 39 2f 00 00 	lea    0x2f39(%rip),%rdi        # 4010 <__TMC_END__>
    10d7:	48 8d 05 32 2f 00 00 	lea    0x2f32(%rip),%rax        # 4010 <__TMC_END__>
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
    1100:	48 8d 3d 09 2f 00 00 	lea    0x2f09(%rip),%rdi        # 4010 <__TMC_END__>
    1107:	48 8d 35 02 2f 00 00 	lea    0x2f02(%rip),%rsi        # 4010 <__TMC_END__>
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
    1144:	80 3d c5 2e 00 00 00 	cmpb   $0x0,0x2ec5(%rip)        # 4010 <__TMC_END__>
    114b:	75 2b                	jne    1178 <__do_global_dtors_aux+0x38>
    114d:	55                   	push   %rbp
    114e:	48 83 3d a2 2e 00 00 00 	cmpq   $0x0,0x2ea2(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1156:	48 89 e5             	mov    %rsp,%rbp
    1159:	74 0c                	je     1167 <__do_global_dtors_aux+0x27>
    115b:	48 8b 3d a6 2e 00 00 	mov    0x2ea6(%rip),%rdi        # 4008 <__dso_handle>
    1162:	e8 f9 fe ff ff       	call   1060 <__cxa_finalize@plt>
    1167:	e8 64 ff ff ff       	call   10d0 <deregister_tm_clones>
    116c:	c6 05 9d 2e 00 00 01 	movb   $0x1,0x2e9d(%rip)        # 4010 <__TMC_END__>
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
    11f0:	48 89 25 29 2e 00 00 	mov    %rsp,0x2e29(%rip)        # 4020 <RSP1>
    11f7:	48 8b 05 1a 2e 00 00 	mov    0x2e1a(%rip),%rax        # 4018 <RSP0>
    11fe:	48 89 c4             	mov    %rax,%rsp
    1201:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1205:	48 89 c7             	mov    %rax,%rdi
    1208:	e8 7c ff ff ff       	call   1189 <service>
    120d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1211:	48 8b 05 08 2e 00 00 	mov    0x2e08(%rip),%rax        # 4020 <RSP1>
    1218:	48 89 c4             	mov    %rax,%rsp
    121b:	48 89 25 fe 2d 00 00 	mov    %rsp,0x2dfe(%rip)        # 4020 <RSP1>
    1222:	48 8b 05 ef 2d 00 00 	mov    0x2def(%rip),%rax        # 4018 <RSP0>
    1229:	48 89 c4             	mov    %rax,%rsp
    122c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1230:	48 89 c7             	mov    %rax,%rdi
    1233:	e8 51 ff ff ff       	call   1189 <service>
    1238:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    123c:	48 8b 05 dd 2d 00 00 	mov    0x2ddd(%rip),%rax        # 4020 <RSP1>
    1243:	48 89 c4             	mov    %rax,%rsp
    1246:	48 89 25 d3 2d 00 00 	mov    %rsp,0x2dd3(%rip)        # 4020 <RSP1>
    124d:	48 8b 05 c4 2d 00 00 	mov    0x2dc4(%rip),%rax        # 4018 <RSP0>
    1254:	48 89 c4             	mov    %rax,%rsp
    1257:	b9 00 10 00 00       	mov    $0x1000,%ecx
    125c:	ba e8 03 00 00       	mov    $0x3e8,%edx
    1261:	be 64 00 00 00       	mov    $0x64,%esi
    1266:	bf 0a 00 00 00       	mov    $0xa,%edi
    126b:	e8 75 00 00 00       	call   12e5 <nested_test>
    1270:	48 8b 05 a9 2d 00 00 	mov    0x2da9(%rip),%rax        # 4020 <RSP1>
    1277:	48 89 c4             	mov    %rax,%rsp
    127a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    127e:	c9                   	leave  
    127f:	c3                   	ret    

0000000000001280 <sensitive_nested_test>:
    1280:	f3 0f 1e fa          	endbr64 
    1284:	55                   	push   %rbp
    1285:	48 89 e5             	mov    %rsp,%rbp
    1288:	48 83 ec 10          	sub    $0x10,%rsp
    128c:	89 7d fc             	mov    %edi,-0x4(%rbp)
    128f:	89 75 f8             	mov    %esi,-0x8(%rbp)
    1292:	89 55 f4             	mov    %edx,-0xc(%rbp)
    1295:	89 4d f0             	mov    %ecx,-0x10(%rbp)
    1298:	8b 75 f0             	mov    -0x10(%rbp),%esi
    129b:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    129e:	8b 55 f8             	mov    -0x8(%rbp),%edx
    12a1:	8b 45 fc             	mov    -0x4(%rbp),%eax
    12a4:	41 89 f0             	mov    %esi,%r8d
    12a7:	89 c6                	mov    %eax,%esi
    12a9:	48 8d 05 78 0d 00 00 	lea    0xd78(%rip),%rax        # 2028 <_IO_stdin_used+0x28>
    12b0:	48 89 c7             	mov    %rax,%rdi
    12b3:	b8 00 00 00 00       	mov    $0x0,%eax
    12b8:	e8 c3 fd ff ff       	call   1080 <printf@plt>
    12bd:	48 89 25 5c 2d 00 00 	mov    %rsp,0x2d5c(%rip)        # 4020 <RSP1>
    12c4:	48 8b 05 4d 2d 00 00 	mov    0x2d4d(%rip),%rax        # 4018 <RSP0>
    12cb:	48 89 c4             	mov    %rax,%rsp
    12ce:	bf 0a 00 00 00       	mov    $0xa,%edi
    12d3:	e8 b1 fe ff ff       	call   1189 <service>
    12d8:	48 8b 05 41 2d 00 00 	mov    0x2d41(%rip),%rax        # 4020 <RSP1>
    12df:	48 89 c4             	mov    %rax,%rsp
    12e2:	90                   	nop
    12e3:	c9                   	leave  
    12e4:	c3                   	ret    

00000000000012e5 <nested_test>:
    12e5:	f3 0f 1e fa          	endbr64 
    12e9:	55                   	push   %rbp
    12ea:	48 89 e5             	mov    %rsp,%rbp
    12ed:	48 83 ec 10          	sub    $0x10,%rsp
    12f1:	89 7d fc             	mov    %edi,-0x4(%rbp)
    12f4:	89 75 f8             	mov    %esi,-0x8(%rbp)
    12f7:	89 55 f4             	mov    %edx,-0xc(%rbp)
    12fa:	89 4d f0             	mov    %ecx,-0x10(%rbp)
    12fd:	8b 75 f0             	mov    -0x10(%rbp),%esi
    1300:	8b 4d f4             	mov    -0xc(%rbp),%ecx
    1303:	8b 55 f8             	mov    -0x8(%rbp),%edx
    1306:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1309:	41 89 f0             	mov    %esi,%r8d
    130c:	89 c6                	mov    %eax,%esi
    130e:	48 8d 05 36 0d 00 00 	lea    0xd36(%rip),%rax        # 204b <_IO_stdin_used+0x4b>
    1315:	48 89 c7             	mov    %rax,%rdi
    1318:	b8 00 00 00 00       	mov    $0x0,%eax
    131d:	e8 5e fd ff ff       	call   1080 <printf@plt>
    1322:	48 89 25 ef 2c 00 00 	mov    %rsp,0x2cef(%rip)        # 4018 <RSP0>
    1329:	48 8b 05 f0 2c 00 00 	mov    0x2cf0(%rip),%rax        # 4020 <RSP1>
    1330:	48 89 c4             	mov    %rax,%rsp
    1333:	8b 4d f0             	mov    -0x10(%rbp),%ecx
    1336:	8b 55 f4             	mov    -0xc(%rbp),%edx
    1339:	8b 75 f8             	mov    -0x8(%rbp),%esi
    133c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    133f:	89 c7                	mov    %eax,%edi
    1341:	e8 3a ff ff ff       	call   1280 <sensitive_nested_test>
    1346:	48 8b 05 cb 2c 00 00 	mov    0x2ccb(%rip),%rax        # 4018 <RSP0>
    134d:	48 89 c4             	mov    %rax,%rsp
    1350:	90                   	nop
    1351:	c9                   	leave  
    1352:	c3                   	ret    

0000000000001353 <main>:
    1353:	f3 0f 1e fa          	endbr64 
    1357:	55                   	push   %rbp
    1358:	48 89 e5             	mov    %rsp,%rbp
    135b:	48 83 ec 20          	sub    $0x20,%rsp
    135f:	48 c7 45 e0 02 00 00 00 	movq   $0x2,-0x20(%rbp)
    1367:	48 c7 45 e8 08 00 00 00 	movq   $0x8,-0x18(%rbp)
    136f:	bf 00 40 00 00       	mov    $0x4000,%edi
    1374:	e8 17 fd ff ff       	call   1090 <malloc@plt>
    1379:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    137d:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    1381:	48 05 00 00 01 00    	add    $0x10000,%rax
    1387:	48 89 05 92 2c 00 00 	mov    %rax,0x2c92(%rip)        # 4020 <RSP1>
    138e:	48 89 25 83 2c 00 00 	mov    %rsp,0x2c83(%rip)        # 4018 <RSP0>
    1395:	48 8b 05 84 2c 00 00 	mov    0x2c84(%rip),%rax        # 4020 <RSP1>
    139c:	48 89 c4             	mov    %rax,%rsp
    139f:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    13a3:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    13a7:	48 89 d6             	mov    %rdx,%rsi
    13aa:	48 89 c7             	mov    %rax,%rdi
    13ad:	e8 00 fe ff ff       	call   11b2 <sensitive>
    13b2:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    13b6:	48 8b 05 5b 2c 00 00 	mov    0x2c5b(%rip),%rax        # 4018 <RSP0>
    13bd:	48 89 c4             	mov    %rax,%rsp
    13c0:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    13c4:	48 89 c6             	mov    %rax,%rsi
    13c7:	48 8d 05 96 0c 00 00 	lea    0xc96(%rip),%rax        # 2064 <_IO_stdin_used+0x64>
    13ce:	48 89 c7             	mov    %rax,%rdi
    13d1:	b8 00 00 00 00       	mov    $0x0,%eax
    13d6:	e8 a5 fc ff ff       	call   1080 <printf@plt>
    13db:	b8 00 00 00 00       	mov    $0x0,%eax
    13e0:	c9                   	leave  
    13e1:	c3                   	ret    

Disassembly of section .fini:

00000000000013e4 <_fini>:
    13e4:	f3 0f 1e fa          	endbr64 
    13e8:	48 83 ec 08          	sub    $0x8,%rsp
    13ec:	48 83 c4 08          	add    $0x8,%rsp
    13f0:	c3                   	ret    
