import os
import re

def format_heading(name):
    # Convert CamelCase to spaced title case and remove underscores
    spaced_name = re.sub(r'([a-z])([A-Z])', r'\1 \2', name).replace("_", " ")
    return spaced_name.capitalize()

def extract_leetcode_link(content_file_path):
    # Extract the first hyperlink from a line starting with //
    try:
        with open(content_file_path, 'r') as content_file:
            for line in content_file:
                line = line.strip()
                if line.startswith("//"):
                    return line[2:].strip()  # Remove // and strip extra whitespace
    except FileNotFoundError:
        pass
    return ""  # Return empty if no link found

def generate_readme():
    readme_content = "# Lists of Problems Solved\n\n"

    # Traverse current directory
    for item in os.listdir("."):
        if item.endswith(".playground") and os.path.isdir(item):
            # Format heading to title case without underscores
            heading = format_heading(item.replace(".playground", ""))
            readme_content += f"## {heading}\n\n"
            
            # Add table header
            readme_content += "| S.No | Title | LeetCode Link | Solution |\n"
            readme_content += "|------|-------|----------|----------------|\n"
            
            # Path to the 'pages' folder
            pages_path = os.path.join(item, "Pages")
            print(pages_path)
            
            # Check if 'pages' directory exists
            if os.path.isdir(pages_path):
                for index, page_folder in enumerate(os.listdir(pages_path), start=1):
                    if page_folder.endswith(".xcplaygroundpage"):
                        # Remove .xcplaygroundpage suffix for list item
                        page_name = page_folder.replace(".xcplaygroundpage", "")
                        
                        # Relative path to the content.swift file with spaces replaced by %20
                        content_file_path = os.path.join(item, "Pages", page_folder, "Contents.swift")
                        content_file_link = content_file_path.replace(" ", "%20")
                        
                        # Extract the LeetCode link from the first comment
                        leetcode_link = extract_leetcode_link(content_file_path)
                        
                        # Format LeetCode link as hyperlink if available
                        leetcode_link_formatted = f"[Problem]({leetcode_link})" if leetcode_link else "N/A"
                        
                        # Add row with serial number, title, solution link, and leetcode problem link
                        readme_content += f"| {index} | {page_name} | {leetcode_link_formatted} | [Solution]({content_file_link}) |\n"
            readme_content += "\n"

    # Write to README.md
    with open("README.md", "w") as readme_file:
        readme_file.write(readme_content)

    print("README.md file generated successfully!")

# Run the function
generate_readme()
