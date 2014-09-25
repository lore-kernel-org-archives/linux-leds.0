From: Junio C Hamano <gitster@pobox.com>
Subject: Re: project wide: git config entry for [diff] renames=true
Date: Thu, 25 Sep 2014 11:43:27 -0700
Message-ID: <xmqq61gbbkxc.fsf@gitster.dls.corp.google.com>
References: <Pine.LNX.4.44L0.1409241106100.1580-100000@iolanthe.rowland.org>
	<1411591401-5874-1-git-send-email-sojka@merica.cz>
	<1411591401-5874-4-git-send-email-sojka@merica.cz>
	<20140925150353.GA15325@kroah.com>
	<1411660111.4026.24.camel@joe-AO725> <20140925180005.GA11755@peff.net>
	<1411668391.3460.2.camel@joe-AO725>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp.pobox.com ([208.72.237.35]:64496 "EHLO smtp.pobox.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752317AbaIYSna (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 25 Sep 2014 14:43:30 -0400
In-Reply-To: <1411668391.3460.2.camel@joe-AO725> (Joe Perches's message of
	"Thu, 25 Sep 2014 11:06:31 -0700")
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: Jeff King <peff@peff.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Sojka <sojka@merica.cz>, linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Bryan Wu <cooloney@gmail.com>, Felipe Balbi <balbi@ti.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-kernel@vger.kernel.org, michal.vokac@comap.cz, git <git@vger.kernel.org>

Joe Perches <joe@perches.com> writes:

> On Thu, 2014-09-25 at 14:00 -0400, Jeff King wrote:
> ...
>> diff.renames is probably safe, but any config-sharing mechanism would
>> have to deal with either whitelisting, or providing some mechanism for
>> the puller to review changes before blindly following them.
>
> Another mechanism might be to add a repository
> top level .gitconfig and add whatever to that.

That could be smaller half of an implementation detail of one of the
two possibilities Jeff mentioned i.e. "mechanism for the puller to
review changes before blindly following".  It gives the transfer
part.  You still need a new mechanism to make that file that is
tracked in the repository to be used as part of your configuration
variable set after letting the puller to review and approve.

A puller who blindly trust the project could use the "include"
mechanism from your .git/config to include a file with a well-known
name that is tracked by the project _without_ review or approval.  I
doubt we would recommend that in an open source setting, though.
