import os
import glob
import re

zh_projects = """- **AI Workspace Lab** ([GitHub](https://github.com/ai-workspace-lab)): 发起并维护面向持续交付任务的 AI 工作区组织。打造 XWorkmate，将 AI 对话、任务拆解、工具调用与产物交付整合进同一个协作流，支持团队共享、审阅与上下文继承。
- **AI Workspace Infra** ([GitHub](https://github.com/ai-workspace-infra)): 主导建设云原生基础设施与 AI 工作区底座，提供面向多云环境的一体化 DevOps/GitOps 工具集，整合 Gitea、Vault、Zitadel 及可观测平台，实现平台服务的声明式管理。
- **AI Workspace Services** ([GitHub](https://github.com/ai-workspace-services)): 构建并维护真实业务运行的服务底座，聚合统一控制台、身份认证以及海外 AI 服务加速与跨网互联，支撑核心产品的高效运行。"""

en_projects = """- **AI Workspace Lab** ([GitHub](https://github.com/ai-workspace-lab)): Founder and maintainer of an AI workspace designed for continuous task delivery. Developed XWorkmate, turning AI conversations into chained tool execution and verifiable delivery flows with multi-agent context inheritance.
- **AI Workspace Infra** ([GitHub](https://github.com/ai-workspace-infra)): Core contributor to cloud-native foundations for AI workspaces. Built a unified DevOps/GitOps toolkit integrating Gitea, Vault, Zitadel, and global observability for declarative multi-cloud infrastructure management.
- **AI Workspace Services** ([GitHub](https://github.com/ai-workspace-services)): Engineered the production service backbone, unifying the control panel, account/auth services, and global cross-network connectivity to power AI workloads and platform observability."""

def process_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Step 1: Remove existing specific projects
    # We remove blocks that start with - **XConfig**, - **XCloudFlow**, - **XScopeHub**
    # and also remove - **AI Workspace Infra** if it was added previously to avoid duplicates.
    
    # We will match the bullet and any subsequent indented lines or lines that don't start with "- " or "#"
    pattern = r'- \*\*(?:XConfig|XCloudFlow|XScopeHub|AI Workspace Infra)\*\*.*?(?=\n- |\n#|\Z)'
    
    # We find where these bullets are, and we'll insert the new ones at the location of the first match.
    matches = list(re.finditer(pattern, content, flags=re.DOTALL))
    if not matches:
        # If no open source projects found, just return (or replace mentions only)
        pass
    else:
        # Insert the new projects at the position of the first matched bullet
        insert_pos = matches[0].start()
        is_zh = 'ZH' in filepath
        new_text = zh_projects if is_zh else en_projects
        
        # Now remove all matches from the content
        # We process in reverse order so indices don't shift
        for match in reversed(matches):
            content = content[:match.start()] + content[match.end():]
        
        # Now insert the new_text at insert_pos
        # Note: we need to adjust insert_pos if any previous matches were before it, 
        # but since we insert at the first match's position, and we removed matches, 
        # the position remains the same for the insertion.
        content = content[:insert_pos] + new_text + "\n" + content[insert_pos:]

    # Step 2: Clean up the summary mentions at the top of the file
    content = re.sub(r'\(XCloudFlow\s*[/,]\s*XConfig\)', '(AI Workspace)', content)
    content = re.sub(r'\(XConfig\s*[/,]\s*XScopeHub\)', '(AI Workspace)', content)
    content = re.sub(r'XCloudFlow\s*[/,]\s*XConfig', 'AI Workspace', content)
    content = re.sub(r'XConfig\s*[/,]\s*XScopeHub', 'AI Workspace', content)
    
    content = re.sub(r'\bXCloudFlow\b', 'AI Workspace', content)
    content = re.sub(r'\bXConfig\b', 'AI Workspace', content)
    content = re.sub(r'\bXScopeHub\b', 'AI Workspace', content)
    
    # Remove any stray newlines created during replacement
    content = re.sub(r'\n{3,}', '\n\n', content)

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"Processed {filepath}")

for root, _, files in os.walk('.'):
    for f in files:
        if f.startswith('CV') and f.endswith('.md'):
            process_file(os.path.join(root, f))
