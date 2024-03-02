# !/bin/bash

notmarshaled=$1
marshalled=$(echo "$notmarshaled" | jq '.')

ScriptPassw=$(echo "$marshalled" | jq -r '.ScriptPasswd')
Login01=$(echo "$marshalled" | jq -r '.Login01')
Browser=$(echo "$marshalled" | jq -r '.Browser')
BrowserAcc=$(echo "$marshalled" | jq -r '.BrowserAcc')
BrowserAccEmail=$(echo "$marshalled" | jq -r '.BrowserAccEmail')
BrowserAccPass=$(echo "$marshalled" | jq -r '.BrowserAccPass')
GitConfigPass=$(echo "$marshalled" | jq -r '.GitConfigPass')
GitConfigUsername=$(echo "$marshalled" | jq -r '.GitConfigUsername')
GitConfigEmail=$(echo "$marshalled" | jq -r '.GitConfigEmail')
WifiOn=$(echo "$marshalled" | jq -r '.WifiOn')
WifiSSID=$(echo "$marshalled" | jq -r '.WifiSSID')
WifiPassword=$(echo "$marshalled" | jq -r '.WifiPassword')
EmailAlem01=$(echo "$marshalled" | jq -r '.EmailAlem01')
PasswordAlem01=$(echo "$marshalled" | jq -r '.PasswordAlem01')
NewSSH=$(echo "$marshalled" | jq -r '.NewSSH')
NumLock=$(echo "$marshalled" | jq -r '.NumLock')
AddRusKeyb=$(echo "$marshalled" | jq -r '.AddRusKeyb')
SetPassPK=$(echo "$marshalled" | jq -r '.SetPassPK')
PassofPK=$(echo "$marshalled" | jq -r '.PassofPK')
PauseBlock=$(echo "$marshalled" | jq -r '.PauseBlock')
SetCastomImg=$(echo "$marshalled" | jq -r '.SetCastomImg')
Path=$(echo "$marshalled" | jq -r '.Path')
CloneWorkRepo=$(echo "$marshalled" | jq -r '.CloneWorkRepo')
Links=$(echo "$marshalled" | jq -r '.Links')
GoDebugger=$(echo "$marshalled" | jq -r '.GoDebugger')
MouseAndKeybBlock=$(echo "$marshalled" | jq -r '.MouseAndKeybBlock')
BlockPKAfter=$(echo "$marshalled" | jq -r '.BlockPKAfter')




# Firt we do local operation ex: ru keyb, create ssh ...
# 
# 

# Создаем новый SSH ключ
mkdir -p ~/.ssh
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ''

# прописываем git config-и
git config --global user.name "$GitConfigUsername"
git config --global user.email "$GitConfigEmail"

# включаем wifi
nmcli device wifi hotspot ifname wlp0s20f3 ssid "$WifiSSID" password "$WifiPassword"

# Включаем Num Lock
xdotool key Num_Lock

# Добавляем русскую раскладку
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'ru')]"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Custom_Lock'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command '/home/student/reg/lock.sh'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding 'Pause'


# Opent the firefox
xdotool mousemove 50 50 click 1

firefox="WM_CLASS(STRING) = \"Navigator\", \"firefox\""
while true; do
    ident=$(xdotool getactivewindow)
    name=$(xprop -id $ident | grep firefox)

    if [ "$name" == "$firefox" ]; then
        break
    fi
done

xdotool key Super+Up

sleep 0.8
xdotool mousemove 3420 160 click 1

sleep 0.8



# Создаем новую вкладку и вставляем ссыку на 01.alem
firefox "01.alem.school"
sleep 0.5

# Днлаем закладки браузера видмыми
xdotool keydown Shift
xdotool key ctrl+b
xdotool keyup Shift

while true; do
    color=$(import -window root -crop 1x1+3200+680 -depth 8 txt:- | awk 'NR==2 {print $3}')
    if [[ "$color" == "#7D3FF8" || "$color" == "#9966FF" ]]; then
        sleep 0.2
        break
    else
        echo "$color"
        sleep 0.2
    fi
done

xdotool key Tab
xdotool key Tab
xdotool type "$EmailAlem01"

xdotool key Tab
xdotool type "$PasswordAlem01"
xdotool key Return

firefox "01.alem.school/git/user/settings/keys"


# while true; do
#     color=$(import -window root -crop 1x1+1800+280 -depth 8 txt:- | awk 'NR==2 {print $3}')
#     if [[ "$color" == "#AFAFAF" || "$color" == "#AFAFAF" ]]; then
#         sleep 0.2
#         break
#     else
#         echo "$color"
#         sleep 0.2
#     fi
# done

sleep 3

xdotool mousemove 1800 280 click 1



# diliting
start_timer() {
    SECONDS=0
}
start_timer

delite() {
    xdotool mousemove 2105 390 click 1
    sleep 0.3
    xdotool mousemove 2105 890 click 1
    sleep 0.3
    xdotool key F5
}

while [ $SECONDS -lt 3 ]; do

    while true; do
        color=$(import -window root -crop 1x1+2105+390 -depth 8 txt:- | awk 'NR==2 {print $3}')
        if [[ "$color" == "#DB2828" || "$color" == "#D01919" ]]; then
            start_timer
            delite
            sleep 0.2
            break
        else
            echo "$color"
            sleep 0.2
            break
        fi
    done

done

# adding new


while true; do
    color=$(import -window root -crop 1x1+2243+285 -depth 8 txt:- | awk 'NR==2 {print $3}')
    if [[ "$color" == "#31699F" || "$color" == "#4183C4" ]]; then
        sleep 0.2
        break
    else
        echo "$color"
        sleep 0.2
    fi
done

xdotool mousemove 2243 285 click 1

sleep 0.1

xdotool key Tab
xdotool key Tab

# 
xdotool key ctrl+t

xdotool type "$(cat /home/student/.ssh/id_ed25519.pub)"
xdotool key ctrl+a
sleep 0.1
xdotool key ctrl+c
sleep 0.1
xdotool key ctrl+w

# paste SSH to site
sleep 0.1
xdotool key ctrl+v
sleep 0.1

xdotool mousemove 1250 620 click 1





firefox "https://accounts.firefox.com/?context=fx_desktop_v3&entrypoint=fxa%3Aenter_email&service=sync&action=email"

while true; do
    color=$(import -window root -crop 1x1+1600+880 -depth 8 txt:- | awk 'NR==2 {print $3}')
    if [[ "$color" == "#0060DF" || "$color" == "#0252C0" ]]; then
        sleep 0.2
        break
    else
        echo "$color"
        sleep 0.2
    fi
done

sleep 1



xdotool type "$BrowserAccEmail"
xdotool key Return

while true; do
    color=$(import -window root -crop 1x1+1600+980 -depth 8 txt:- | awk 'NR==2 {print $3}')
    if [[ "$color" == "#0060DF" || "$color" == "#0252C0" ]]; then
        sleep 0.2
        break
    else
        echo "$color"
        sleep 0.2
    fi
done
sleep 1

xdotool type "$BrowserAccPass"
xdotool key Return

gnome-terminal 
sleep 2
xdotool type "passwd"
xdotool key Return
sleep 0.2

for ((i = 0; i < ${#PassofPK}; i++)); do
    char="${PassofPK:i:1}"
    xdotool type "$char"
done


xdotool key Return
sleep 0.2

for ((i = 0; i < ${#PassofPK}; i++)); do
    char="${PassofPK:i:1}"
    xdotool type "$char"
done

xdotool key Return
sleep 0.2
xdotool type "exit"
xdotool key Return
xdotool key Pause

