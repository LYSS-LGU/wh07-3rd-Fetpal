"""
마크다운을 예쁜 HTML로 변환하는 스크립트
생성된 HTML을 브라우저에서 열어 Ctrl+P로 PDF 저장
"""
import os
import markdown
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

output_dir = r"C:\Users\leeys\Desktop\LYSS_LGU\Fetpal_project3\매니저님_제출용_PDF\html_preview"
os.makedirs(output_dir, exist_ok=True)

# GitHub 스타일 CSS
github_css = """
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{title}</title>
    <style>
        @media print {{
            @page {{
                size: A4;
                margin: 2cm;
            }}
        }}

        body {{
            font-family: -apple-system, BlinkMacSystemFont, "Malgun Gothic", "맑은 고딕",
                         "Segoe UI", "Noto Sans KR", Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
        }}

        h1 {{
            color: #2c3e50;
            border-bottom: 3px solid #3498db;
            padding-bottom: 10px;
            margin-top: 24px;
            margin-bottom: 16px;
            font-size: 2em;
            font-weight: 600;
        }}

        h2 {{
            color: #34495e;
            border-bottom: 2px solid #95a5a6;
            padding-bottom: 8px;
            margin-top: 24px;
            margin-bottom: 16px;
            font-size: 1.5em;
            font-weight: 600;
        }}

        h3 {{
            color: #555;
            margin-top: 20px;
            margin-bottom: 10px;
            font-size: 1.25em;
            font-weight: 600;
        }}

        h4 {{
            color: #666;
            margin-top: 16px;
            margin-bottom: 8px;
            font-size: 1em;
            font-weight: 600;
        }}

        table {{
            border-collapse: collapse;
            width: 100%;
            margin: 16px 0;
            display: table;
        }}

        th, td {{
            border: 1px solid #dfe2e5;
            padding: 8px 12px;
            text-align: left;
        }}

        th {{
            background-color: #3498db;
            color: white;
            font-weight: 600;
        }}

        tr:nth-child(even) {{
            background-color: #f6f8fa;
        }}

        code {{
            background-color: #f6f8fa;
            padding: 2px 6px;
            border-radius: 3px;
            font-family: "Consolas", "Monaco", "Courier New", monospace;
            font-size: 0.9em;
            color: #e83e8c;
        }}

        pre {{
            background-color: #f6f8fa;
            padding: 16px;
            border-radius: 6px;
            border-left: 4px solid #3498db;
            overflow-x: auto;
            margin: 16px 0;
        }}

        pre code {{
            background-color: transparent;
            padding: 0;
            color: #333;
            font-size: 0.9em;
        }}

        blockquote {{
            border-left: 4px solid #3498db;
            padding-left: 16px;
            margin: 16px 0;
            color: #6a737d;
            font-style: italic;
        }}

        ul, ol {{
            margin: 12px 0;
            padding-left: 30px;
        }}

        li {{
            margin: 6px 0;
        }}

        img {{
            max-width: 100%;
            height: auto;
            display: block;
            margin: 20px auto;
            border-radius: 4px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }}

        a {{
            color: #3498db;
            text-decoration: none;
        }}

        a:hover {{
            text-decoration: underline;
        }}

        hr {{
            border: none;
            border-top: 2px solid #e1e4e8;
            margin: 24px 0;
        }}

        .print-button {{
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 10px 20px;
            background: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            z-index: 1000;
        }}

        .print-button:hover {{
            background: #2980b9;
        }}

        @media print {{
            .print-button {{
                display: none;
            }}
        }}
    </style>
</head>
<body>
    <button class="print-button" onclick="window.print()">🖨️ PDF로 저장</button>
    {content}
</body>
</html>
"""

# Markdown 확장 기능 설정
md = markdown.Markdown(extensions=[
    'tables',
    'fenced_code',
    'codehilite',
    'nl2br',
    'sane_lists'
])

print("=" * 60)
print("마크다운을 HTML로 변환 중...")
print("=" * 60)

for input_file in input_files:
    try:
        file_name = Path(input_file).stem
        output_file = os.path.join(output_dir, f"{file_name}.html")

        print(f"\n변환 중: {file_name}")

        # 마크다운 파일 읽기
        with open(input_file, 'r', encoding='utf-8') as f:
            md_content = f.read()

        # 마크다운을 HTML로 변환
        html_content = md.convert(md_content)

        # 완성된 HTML
        full_html = github_css.format(title=file_name, content=html_content)

        # HTML 파일 저장
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write(full_html)

        print(f"[OK] 완료: {output_file}")

        # markdown 객체 리셋
        md.reset()

    except Exception as e:
        print(f"[FAIL] 실패 ({file_name}): {str(e)}")

print("\n" + "=" * 60)
print("변환 완료!")
print(f"저장 위치: {output_dir}")
print("\n사용 방법:")
print("1. 생성된 .html 파일을 Chrome/Edge 브라우저로 열기")
print("2. 우측 상단 '🖨️ PDF로 저장' 버튼 클릭 또는 Ctrl+P")
print("3. 'PDF로 저장' 선택")
print("4. 저장!")
print("=" * 60)
