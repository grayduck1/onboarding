/*
* Copyright (c) 2011-2020 NotificationCenter
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Kris Henriksen <krishenriksen.work@gmail.com>
*/

using Gtk;

namespace OnBoarding {
    public class ReadyToGo : Gtk.Box {
        public ReadyToGo () {
            var wrapper = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
            wrapper.get_style_context ().add_class ("readytogo");        	

	        // logo
	        var logo = new Gtk.Image.from_icon_name("twisteros", IconSize.DIALOG);
			logo.get_style_context().add_class ("welcome_logo");

			wrapper.add(logo);

			var welcome_label = new Label("Ready to Go");
			welcome_label.set_property("can-focus", false);
			
			welcome_label.get_style_context ().add_class("welcome_label");

			wrapper.add(welcome_label);

	        var welcome_description = new Label ("Enjoy using Twister OS! You can always visit\nSystem Settings to set up hardware or\nchange your preferences.");
			welcome_description.set_line_wrap_mode(Pango.WrapMode.WORD);
			welcome_description.set_line_wrap(true);
			welcome_description.set_lines(3);
			welcome_description.set_justify(Justification.CENTER);
			welcome_description.get_style_context ().add_class("welcome_description");

			wrapper.add(welcome_description);

			var button = new Gtk.Button.with_label ("Choose Your Theme...");
			button.get_style_context().add_class ("readytogo_button");
			button.clicked.connect (() => {
		        try {
		        	GLib.AppInfo info = AppInfo.create_from_commandline("themetwister", null, AppInfoCreateFlags.SUPPORTS_STARTUP_NOTIFICATION);
		        	info.launch(null,Gdk.Display.get_default().get_app_launch_context());
		        } catch (GLib.Error e){warning ("Could not load ThemeSwitcher: %s", e.message);}
			});

			wrapper.add(button);			
       
            this.add(wrapper);
        }
    }
}
