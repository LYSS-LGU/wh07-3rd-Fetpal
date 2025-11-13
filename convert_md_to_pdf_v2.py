import os
import markdown
from xhtml2pdf import pisa
from pathlib import Path

# 입력 파일 목록
input_files = [
    r"C:\Users\leeys\Desktop\LYSS_LGU\Fetpal_project3\docs\01_프로젝트_기획서.md",
    r"C:\Users\leeys\Desktop\LYSS_LGU\Fetpal_project3\docs\02_WBS_최신화.md",
    r"C:\Users\leeys\Desktop\LYSS_LGU\Fetpal_project3\docs\03_시스템_흐름도.md",
    r"C:\Users\leeys\Desktop\LYSS_LGU\Fetpal_project3\docs\04_시스템_아키텍처.md",
    r"C:\Users\leeys\Desktop\LYSS_LGU\Fetpal_project3\docs\06_요구사항_정의서.md",
    r"C:\Users\leeys\Desktop\LYSS_LGU\Fetpal_project3\docs\07_성능_평가_결과서.md",
    r"C:\Users\leeys\Desktop\LYSS_LGU\Fetpal_project3\docs\08_Supabase_BaaS_가이드.md",
    r"C:\Users\leeys\Desktop\LYSS_LGU\Fetpal_project3\docs\09_AI_모델_정의서.md"
]

# 출력 디렉토리
output_dir = r"C:\Users\leeys\Desktop\LYSS_LGU\Fetpal_project3\매니저님_제출용_PDF"

# 출력 디렉토리 생성
os.makedirs(output_dir, exist_ok=True)

# CSS 스타일 정의
css_style = """
<style>
    @page {
        size: A4;
        margin: 2cm;
    }
    body {
        font-family: Malgun Gothic, Arial, sans-serif;
        font-size: 11pt;
        line-height: 1.6;
        color: #333;
    }
    h1 {
        color: #2c3e50;
        border-bottom: 3px solid #3498db;
        padding-bottom: 10px;
        margin-top: 20px;
        font-size: 24pt;
        page-break-after: avoid;
    }
    h2 {
        color: #34495e;
        border-bottom: 2px solid #95a5a6;
        padding-bottom: 8px;
        margin-top: 18px;
        font-size: 20pt;
        page-break-after: avoid;
    }
    h3 {
        color: #555;
        margin-top: 16px;
        font-size: 16pt;
        page-break-after: avoid;
    }
    h4 {
        color: #666;
        margin-top: 14px;
        font-size: 14pt;
        page-break-after: avoid;
    }
    table {
        border-collapse: collapse;
        width: 100%;
        margin: 15px 0;
        font-size: 9pt;
        page-break-inside: avoid;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 6px;
        text-align: left;
    }
    th {
        background-color: #3498db;
        color: white;
        font-weight: bold;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    code {
        background-color: #f4f4f4;
        padding: 2px 5px;
        border-radius: 3px;
        font-family: "Consolas", "Courier New", monospace;
        font-size: 10pt;
    }
    pre {
        background-color: #f4f4f4;
        padding: 10px;
        border-radius: 5px;
        border-left: 4px solid #3498db;
        overflow-x: auto;
        font-size: 9pt;
        page-break-inside: avoid;
    }
    pre code {
        background-color: transparent;
        padding: 0;
    }
    blockquote {
        border-left: 4px solid #3498db;
        padding-left: 15px;
        margin-left: 0;
        color: #555;
        font-style: italic;
    }
    ul, ol {
        margin: 10px 0;
        padding-left: 30px;
    }
    li {
        margin: 5px 0;
    }
    img {
        max-width: 100%;
        height: auto;
        display: block;
        margin: 15px auto;
    }
    a {
        color: #3498db;
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
    }
    .page-break {
        page-break-before: always;
    }
</style>
"""

# Markdown 확장 기능 설정
md = markdown.Markdown(extensions=[
    'tables',
    'fenced_code',
    'codehilite',
    'nl2br',
    'sane_lists'
])

def convert_md_to_pdf(input_file, output_file):
    """마크다운 파일을 PDF로 변환"""
    try:
        # 마크다운 파일 읽기
        with open(input_file, 'r', encoding='utf-8') as f:
            md_content = f.read()

        # 마크다운을 HTML로 변환
        html_content = md.convert(md_content)

        # HTML 래핑
        full_html = f'''
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <title>{Path(input_file).stem}</title>
            {css_style}
        </head>
        <body>
            {html_content}
        </body>
        </html>
        '''

        # PDF로 변환
        with open(output_file, 'wb') as pdf_file:
            pisa_status = pisa.CreatePDF(full_html, dest=pdf_file, encoding='utf-8')

        # markdown 객체 리셋 (다음 파일을 위해)
        md.reset()

        return not pisa_status.err

    except Exception as e:
        print(f"[X] Error: {str(e)}")
        return False

# 파일 변환
print("=" * 60)
print("마크다운 파일을 PDF로 변환 중...")
print("=" * 60)

success_count = 0
fail_count = 0

for input_file in input_files:
    file_name = Path(input_file).stem
    output_file = os.path.join(output_dir, f"{file_name}.pdf")

    print(f"\nConverting: {file_name}")

    if os.path.exists(input_file):
        if convert_md_to_pdf(input_file, output_file):
            print(f"[OK] Done: {output_file}")
            success_count += 1
        else:
            print(f"[FAIL] Failed: {file_name}")
            fail_count += 1
    else:
        print(f"[FAIL] File not found: {input_file}")
        fail_count += 1

print("\n" + "=" * 60)
print(f"변환 완료: 성공 {success_count}개, 실패 {fail_count}개")
print(f"저장 위치: {output_dir}")
print("=" * 60)
