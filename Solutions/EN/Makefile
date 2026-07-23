OS := $(shell uname)

# 配置字体和命令根据不同操作系统
ifeq ($(OS), Linux)
    MAIN_FONT = DejaVu Serif
    CJK_FONT = Noto Sans CJK SC
    PANDOC_CMD = pandoc
    RM_CMD = rm -rvf
else ifeq ($(OS), Darwin)
    MAIN_FONT = Times New Roman
    CJK_FONT = PingFang SC
    PANDOC_CMD = pandoc
    RM_CMD = rm -rvf
else ifeq ($(OS), Windows_NT)
    MAIN_FONT = Times New Roman
    CJK_FONT = Microsoft YaHei
    PANDOC_CMD = pandoc.exe
    RM_CMD = del /Q
endif

# 章节文件列表
CHAPTERS := $(sort $(wildcard chapters/*.md))

all: Solutions-Guide.html Solutions-Guide.pdf Solutions-Guide.docx

# 目标：生成 HTML 电子书
Solutions-Guide.html: $(CHAPTERS)
	$(PANDOC_CMD) $(CHAPTERS) -o Solutions-Design-and-Implementation.html \
		--toc --toc-depth=3                  \
		--variable mainfont="$(MAIN_FONT)"   \
		--variable CJKmainfont="$(CJK_FONT)" \
		--variable fontsize=12pt

# 目标：生成 PDF 电子书
Solutions-Guide.pdf: $(CHAPTERS)
	$(PANDOC_CMD) $(CHAPTERS) -o Solutions-Design-and-Implementation.pdf --pdf-engine=xelatex \
		--variable mainfont="$(MAIN_FONT)"   \
		--variable CJKmainfont="$(CJK_FONT)" \
		--variable geometry:margin=1in       \
		--variable fontsize=12pt

# 目标：生成 DOCX 电子书
Solutions-Guide.docx: $(CHAPTERS)
	$(PANDOC_CMD) $(CHAPTERS) -o Solutions-Guide.docx \
		--variable mainfont="$(MAIN_FONT)" \
		--variable fontsize=12pt


# 清理中间文件
clean:
	$(RM_CMD) *.aux *.log *.out *.toc *.pdf *.docx *.html
