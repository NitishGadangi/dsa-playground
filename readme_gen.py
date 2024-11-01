import os
import re

def format_heading(name):
    # Convert CamelCase to spaced title case and remove underscores
    spaced_name = re.sub(r'([a-z])([A-Z])', r'\1 \2', name).replace("_", " ")
    return spaced_name.capitalize()

def generate_readme():
    readme_content = "# Project Structure\n\n"

    # Traverse current directory
    for item in os.listdir("."):
        if item.endswith(".playground") and os.path.isdir(item):
            # Format heading to title case without underscores
            heading = format_heading(item.replace(".playground", ""))
            readme_content += f"## {heading}\n\n"
            
            # Path to the 'pages' folder
            pages_path = os.path.join(item, "pages")
            
            # Check if 'pages' directory exists
            if os.path.isdir(pages_path):
                for page_folder in os.listdir(pages_path):
                    if page_folder.endswith(".xcplaygroundpage"):
                        # Remove .xcplaygroundpage suffix for list item
                        page_name = page_folder.replace(".xcplaygroundpage", "")
                        
                        # Relative path to the content.swift file
                        content_path = os.path.join(item, "pages", page_folder, "content.swift")
                        
                        # Add hyperlink to content.swift
                        readme_content += f"- [{page_name}]({content_path})\n"
            readme_content += "\n"

    # Write to README.md
    with open("README.md", "w") as readme_file:
        readme_file.write(readme_content)

    print("README.md file generated successfully!")

# Run the function
generate_readme()
