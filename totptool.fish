
# Copyright (c) 2021 Erin Hensel
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

set -l commands add gen list
set totptool_name totptool

if not set -q TOTP_BASE
    set TOTP_BASE $HOME/.2fa
end

function get_services
    for f in (ls $TOTP_BASE/*.gpg)
        echo (basename $f .gpg)
    end    
end

complete -c $totptool_name -f

complete -c $totptool_name \
    -n "not __fish_seen_subcommand_from $commands" \
    -a "add gen list"

complete -c $totptool_name \
    -n "__fish_seen_subcommand_from gen" \
    -a '(get_services)'

complete -c $totptool_name \
    -n "not __fish_seen_subcommand_from --scriptable" \
    -a "--scriptable" -d "Produce script-friendly output"

