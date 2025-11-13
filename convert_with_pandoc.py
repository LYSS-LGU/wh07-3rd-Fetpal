"""
Pandoc을 사용한 고품질 PDF 변환 스크립트
사전 요구사항:
1. Pandoc 설치: https://pandoc.org/installing.html
2. MiKTeX 또는 TeX Live 설치 (한글 지원용)
"""
import os
import subprocess
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

output_dir = r"C:\Users\leeys\Desktop\LYSS_LGU\Fetpal_project3\매니저님_제출용_PDF"
os.makedirs(output_dir, exist_ok=True)

for input_file in input_files:
    file_name = Path(input_file).stem
    output_file = os.path.join(output_dir, f"{file_name}.pdf")

    # Pandoc 명령어
    cmd = [
        "pandoc",
        input_file,
        "-o", output_file,
        "--pdf-engine=xelatex",  # 한글 지원
        "-V", "geometry:margin=2cm",
        "-V", "mainfont=Malgun Gothic",
        "-V", "CJKmainfont=Malgun Gothic",
        "--highlight-style=tango"
    ]

    try:
        subprocess.run(cmd, check=True)
        print(f"[OK] {file_name}")
    except Exception as e:
        print(f"[FAIL] {file_name}: {e}")
