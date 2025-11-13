"""
HTML 파일의 Mermaid 다이어그램 태그를 <pre>에서 <div>로 변경
"""
import re
from pathlib import Path

# 수정할 파일 경로
html_dir = Path(r"C:\Users\유석\Desktop\LYSS_LGU\Fetpal_project3\_스프린트발표\4차스프린트발표_251114(금)\html_preview")

# 수정할 파일 목록
files_to_fix = [
    "08_RAG-LLM_시스템_정의서.html",
    "09_성능_평가_결과서.html",
    "10_Supabase_BaaS_가이드.html"
]

def fix_mermaid_tags(content):
    """Mermaid 태그 수정"""
    # <pre class="mermaid">를 <div class="mermaid">로 변경
    content = content.replace('<pre class="mermaid">', '<div class="mermaid">')

    # </pre></p>를 </div>로 변경 (잘못된 닫기 태그)
    content = re.sub(r'</pre></p>', '</div>', content)

    # </pre>를 </div>로 변경 (mermaid 블록 종료)
    # 단, <pre><code> 블록은 건드리지 않음
    def replace_mermaid_closing(match):
        # 이전 컨텍스트를 확인해서 mermaid 블록인 경우만 변경
        before = match.string[:match.start()]
        if '<div class="mermaid">' in before[-500:]:  # 최근 500자 내 확인
            # </code></pre> 패턴이 아닌 경우만 변경
            if not match.string[match.start()-7:match.start()] == '</code>':
                return '</div>'
        return match.group(0)

    # <p>...</p> 태그로 잘못 감싸진 부분 제거
    # Mermaid 다이어그램 내부의 <p> 태그 제거
    lines = content.split('\n')
    fixed_lines = []
    in_mermaid = False

    for line in lines:
        if '<div class="mermaid">' in line:
            in_mermaid = True
            fixed_lines.append(line)
        elif '</div>' in line and in_mermaid:
            in_mermaid = False
            fixed_lines.append(line)
        elif in_mermaid:
            # Mermaid 블록 안에서 <p> 태그 제거
            line = line.replace('<p>', '').replace('</p>', '')
            fixed_lines.append(line)
        else:
            fixed_lines.append(line)

    return '\n'.join(fixed_lines)

def main():
    print("=" * 70)
    print("Mermaid 태그 수정 시작")
    print("=" * 70)

    success_count = 0
    fail_count = 0

    for filename in files_to_fix:
        file_path = html_dir / filename
        print(f"\n[{success_count + fail_count + 1}/{len(files_to_fix)}] Processing: {filename}")

        try:
            if not file_path.exists():
                print(f"    [FAIL] File not found: {file_path}")
                fail_count += 1
                continue

            # 파일 읽기
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()

            # 수정
            original_size = len(content)
            fixed_content = fix_mermaid_tags(content)

            # 파일 쓰기
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(fixed_content)

            print(f"    [OK] Fixed: {filename}")
            print(f"    Size: {original_size} -> {len(fixed_content)} bytes")
            success_count += 1

        except Exception as e:
            print(f"    [FAIL] Error: {str(e)}")
            fail_count += 1

    print("\n" + "=" * 70)
    print(f"수정 완료!")
    print(f"  Success: {success_count} files")
    print(f"  Failed:  {fail_count} files")
    print("=" * 70)

if __name__ == "__main__":
    main()
