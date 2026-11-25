# macro.md — เขียนสรุป › notes (summary/notes)

> สรุปบทเรียน: กล่องสีบทนิยาม/ทฤษฎีบท สารบัญ แบบฝึกท้ายบท

สรุปเนื้อหาแบบหนังสือ: หน้าแรกมีชื่อเรื่องและสารบัญ บทนิยาม/ทฤษฎีบท/ตัวอย่างอยู่ในกล่องสี มีแบบฝึกท้ายบท (ซ่อนเฉลยได้) แต่ละโฟลเดอร์ `content/NN_ชื่อ/` คือ 1 บท

## คำสั่ง make

| คำสั่ง | ได้อะไร |
|---|---|
| `make` | `build/main.pdf` (ซ่อนเฉลยแบบฝึกหัด) |
| `make teacher` | `build/main-teacher.pdf` เห็นเฉลย |
| `make draft` | `build/main-draft.pdf` เห็นโน้ต `\todo` `\idea` |
| `make chapter name=limits title="ลิมิต"` | เพิ่มบทใหม่ `content/NN_limits/main.tex` |
| `make review name=stats title="สถิติ"` | เพิ่มชีททบทวน: เป้าหมาย สรุป ตัวอย่าง ปรนัย อัตนัย ตรวจสอบตนเอง |
| `make view` / `make watch` / `make clean` | เปิด PDF / คอมไพล์ทุกครั้งที่เซฟ / ลบไฟล์ขยะ |

## แก้ตรงไหน

- `main.tex`: `\doctitle` ชื่อเรื่อง, `\docsubject` บรรทัดเล็กเหนือชื่อ, `\docauthor` ผู้เขียน
- ไม่อยากได้สารบัญ: ใส่ `%` หน้า `\tableofcontents`

## คำสั่งของสรุปบทเรียน

| คำสั่ง | ใช้ทำอะไร |
|---|---|
| `\section{หัวข้อ}` `\subsection{...}` | หัวข้อมีเลขสี ขึ้นในสารบัญ (`\subsection*{...}` = ไม่มีเลข) |
| `\begin{keypoints} ... \end{keypoints}` | กล่อง "ข้อควรจำ" สรุปท้ายหัวข้อ |
| `\makenotetitle` | หัวเรื่องหน้าแรก (อยู่ใน `main.tex` แล้ว) |

สีกล่อง: บทนิยาม = น้ำเงิน, ทฤษฎีบท/บทตั้ง/บทแทรก = แดง, ตัวอย่าง = เขียว, ข้อสังเกต = เทา

```latex
\section{ค่าสัมบูรณ์}

\begin{definition}[ค่าสัมบูรณ์] \label{def:abs}
  $\abs{x} \defeq \max\set{x, -x}$
\end{definition}

\begin{example}
  $\abs{-3} = 3$
\end{example}

\begin{keypoints}
  $\abs{xy} = \abs{x}\abs{y}$
\end{keypoints}
```

## ทฤษฎีบท บทนิยาม ตัวอย่าง

```latex
\begin{definition}[ค่าสัมบูรณ์] \label{def:abs}
  ...
\end{definition}

\begin{theorem}[ชื่อทฤษฎีบท] \label{thm:main}
  ...
\end{theorem}
\begin{proof} ... \end{proof}          % จบด้วย □ ให้เอง
```

| environment | หัวข้อที่พิมพ์ | ตัวอักษรในกล่อง |
|---|---|---|
| `theorem` `lemma` `proposition` `corollary` `conjecture` | ทฤษฎีบท บทตั้ง ประพจน์ บทแทรก ข้อความคาดการณ์ | เอียง |
| `definition` `example` `exercise` | บทนิยาม ตัวอย่าง แบบฝึกหัด | ตั้งตรง |
| `remark` | ข้อสังเกต | ตั้งตรง หัวบาง |
| `proof` / `solution` | พิสูจน์ / วิธีทำ | จบด้วย □ |

- ทุกอันนับเลขร่วมกันตามหัวข้อ: ทฤษฎีบท 1.1, บทนิยาม 1.2, ...
- ไม่ต้องการเลข: ใส่ดาว เช่น `theorem*` `definition*` `example*` `remark*`
- อ้างถึง: `\cref{thm:main}` ได้ "ทฤษฎีบท 1.1"

