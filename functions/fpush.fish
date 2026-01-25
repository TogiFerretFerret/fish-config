function fpush
    # Capture the message into a variable first
    # 2>/dev/null hides the GTK warnings
    set -l msg (zenity --entry --title="Commit Message" --text="Please enter commit message:" 2>/dev/null)
    
    # Check the exit status of zenity
    # $status is 0 if you clicked OK, and 1 if you clicked Cancel/Esc
    if test $status -eq 0
        git add .
        git commit -m "$msg"
        git push
    else
        echo "Commit cancelled."
    end
end
