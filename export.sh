# Define the directory where your .jar files are located
directory="folder_name"

# Loop through .jar files starting with 'tab-'
for jar_file in "$directory"/tab-*.jar; do
  # Check if the file exists and is a regular file
  if [ -f "$jar_file" ]; then
    # Get the base name of the file (without the path)
    base_name=$(basename "$jar_file")
    # Remove the '.jar' extension
    folder_name="${base_name%.jar}"
    
    # Create the output directory if it doesn't exist
    mkdir -p "$folder_name"
    
    # Extract the contents of the .jar file into the folder
    java -jar jd-cli.jar "$jar_file" -od "$folder_name" -oc
    
    echo "Extracted $jar_file to $folder_name"
  fi
done