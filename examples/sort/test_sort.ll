; ModuleID = 'test_sort.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

; Function Attrs: nounwind
define i32 @sort2(i32* nocapture %out2, i32* nocapture readonly %in2) #0 {
  %1 = load i32* %in2, align 4, !tbaa !1
  %2 = getelementptr inbounds i32* %in2, i32 1
  %3 = load i32* %2, align 4, !tbaa !1
  %4 = icmp slt i32 %1, %3
  %. = select i1 %4, i32 %1, i32 %3
  store i32 %., i32* %out2, align 4, !tbaa !1
  %.val = load i32* %2, align 4
  %in2.val = load i32* %in2, align 4
  %.sink = select i1 %4, i32 %.val, i32 %in2.val
  %5 = getelementptr inbounds i32* %out2, i32 1
  store i32 %.sink, i32* %5, align 4
  %6 = zext i1 %4 to i32
  ret i32 %6
}

; Function Attrs: nounwind
define void @sort3(i32* nocapture %conds, i32* nocapture %out3, i32* nocapture %in3) #0 {
  %1 = load i32* %in3, align 4, !tbaa !1
  %2 = getelementptr inbounds i32* %in3, i32 1
  %3 = load i32* %2, align 4, !tbaa !1
  %4 = icmp slt i32 %1, %3
  %..i = select i1 %4, i32 %1, i32 %3
  store i32 %..i, i32* %out3, align 4, !tbaa !1
  %.val.i = load i32* %2, align 4
  %in2.val.i = load i32* %in3, align 4
  %.sink.i = select i1 %4, i32 %.val.i, i32 %in2.val.i
  %5 = getelementptr inbounds i32* %out3, i32 1
  store i32 %.sink.i, i32* %5, align 4
  %6 = zext i1 %4 to i32
  store i32 %6, i32* %conds, align 4, !tbaa !1
  %7 = load i32* %5, align 4, !tbaa !1
  store i32 %7, i32* %2, align 4, !tbaa !1
  %8 = getelementptr inbounds i32* %in3, i32 2
  %9 = load i32* %8, align 4, !tbaa !1
  %10 = icmp slt i32 %7, %9
  %..i5 = select i1 %10, i32 %7, i32 %9
  store i32 %..i5, i32* %5, align 4, !tbaa !1
  %.val.i6 = load i32* %8, align 4
  %in2.val.i7 = load i32* %2, align 4
  %.sink.i8 = select i1 %10, i32 %.val.i6, i32 %in2.val.i7
  %11 = getelementptr inbounds i32* %out3, i32 2
  store i32 %.sink.i8, i32* %11, align 4
  %12 = zext i1 %10 to i32
  %13 = getelementptr inbounds i32* %conds, i32 1
  store i32 %12, i32* %13, align 4, !tbaa !1
  %14 = load i32* %out3, align 4, !tbaa !1
  store i32 %14, i32* %in3, align 4, !tbaa !1
  %15 = load i32* %5, align 4, !tbaa !1
  store i32 %15, i32* %2, align 4, !tbaa !1
  %16 = icmp slt i32 %14, %15
  %..i1 = select i1 %16, i32 %14, i32 %15
  store i32 %..i1, i32* %out3, align 4, !tbaa !1
  %.val.i2 = load i32* %2, align 4
  %in2.val.i3 = load i32* %in3, align 4
  %.sink.i4 = select i1 %16, i32 %.val.i2, i32 %in2.val.i3
  store i32 %.sink.i4, i32* %5, align 4
  %17 = zext i1 %16 to i32
  %18 = getelementptr inbounds i32* %conds, i32 2
  store i32 %17, i32* %18, align 4, !tbaa !1
  ret void
}

; Function Attrs: nounwind
define i32* @sort3_wrapper(i32* %conds, i32* nocapture %out, i32* nocapture %in) #0 {
  %1 = load i32* %in, align 4, !tbaa !1
  %2 = getelementptr inbounds i32* %in, i32 1
  %3 = load i32* %2, align 4, !tbaa !1
  %4 = icmp slt i32 %1, %3
  %..i.i = select i1 %4, i32 %1, i32 %3
  store i32 %..i.i, i32* %out, align 4, !tbaa !1
  %.val.i.i = load i32* %2, align 4
  %in2.val.i.i = load i32* %in, align 4
  %.sink.i.i = select i1 %4, i32 %.val.i.i, i32 %in2.val.i.i
  %5 = getelementptr inbounds i32* %out, i32 1
  store i32 %.sink.i.i, i32* %5, align 4
  %6 = zext i1 %4 to i32
  store i32 %6, i32* %conds, align 4, !tbaa !1
  %7 = load i32* %5, align 4, !tbaa !1
  store i32 %7, i32* %2, align 4, !tbaa !1
  %8 = getelementptr inbounds i32* %in, i32 2
  %9 = load i32* %8, align 4, !tbaa !1
  %10 = icmp slt i32 %7, %9
  %..i5.i = select i1 %10, i32 %7, i32 %9
  store i32 %..i5.i, i32* %5, align 4, !tbaa !1
  %.val.i6.i = load i32* %8, align 4
  %in2.val.i7.i = load i32* %2, align 4
  %.sink.i8.i = select i1 %10, i32 %.val.i6.i, i32 %in2.val.i7.i
  %11 = getelementptr inbounds i32* %out, i32 2
  store i32 %.sink.i8.i, i32* %11, align 4
  %12 = zext i1 %10 to i32
  %13 = getelementptr inbounds i32* %conds, i32 1
  store i32 %12, i32* %13, align 4, !tbaa !1
  %14 = load i32* %out, align 4, !tbaa !1
  store i32 %14, i32* %in, align 4, !tbaa !1
  %15 = load i32* %5, align 4, !tbaa !1
  store i32 %15, i32* %2, align 4, !tbaa !1
  %16 = icmp slt i32 %14, %15
  %..i1.i = select i1 %16, i32 %14, i32 %15
  store i32 %..i1.i, i32* %out, align 4, !tbaa !1
  %.val.i2.i = load i32* %2, align 4
  %in2.val.i3.i = load i32* %in, align 4
  %.sink.i4.i = select i1 %16, i32 %.val.i2.i, i32 %in2.val.i3.i
  store i32 %.sink.i4.i, i32* %5, align 4
  %17 = zext i1 %16 to i32
  %18 = getelementptr inbounds i32* %conds, i32 2
  store i32 %17, i32* %18, align 4, !tbaa !1
  ret i32* %conds
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5.2-svn232544-1~exp1 (branches/release_35) (based on LLVM 3.5.2)"}
!1 = metadata !{metadata !2, metadata !2, i64 0}
!2 = metadata !{metadata !"int", metadata !3, i64 0}
!3 = metadata !{metadata !"omnipotent char", metadata !4, i64 0}
!4 = metadata !{metadata !"Simple C/C++ TBAA"}
