import os

def pde_to_puml(pde_file_path, classes):
    with open(pde_file_path, 'r') as pde_file:
        puml_lines = []
        puml_lines.append('title ' + os.path.basename(pde_file_path))
        for line in pde_file.readlines():
            if line.startswith('//'):
                puml_lines.append('note left: ' + line[2:].strip())
            elif line.startswith('void setup'):
                puml_lines.append('start')
            elif line.startswith('void draw'):
                puml_lines.append('repeat while (not done)')
            elif line.startswith('class'):
                class_name = line.split()[1].rstrip(':')
                if class_name in classes:
                    puml_lines.append(f"class {class_name} {{}}")
            elif line.startswith('}'):
                puml_lines.append('end')
            else:
                puml_lines.append(line.strip())
    return puml_lines

def get_class_names(pde_dir_path):
    class_names = []
    for pde_file_name in os.listdir(pde_dir_path):
        if pde_file_name.endswith('.pde'):
            pde_file_path = os.path.join(pde_dir_path, pde_file_name)
            with open(pde_file_path, 'r') as pde_file:
                for line in pde_file.readlines():
                    if line.startswith('class'):
                        class_name = line.split()[1].rstrip(':')
                        class_names.append(class_name)
    return class_names

def convert_all_pde_files_to_puml(pde_dir_path, puml_file_path):
    class_names = get_class_names(pde_dir_path)
    with open(puml_file_path, 'w') as puml_file:
        puml_file.write('@startuml\n')
        for pde_file_name in os.listdir(pde_dir_path):
            if pde_file_name.endswith('.pde'):
                pde_file_path = os.path.join(pde_dir_path, pde_file_name)
                puml_file.write('\n'.join(pde_to_puml(pde_file_path, class_names)) + '\n')
        puml_file.write('@enduml\n')

if __name__ == '__main__':
    convert_all_pde_files_to_puml('./', './output.puml')
