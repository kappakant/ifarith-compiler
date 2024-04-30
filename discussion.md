# Discussion and Reflection


The bulk of this project consists of a collection of five
questions. You are to answer these questions after spending some
amount of time looking over the code together to gather answers for
your questions. Try to seriously dig into the project together--it is
of course understood that you may not grasp every detail, but put
forth serious effort to spend several hours reading and discussing the
code, along with anything you have taken from it.

Questions will largely be graded on completion and maturity, but the
instructors do reserve the right to take off for technical
inaccuracies (i.e., if you say something factually wrong).

Each of these (six, five main followed by last) questions should take
roughly at least a paragraph or two. Try to aim for between 1-500
words per question. You may divide up the work, but each of you should
collectively read and agree to each other's answers.

[ Question 1 ] 

For this task, you will three new .irv programs. These are
`ir-virtual?` programs in a pseudo-assembly format. Try to compile the
program. Here, you should briefly explain the purpose of ir-virtual,
especially how it is different than x86: what are the pros and cons of
using ir-virtual as a representation? You can get the compiler to to
compile ir-virtual files like so: 

program1:

((move-lit rax 5) (move-lit rdx 6) (add rax rdx)  (print rdx) )

program2:
((move-lit rax 6) (mov-lit rdx 7) (sub rdx rax) (print rdx) ) 

program3: 
((move-lit rax 7) (mov-lit rdx 8) (mul rdx rax) (print rdx) )



racket compiler.rkt -v test-programs/sum1.irv 

(Also pass in -m for Mac)

some of the pros is that it is a much easier to understand and implement then regular assembly. Some other pros are that it is much safer to run a sudo assembly then directly running it on your machine. Some cons are you have to define every input and output where as with assebly it is already predefined.  Over all id say that working with a sudo asembely is much more forgiving then working directely with assemebely, it allows you to make a lot more mistakes, and be able to rectify them in a very safe enviorment, also with assembely you may inevertanly cause a segmentation fault, or you may spit out an incorrect number but it still gives a number. In sudo assembely it is much more obvious when you make a little mistake or error, and being able to change it and notice that the small erorrs occur is defintely a big pro for sudo assembely. A con for using sudo is that you don't gain direct experience working with assembely, it may be a safer enviorment to work in but you do not gain experience that you would gain from working directely with assemebely, wether it preventing segmentation faults or determening what might have caused them in the first place. 

[ Question 2 ] 

For this task, you will write three new .ifa programs. Your programs
must be correct, in the sense that they are valid. There are a set of
starter programs in the test-programs directory now. Your job is to
create three new `.ifa` programs and compile and run each of them. It
is very much possible that the compiler will be broken: part of your
exercise is identifying if you can find any possible bugs in the
compiler.

For each of your exercises, write here what the input and output was
from the compiler. Read through each of the phases, by passing in the
`-v` flag to the compiler. For at least one of the programs, explain
carefully the relevance of each of the intermediate representations.

For this question, please add your `.ifa` programs either (a) here or
(b) to the repo and write where they are in this file.

40.ifa, 50.ifa, 60.ifa in test-programs. 

40.ifa example:
```
Input source tree in IfArith:
40
ifarith-tiny:
40
40
anf:
'(let ((x1255 40)) x1255)
ir-virtual:
'(((label lab1256) (mov-lit x1255 40)) (return x1255))
```

50.ifa example:
```
Input source tree in IfArith:
50
ifarith-tiny:
50
50
anf:
'(let ((x1254 50)) x1254)
ir-virtual:
'(((label lab1255) (mov-lit x1254 50)) (return x1254))
```

60.ifa example:
```
Input source tree in IfArith:
60
ifarith-tiny:
60
60
anf:
'(let ((x1255 60)) x1255)
ir-virtual:
'(((label lab1256) (mov-lit x1255 60)) (return x1255))
```
x86 outputs can be found in test-programs/40.asm, test-programs/50.asm, test-programs/60.asm.

IfArith-Tiny is important because the next compiler is not defined for certain syntax in IfArith that could equivalently be defined as syntactic sugar for more base operations. In the case of 60.ifa, 60 is a literal number and already works for IfArith-Tiny.

ANF (Admministrative Normal Form) partitions the expressions into atomic and complex expressions. This is important because it clarifies the required processing order for the code, which makes further compilation into assembly smoother.

For ir-virtual, one issue from not using it is that nesting isn't really possible normally. The solution ir-virtual provides is placing subexpressions into registers, virtually. Baring large computations that could cause issues if there are not enough registers, but otherwise nesting is solved.

[ Question 3 ] 

Describe each of the passes of the compiler in a slight degree of
detail, using specific examples to discuss what each pass does. The
compiler is designed in series of layers, with each higher-level IR
desugaring to a lower-level IR until ultimately arriving at x86-64
assembler. Do you think there are any redundant passes? Do you think
there could be more?

In answering this question, you must use specific examples that you
got from running the compiler and generating an output.

[ Question 4 ] 

This is a larger project, compared to our previous projects. This
project uses a large combination of idioms: tail recursion, folds,
etc.. Discuss a few programming idioms that you can identify in the
project that we discussed in class this semester. There is no specific
definition of what an idiom is: think carefully about whether you see
any pattern in this code that resonates with you from earlier in the
semester.

My beloved pattern-matching is used to great effect in this project. It does well to hide the stink inherent in such repetitive decision-trees.

[ Question 5 ] 

In this question, you will play the role of bug finder. I would like
you to be creative, adversarial, and exploratory. Spend an hour or two
looking throughout the code and try to break it. Try to see if you can
identify a buggy program: a program that should work, but does
not. This could either be that the compiler crashes, or it could be
that it produces code which will not assemble. Last, even if the code
assembles and links, its behavior could be incorrect.

To answer this question, I want you to summarize your discussion,
experiences, and findings by adversarily breaking the compiler. If
there is something you think should work (but does not), feel free to
ask me.

Your team will receive a small bonus for being the first team to
report a unique bug (unique determined by me).

[ High Level Reflection ] 

In roughly 100-500 words, write a summary of your findings in working
on this project: what did you learn, what did you find interesting,
what did you find challenging? As you progress in your career, it will
be increasingly important to have technical conversations about the
nuts and bolts of code, try to use this experience as a way to think
about how you would approach doing group code critique. What would you
do differently next time, what did you learn?

