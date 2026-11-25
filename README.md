# For CP352005 / SC312005 Computer Networks

---

## Structure

| Path | ดูอะไร |
|---|---|
| `ASSIGNMENTS/ASS01/` | งานที่ส่ง (ไฟล์ PDF และโจทย์ของ Assignment 01) |
| `latex_of_assignment/Ass01/` | ซอร์ส LaTeX ของ Assignment 01 (คอมไพล์เป็น PDF) |

### `latex_of_assignment/Ass01/`

| Path | ดูอะไร |
|---|---|
| `main.tex` | ไฟล์หลัก: ชื่อเรื่อง, ผู้เขียน, รหัสนักศึกษา, ลำดับการ include |
| `content/01_essay/main.tex` | **เนื้อหาเรียงความ** (ไฟล์ที่เขียนจริง) |
| `preamble/` | ตั้งค่า: `packages` (แพ็กเกจ), `lang-th` (ฟอนต์/คำไทย), `style` (หน้าตา/หัวเรื่อง), `macros`, `theorems`, `exercises`, `biblio` |
| `figures/` | รูปภาพที่ใช้ในเอกสาร |
| `refs.bib` | รายการอ้างอิง (ยังไม่ได้ใช้ในเรียงความนี้) |
| `templates/`, `scripts/` | แม่แบบและสคริปต์สร้างบทใหม่ (`make chapter`) |
| `Makefile`, `.latexmkrc` | คำสั่ง build (`make` ได้ `build/main.pdf`) |
| `macro.md` | รายการคำสั่งและแมโครที่ใช้ได้ |
