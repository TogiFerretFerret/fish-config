function update_website
    cd ~/Profile-Website;git add .; git commit -m "Site Update"; git push; for i in (seq 10); printf "." && sleep 1; end; printf "\n"; echo "Done"; cd
end
