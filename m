From: Junio C Hamano <gitster-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Subject: Re: project wide: git config entry for [diff] renames=true
Date: Thu, 25 Sep 2014 11:53:38 -0700
Message-ID: <xmqqy4t7a5vx.fsf@gitster.dls.corp.google.com>
References: <Pine.LNX.4.44L0.1409241106100.1580-100000@iolanthe.rowland.org>
	<1411591401-5874-1-git-send-email-sojka@merica.cz>
	<1411591401-5874-4-git-send-email-sojka@merica.cz>
	<20140925150353.GA15325@kroah.com>
	<1411660111.4026.24.camel@joe-AO725> <20140925180005.GA11755@peff.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140925180005.GA11755-AdEPDUrAXsQ@public.gmane.org> (Jeff King's message of "Thu,
	25 Sep 2014 14:00:05 -0400")
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeff King <peff-AdEPDUrAXsQ@public.gmane.org>
Cc: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Michal Sojka <sojka-Knnw/vAvyUalVyrhU4qvOw@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Linux LED Subsystem <linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, michal.vokac-veUE7cmDK2A@public.gmane.org, git <git-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Jeff King <peff-AdEPDUrAXsQ@public.gmane.org> writes:

> There is no such mechanism within git. We've resisted adding one because
> of the danger of something like:
>
>   [diff]
>     external = rm -rf /
>
> diff.renames is probably safe, but any config-sharing mechanism would
> have to deal with either whitelisting, or providing some mechanism for
> the puller to review changes before blindly following them.

It might be useful to add a "safe include" feature, perhaps?  We
ship a small set of hardcoded default whitelist (diff.renames may be
included in there), and allow the user who do not want to be
affected to override it with

    [include]
        safe = !diff.renames

or even

    [config]
    	safe = !*

at the same time allow them to add what we do not hardcode to it
using the same mechanism, e.g.

    [config]
    	safe = merge.*

Then

    [include]
	safe
    	path = ../project.gitconfig

    [include]
    	path = $HOME/.gitconfig-variant1

would only allow the variables include.safe deems safe to affect
us from the in-tree file, and use everything from my personal set in
my home directory.



    	
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
