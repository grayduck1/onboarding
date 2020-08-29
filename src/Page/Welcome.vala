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
    public class Welcome : Gtk.Box {
        public Welcome () {
            var wrapper = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
            wrapper.get_style_context ().add_class ("welcome");        	

	        // logo
	        var logo = new Gtk.Image.from_icon_name("twisteros", IconSize.DIALOG);
			logo.get_style_context().add_class ("welcome_logo");

			wrapper.add(logo);

			var welcome_label = new Label("Welcome to Twister OS!");
			welcome_label.set_property("can-focus", false);
			
			welcome_label.get_style_context ().add_class("welcome_label");

			wrapper.add(welcome_label);

	        var welcome_description = new Label ("Continue to set up some useful features.\nVisit the links below for more information about\nTwister OS.");
			welcome_description.set_line_wrap_mode(Pango.WrapMode.WORD);
			welcome_description.set_line_wrap(true);
			welcome_description.set_lines(3);
			welcome_description.set_justify(Justification.CENTER);
			welcome_description.get_style_context ().add_class("welcome_description");

			wrapper.add(welcome_description);

            var linkbutton_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
            linkbutton_box.get_style_context ().add_class ("welcome_linkbutton_box");   			

			var basic_guide = new LinkButton("https://twisteros.com/faq.html");
			basic_guide.label = "Basics Guide...";
			basic_guide.set_alignment(0, 0.5f);

			linkbutton_box.add(basic_guide);

			var community_support = new LinkButton("https://discord.gg/Fh8sjmu");
			community_support.label = "Community Support...";
			community_support.set_alignment(0, 0.5f);

			linkbutton_box.add(community_support);

			var get_involved = new LinkButton("https://discord.gg/Fh8sjmu");
			get_involved.label = "Get Involved...";
			get_involved.set_alignment(0, 0.5f);

			linkbutton_box.add(get_involved);

			wrapper.add(linkbutton_box);
       
            this.add(wrapper);
        }
    }
}