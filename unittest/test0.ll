; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { i64, i64, i64 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @gens(%struct.s* noalias sret(%struct.s) align 8 %0, i64 %1, i64 %2, i64 %3) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i64 %1, i64* %5, align 8
  store i64 %2, i64* %6, align 8
  store i64 %3, i64* %7, align 8
  %8 = load i64, i64* %5, align 8
  %9 = add i64 %8, 1
  %10 = getelementptr inbounds %struct.s, %struct.s* %0, i32 0, i32 0
  store i64 %9, i64* %10, align 8
  %11 = load i64, i64* %6, align 8
  %12 = add i64 %11, 2
  %13 = getelementptr inbounds %struct.s, %struct.s* %0, i32 0, i32 1
  store i64 %12, i64* %13, align 8
  %14 = load i64, i64* %7, align 8
  %15 = add i64 %14, 3
  %16 = getelementptr inbounds %struct.s, %struct.s* %0, i32 0, i32 2
  store i64 %15, i64* %16, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @params8(i64 %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i64 %7) #0 {
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  store i64 %0, i64* %9, align 8
  store i64 %1, i64* %10, align 8
  store i64 %2, i64* %11, align 8
  store i64 %3, i64* %12, align 8
  store i64 %4, i64* %13, align 8
  store i64 %5, i64* %14, align 8
  store i64 %6, i64* %15, align 8
  store i64 %7, i64* %16, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @gens1(%struct.s* noalias sret(%struct.s) align 8 %0, i64 %1, i64 %2, i64 %3, %struct.s* byval(%struct.s) align 8 %4) #0 {
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store i64 %1, i64* %6, align 8
  store i64 %2, i64* %7, align 8
  store i64 %3, i64* %8, align 8
  %9 = load i64, i64* %6, align 8
  %10 = add i64 %9, 1
  %11 = getelementptr inbounds %struct.s, %struct.s* %0, i32 0, i32 0
  store i64 %10, i64* %11, align 8
  %12 = load i64, i64* %7, align 8
  %13 = add i64 %12, 2
  %14 = getelementptr inbounds %struct.s, %struct.s* %0, i32 0, i32 1
  store i64 %13, i64* %14, align 8
  %15 = load i64, i64* %8, align 8
  %16 = add i64 %15, 3
  %17 = getelementptr inbounds %struct.s, %struct.s* %0, i32 0, i32 2
  store i64 %16, i64* %17, align 8
  %18 = getelementptr inbounds %struct.s, %struct.s* %4, i32 0, i32 0
  %19 = load i64, i64* %18, align 8
  %20 = getelementptr inbounds %struct.s, %struct.s* %0, i32 0, i32 0
  %21 = load i64, i64* %20, align 8
  %22 = add i64 %21, %19
  store i64 %22, i64* %20, align 8
  %23 = getelementptr inbounds %struct.s, %struct.s* %4, i32 0, i32 1
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds %struct.s, %struct.s* %0, i32 0, i32 1
  %26 = load i64, i64* %25, align 8
  %27 = add i64 %26, %24
  store i64 %27, i64* %25, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @tailcall(i64 %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = add i64 %3, 10
  store i64 %4, i64* %2, align 8
  %5 = load i64, i64* %2, align 8
  
  ret i64 %5
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @call(i64 %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  %4 = add i64 %3, 100
  store i64 %4, i64* %2, align 8
  %5 = load i64, i64* %2, align 8
  %6 = call i64 @tailcall(i64 %5)

  ret i64 %6
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  store i32 0, i32* %1, align 4
  %3 = call i64 @call(i64 2)
  store i64 %3, i64* %2, align 8
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"Ubuntu clang version 13.0.0-2"}
