"""
Playwright를 사용한 자동 HTML → PDF 변환
- 헤더/푸터 없음
- Mermaid 다이어그램 완전 로딩 후 변환
- 배경 그래픽 포함
"""
import asyncio
import os
from pathlib import Path
from playwright.async_api import async_playwright

# 입력/출력 경로
html_dir = r"C:\Users\유석\Desktop\LYSS_LGU\Fetpal_project3\매니저님_제출용_PDF\html_preview"
pdf_dir = r"C:\Users\유석\Desktop\LYSS_LGU\Fetpal_project3\매니저님_제출용_PDF"

# HTML 파일 목록
html_files = [
    "01_프로젝트_기획서.html",
    "02_WBS_최신화.html",
    "03_시스템_흐름도.html",
    "04_시스템_아키텍처.html",
    "06_요구사항_정의서.html",
    "07_YOLO_모델_정의서.html",
    "08_RAG-LLM_시스템_정의서.html",
    "09_성능_평가_결과서.html",
    "10_Supabase_BaaS_가이드.html"
]

async def convert_html_to_pdf(html_path, pdf_path):
    """HTML 파일을 PDF로 변환"""
    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True)
        page = await browser.new_page()

        # HTML 파일 로드
        file_url = f"file:///{html_path.replace(chr(92), '/')}"
        await page.goto(file_url, wait_until="networkidle")

        # Mermaid 다이어그램 로딩 대기 (3초)
        await asyncio.sleep(3)

        # PDF로 저장 (헤더/푸터 없음, 배경 포함)
        await page.pdf(
            path=pdf_path,
            format="A4",
            print_background=True,
            display_header_footer=False,
            margin={
                "top": "2cm",
                "bottom": "2cm",
                "left": "2cm",
                "right": "2cm"
            }
        )

        await browser.close()

async def main():
    print("=" * 70)
    print("HTML → PDF 자동 변환 시작")
    print("=" * 70)

    success_count = 0
    fail_count = 0

    for html_file in html_files:
        html_path = os.path.join(html_dir, html_file)
        pdf_file = html_file.replace(".html", ".pdf")
        pdf_path = os.path.join(pdf_dir, pdf_file)

        file_name = Path(html_file).stem

        print(f"\n[{success_count + fail_count + 1}/{len(html_files)}] Converting: {file_name}")

        try:
            if not os.path.exists(html_path):
                print(f"    [FAIL] HTML file not found: {html_path}")
                fail_count += 1
                continue

            await convert_html_to_pdf(html_path, pdf_path)
            print(f"    [OK] Saved: {pdf_file}")
            success_count += 1

        except Exception as e:
            print(f"    [FAIL] Error: {str(e)}")
            fail_count += 1

    print("\n" + "=" * 70)
    print(f"Conversion Complete!")
    print(f"  Success: {success_count} files")
    print(f"  Failed:  {fail_count} files")
    print(f"\nPDF saved to: {pdf_dir}")
    print("=" * 70)

if __name__ == "__main__":
    asyncio.run(main())
