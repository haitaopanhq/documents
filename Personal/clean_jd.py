import os
import re

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Chinese variants
    content = re.sub(r'（深度匹配.*?）', '', content)
    content = re.sub(r'（按岗位匹配度排序）', '', content)
    content = re.sub(r'\(对应 JD:.*?\)', '', content)
    content = re.sub(r'（对应 JD:.*?）', '', content)

    # English variants
    content = re.sub(r'\(Tailored for.*?\)', '', content)
    content = re.sub(r'\(Tailored to.*?\)', '', content)
    content = re.sub(r'\(Matches JD:.*?\)', '', content)
    content = re.sub(r'\(Forward Deployed Engineer\)', '', content)

    # Remove extra spaces before newlines that might be left behind
    content = re.sub(r'[ \t]+\n', '\n', content)
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"Cleaned {filepath}")

for root, _, files in os.walk('.'):
    for f in files:
        if f.startswith('CV') and f.endswith('.md'):
            process_file(os.path.join(root, f))