## โจทย์ คะแนน และเฉลย

`make` = ฉบับนักเรียน (ซ่อนเฉลย) · `make teacher` = ฉบับเฉลย (`build/main-teacher.pdf`) · `make both` = ทั้งสองฉบับ

```latex
\begin{exercises}
  \item จงแก้สมการ $2x + 1 = 5$ \points{2}
  \workbox[3cm]
  \begin{answer}  $x = 2$  \end{answer}

  \item กำหนด $f(x) = x^2$ \points{3}
  \begin{subq}
    \item จงหา $f(2)$
    \item จงหา $f(-1)$
  \end{subq}
\end{exercises}
```

| คำสั่ง | ใช้ทำอะไร |
|---|---|
| `\begin{exercises} \item ...` | รายการโจทย์ 1. 2. 3. (`\begin{exercises}[resume]` = นับเลขต่อจากชุดก่อน) |
| `\begin{subq} \item ...` | ข้อย่อย ก) ข) ค) |
| `\points{2}` | "(2 คะแนน)" ชิดขวา และนับรวมคะแนนให้ (ใส่ 1.5 ได้) |
| `\totalpoints` | คะแนนรวมทั้งไฟล์ (รอบแรกขึ้น ?? ปกติ) |
| `\begin{answer} ... \end{answer}` | เฉลย เห็นเฉพาะ `make teacher` |
| `\workbox` `\workbox[6cm]` | ที่ว่าง "แสดงวิธีทำ" |
| `\answerlines{4}` | เส้นบรรทัดให้เขียน 4 เส้น |
| `\answerspace[2cm]` | ที่ว่างเปล่า |
| `\begin{choices}[4] \item ... \item \correct ...` | ตัวเลือก ก. ข. ค. ง. แบ่ง 4 คอลัมน์ (ค่าเริ่มต้น 2) `\correct` = ข้อถูก ติ๊กเฉพาะฉบับเฉลย |
| `\begin{checklist} \item ...` | รายการมีช่อง □ ให้ติ๊ก |
| `\studentline` | ชื่อ ___ เลขที่ ___ วันที่ ___ |
| `\scoreline` `\scoreline[20]` | คะแนน ___ / เต็ม (ไม่ใส่ = นับจาก `\points` ให้) |
| `\coordgrid{}` `\coordgrid[8]{\draw ...;}` | ตารางกราฟแกน X-Y |
| `\begin{keeptogether} ... \end{keeptogether}` | ไม่ให้โจทย์ข้อนี้ขาดข้ามหน้า |
| `\topichead{หัวข้อ}` `\chapterhead{หัวข้อ}` | หัวข้อเล็ก / หัวข้อใหญ่กลางหน้า ไม่มีเลข |

## เอกสารอ้างอิง (refs.bib)

1. เพิ่มแหล่งอ้างอิงใน `refs.bib`
2. อ้างในเนื้อหาด้วย `\cite{key}`
3. รายการท้ายเล่มสร้างเองตอน `make` แสดงเฉพาะอันที่ถูก `\cite`

```bibtex
@book{rudin1976,                      % key = rudin1976
  author = {Walter Rudin}, title = {Principles of Mathematical Analysis},
  publisher = {McGraw-Hill}, year = {1976},
}
@online{kku-web,                      % เว็บไซต์
  author = {มหาวิทยาลัยขอนแก่น}, title = {ชื่อหน้าเว็บ},
  url = {https://www.kku.ac.th}, urldate = {2026-09-27}, year = {2026},
}
```

| คำสั่ง | ได้ |
|---|---|
| `\cite{rudin1976}` | [1] |
| `\cite[หน้า 45]{rudin1976}` | [1, หน้า 45] |
| `\cite{a,b}` | [1, 2] |

## คำสั่งพื้นฐาน (ใช้ได้ทุกแบบ)

### เน้นข้อความ

| คำสั่ง | ใช้ทำอะไร |
|---|---|
| `\hl{คำสั้นๆ}` | ไฮไลต์เหลือง (ไม่ตัดบรรทัด ใช้กับวลีสั้นๆ) |
| `\key{คำสำคัญ}` | ตัวหนาสีแดง |
| `\begin{important} ... \end{important}` | กล่องเหลือง เน้นทั้งย่อหน้า |
| `\begin{formulabox}{หัวข้อ} ... \end{formulabox}` | กล่องสูตร/สรุปมีหัวข้อ |
| `\note{ข้อความ}` | กล่องส้ม "หมายเหตุ" มีป้ายเตือน |

### ทางลัดคณิตศาสตร์

| คำสั่ง | ได้ |
|---|---|
| `\R \N \Z \Q \C` | เซตจำนวนจริง นับ เต็ม ตรรกยะ เชิงซ้อน |
| `\cA` ... `\cZ` | ตัวเขียน (`\mathcal`) |
| `\abs{x}` `\norm{v}` | ค่าสัมบูรณ์, นอร์ม (`\abs*{...}` = ขยายตามเนื้อใน) |
| `\floor{x}` `\ceil{x}` | ปัดลง ปัดขึ้น |
| `\paren{..}` `\brac{..}` `\set{..}` | วงเล็บ ( ) [ ] { } ใส่ `*` ให้ขยายอัตโนมัติ |
| `\setof{x \in \R}{x > 0}` | เซตแบบบอกเงื่อนไข |
| `\dd x` | d ตั้งตรง: `\int f(x) \dd x` |
| `\dv{f}{x}` `\dv[2]{f}{x}` | อนุพันธ์ df/dx, อันดับ 2 |
| `\pdv{f}{x}` | อนุพันธ์ย่อย |
| `\eval{F(x)}{a}{b}` | แทนค่าขอบ F(x) จาก a ถึง b |
| `\limn` `\limx{0}` `\sumn` | lim n→∞, lim x→0, ผลรวม n=1 ถึง ∞ |
| `\vb{v}` `\vect{a}{b}` `\cvec{1\\2\\3}` | เวกเตอร์ตัวหนา, เวกเตอร์หลัก 2 มิติ, 3 มิติ |
| `\mat{1 & 2 \\ 3 & 4}` `\dmat{...}` | เมทริกซ์, ดีเทอร์มิแนนต์ |
| `A\T` `A\inv` | ทรานสโพส, อินเวอร์ส |
| `\E` `\Var` `\Cov` `\Prob` | ค่าคาดหมาย ความแปรปรวน ความแปรปรวนร่วม ความน่าจะเป็น |
| `X \iid \Normal(0,1)` | สุ่มอิสระ แจกแจงปกติ |
| `\defeq` `\eps` `\degree` `\st` | := , ε , องศา , "โดยที่" |
| `\qty{9.81}{m/s^2}` `\num{12345}` | ตัวเลขพร้อมหน่วย (siunitx) |

### อ้างอิงภายในเอกสาร

```latex
\begin{equation} a^2 + b^2 = c^2 \label{eq:pyth} \end{equation}
ดู \cref{eq:pyth}        % พิมพ์ "สมการ (1)" ให้เอง คลิกได้
```

ตั้งชื่อ label ให้มีคำนำหน้า: `eq:` สมการ, `fig:` ภาพ, `tab:` ตาราง, `sec:` หัวข้อ

### โน้ตฉบับร่าง (เห็นเฉพาะ `make draft`)

| คำสั่ง | ใช้ทำอะไร |
|---|---|
| `\todo{ต้องทำ}` | ข้อความแดง [TODO] |
| `\idea{ไอเดีย}` | ข้อความน้ำเงิน [IDEA] |
| `\changed{ข้อความใหม่}` | ข้อความเขียว ในฉบับร่าง, ปกติในฉบับจริง |

### ภาษาและฟอนต์

- ภาษาไทยเป็นค่าเริ่มต้น เปลี่ยนเป็นอังกฤษ: แก้ `\input{preamble/lang-th}` ใน `main.tex` เป็น `lang-en`
- ภาษาไทยใน `\texttt{...}` และในโค้ดแสดงได้เอง ไม่ต้องทำอะไร
- เอกสารภาษาอังกฤษที่มีคำไทย: `\thai{คำไทย}`
